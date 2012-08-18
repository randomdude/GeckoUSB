-- newexi.vhd	
--------------------------------------------------------------------------------
--
--
-- File: usbexi.vhd
-- Version: 0.1 Start date 01/07/2010
--
-- Description: 
--
-- USB EXI
--
-- Targeted device: Proasic3  AP3125
-- Author: Ian Callaghan, modified by Aliz Hammond
--
--------------------------------------------------------------------------------
-- library definitions
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Main entity
entity usbexi is
port (
-- PC host
    usb_txe : in std_logic;
    usb_rxf : in std_logic;
    usb_rd : out std_logic;
    usb_wr : out std_logic;
    usb_data_out : out std_logic_vector(7 downto 0);
    usb_data_in : in std_logic_vector(7 downto 0);
	 fastclk : in std_logic;
-- GC
    exi_cs : in std_logic;
    exi_clk : in std_logic;
    exi_do : in std_logic;
    exi_di : out std_logic;
    exi_int : in std_logic;
-- Other
    led : out std_logic;
    debug : out std_logic_vector(7 downto 0)
);

end usbexi;

architecture arch_usbexi of usbexi is
attribute syn_black_box : boolean;
attribute syn_encoding : string;

signal usb_read_mode_set : std_logic;
signal usb_write_mode_set : std_logic;
signal id_mode_set : std_logic;
signal usb_tx_status_set : std_logic;
signal usb_rx_status_set : std_logic;
signal usb_short_receive_set : std_logic;

signal exi_usb_data_in : std_logic_vector(7 downto 0);
signal exi_usb_data_in1 : std_logic_vector(7 downto 0);
signal exi_read_buffer : std_logic_vector(7 downto 0);
signal exi_read_buffer2 : std_logic_vector(7 downto 0);
signal led_state : std_logic := '0';
signal exi_count : integer;
signal exi_cmd : std_logic_vector(3 downto 0);
signal usb_short_send_set : std_logic;
signal sixteenBitCmd : std_logic;
signal eightBitCmd : std_logic;
signal lastExiClk : std_logic;
signal lastExiClkCtr : integer;
signal rst : std_logic;

----------------------------------------------------------------
begin
----------------------------------------------------------------

	led <= led_state;

----------------------------------------------------------------
-- Main State Machine
----------------------------------------------------------------

process (fastclk, exi_clk, rst, exi_cs, exi_do, exi_cmd, exi_count)

begin
	
	-- If it's been a while since any transitions on the EXI clock, then assume that the GC has stopped
	-- the EXI clock. Under this circumstance, we should fire the async reset to our logic.
	if rising_edge(fastclk) then
		if (exi_clk = lastExiClk) then
			lastExiClkCtr <= lastExiClkCtr + 1;
		else
			lastExiClk <= exi_clk;
			lastExiClkCtr <= 0;
		end if;
		
		if (lastExiClkCtr = 7) then
			rst <= '1';
		else
			rst <= '0';
		end if;
	end if;

	if(rst = '1') then
		exi_count <= 0;
		exi_usb_data_in <= (others => '0');
		exi_usb_data_in1 <= (others => '0');
		exi_read_buffer <= (others => '0');
		exi_read_buffer2 <= (others => '0');
		exi_cmd <= (others => '0');
		usb_rd <= '0';
		usb_wr <= '0';
		usb_read_mode_set <= '0';
		usb_write_mode_set <= '0';
		usb_tx_status_set <= '0';
		usb_rx_status_set <= '0';
		usb_short_send_set <= '0';
		usb_short_receive_set <= '0';
		sixteenBitCmd <= '0';
		eightBitCmd <= '0';
		id_mode_set <= '0';
		exi_di <= '0';
	elsif rising_edge(exi_clk) then
		if(exi_cs = '1') then
			exi_count <= 0;
			exi_usb_data_in <= (others => '0');
			exi_usb_data_in1 <= (others => '0');
			exi_read_buffer <= (others => '0');
			exi_read_buffer2 <= (others => '0');
			exi_cmd <= (others => '0');
			usb_rd <= '0';
			usb_wr <= '0';
			usb_read_mode_set <= '0';
			usb_write_mode_set <= '0';
			usb_tx_status_set <= '0';
			usb_rx_status_set <= '0';
			usb_short_send_set <= '0';
			usb_short_receive_set <= '0';
			sixteenBitCmd <= '0';
			eightBitCmd <= '0';
			id_mode_set <= '0';
			exi_di <= '0';
		else
			exi_count <= exi_count + 1;

			-- Identify ourselves to the EXI by sending 0x0470. Note that the first two bits are already sent
			-- - the first is implicitly zero, and the second is set when id_mode_set is set to 1.
			if(id_mode_set = '1') then
				case exi_count is
					-- Bit 1 set at exi_count 4 if the relevant command is detected
					when  5 =>	exi_di <= '0'; -- 2
					when  6 =>	exi_di <= '0'; -- 3
					when  7 =>	exi_di <= '0'; -- 4
					when  8 =>	exi_di <= '1'; -- 5
					when  9 =>	exi_di <= '1'; -- 6
					when 10 =>	exi_di <= '1'; -- 7
					when 11 =>	exi_di <= '0'; -- 8
					when 12 =>	exi_di <= '0'; -- 9
					when 13 =>	exi_di <= '0'; -- 10
					when 14 =>	exi_di <= '0'; -- 11
					when others =>
				end case;
			end if;

			-- Read a single bit from the RS232 FIFO and deliver it to the EXI bus.
			if(usb_read_mode_set = '1') then
				case exi_count is
					when  4 =>	exi_di <= '0';		-- Clear our 'read OK' bit
					when  5 =>	exi_di <= '0';
					when  6 =>	exi_di <= '0';
					when  7 =>	exi_di <= exi_usb_data_in(7);
					when  8 =>	exi_di <= exi_usb_data_in(6);
					when  9 =>	exi_di <= exi_usb_data_in(5);
					when 10 =>	exi_di <= exi_usb_data_in(4);
					when 11 =>	exi_di <= exi_usb_data_in(3);
					when 12 =>	exi_di <= exi_usb_data_in(2);
					when 13 =>	exi_di <= exi_usb_data_in(1);
					when 14 =>	exi_di <= exi_usb_data_in(0);
									exi_count <= 0;
					when others =>
				end case;
			end if;

			-- Send two bytes from the RS232 to the EXI.
			if(usb_short_receive_set = '1') then
				case exi_count is
					when  4 =>	exi_di <= '0';		-- Clear our 'read OK' bit
					when  5 =>	exi_di <= '0';
					when  6 =>	exi_di <= '0';
					when  7 =>	exi_di <= '0';
					when  8 =>	exi_di <= '0';
					when  9 =>	exi_di <= '0';
					when 10 =>	exi_di <= '0';
					when 11 =>	exi_di <= '0';
					when 12 =>	exi_di <= '0';
					when 13 =>	exi_di <= '0';
					when 14 =>	exi_di <= '0';
					when 15 =>	exi_di <= exi_usb_data_in(7); 
					when 16 =>	exi_di <= exi_usb_data_in(6); 
					when 17 =>	exi_di <= exi_usb_data_in(5); 
					when 18 =>	exi_di <= exi_usb_data_in(4); 
					when 19 =>	exi_di <= exi_usb_data_in(3); 
					when 20 =>	exi_di <= exi_usb_data_in(2); 
					when 21 =>	exi_di <= exi_usb_data_in(1); 
					when 22 =>	exi_di <= exi_usb_data_in(0); 
									-- Since we'll need the second byte soon, get that from the FIFO
									exi_usb_data_in(7 downto 0) <= usb_data_in(7 downto 0);
									usb_rd <= '1';
					when 23 =>	-- And then clear the FIFO advance.
									usb_rd <= '0';
									exi_di <= exi_usb_data_in(7); 
					when 24 =>	exi_di <= exi_usb_data_in(6); 
					when 25 =>	exi_di <= exi_usb_data_in(5); 
					when 26 =>	exi_di <= exi_usb_data_in(4); 
					when 27 =>	exi_di <= exi_usb_data_in(3); 
					when 28 =>	exi_di <= exi_usb_data_in(2); 
					when 29 =>	exi_di <= exi_usb_data_in(1); 
					when 30 =>	exi_di <= exi_usb_data_in(0); 
									exi_count <= 0;
					when others =>
				end case;
			end if;

			-- Send a single bye from EXI to RS232. 
			if(usb_write_mode_set = '1') then
				case exi_count is
					-- Bit 7 was captured by the command decode logic
					when  5 =>	exi_di <= '0';		-- Clear our 'write OK' bit
									exi_read_buffer(6) <= exi_do;
					when  6 =>	exi_read_buffer(5) <= exi_do;
					when  7 =>	exi_read_buffer(4) <= exi_do;
					when  8 =>	exi_read_buffer(3) <= exi_do;
					when  9 =>	exi_read_buffer(2) <= exi_do;
					when 10 =>	exi_read_buffer(1) <= exi_do;
					when 11 =>	exi_read_buffer(0) <= exi_do;
					when 12 => 	
						-- OK, we have got a whole byte from the EXI bus. We should now send this byte to
						-- the RS232 output port.
						usb_wr <= '1';
						usb_data_out(7 downto 0) <= exi_read_buffer;
						-- Note that, since our data comes in bitshifted left by 4 bits, we should wait for
						-- four bits before the command finishes. This also means we do our own clean-up of
						-- the usb_wr signal.
					when 13 =>
						usb_wr <= '0';
					when 14 =>
					when 15 =>
						exi_count <= 0;
					when others =>
				end case;
			end if;

			-- This command will send two bytes from the EXI to the RS232.
			if (usb_short_send_set = '1') then
				case exi_count is
					-- Here, we capture the first byte and send it to the RS232 port.
					-- Bit 7 has already been captured by the instruction decode logic.
					when  5 =>	exi_di <= '0';		-- Clear our 'write OK' bit
									exi_read_buffer(6) <= exi_do;
					when  6 =>	exi_read_buffer(5) <= exi_do;
					when  7 =>	exi_read_buffer(4) <= exi_do;
					when  8 =>	exi_read_buffer(3) <= exi_do;
					when  9 =>	exi_read_buffer(2) <= exi_do;
					when 10 =>	exi_read_buffer(1) <= exi_do;
					when 11 =>	exi_read_buffer(0) <= exi_do;
					when 12 => 	
						-- OK, we have got a whole byte from the EXI bus. We should now send this byte to
						-- the RS232 output port.
						usb_wr <= '1';
						usb_data_out(7 downto 0) <= exi_read_buffer;
						
						-- Also, begin to read the second byte of payload from EXI.
						exi_read_buffer2(7) <= exi_do;
					when 13 =>
						-- Finish our RS232 write
						usb_wr <= '0';
				
						-- And read the second bit of the second byte.
						exi_read_buffer2(6) <= exi_do;
					when 14 => exi_read_buffer2(5) <= exi_do;
					when 15 => exi_read_buffer2(4) <= exi_do;
					when 16 => exi_read_buffer2(3) <= exi_do;
					when 17 => exi_read_buffer2(2) <= exi_do;
					when 18 => exi_read_buffer2(1) <= exi_do;
					when 19 => exi_read_buffer2(0) <= exi_do;
					when 20 =>
						-- Send this second byte to the RS232 port.
						usb_wr <= '1';
						usb_data_out <= exi_read_buffer2;
						-- And restart the state machine.
						exi_count <= 0;
					when others => 
					end case;
			end if;

			-- These two commands, to interrogate RX/TX buffer status, will have had their response sent 
			-- already when the command was identified. Here, we set the other bits, and end the command.
			if(usb_rx_status_set = '1' or usb_tx_status_set = '1') then
				case exi_count is
					when 5 =>	exi_di <= '0';
					when 6 =>	exi_di <= '0';
					when 7 =>	exi_di <= '0';
					when 8 =>	exi_di <= '0';
					when 9 =>	exi_di <= '0';
					when 10 =>	exi_di <= '0';
					when 11 =>	exi_di <= '0';
					when 12 =>	exi_di <= '0';
					when 13 =>	exi_di <= '0';
					when 14 =>	exi_di <= '0';
					when 15 =>	exi_di <= '0';
									exi_count <= 0;
					when others =>
				end case;
			end if;
			
			-- Instruction decide state machine.
			-- Observe the first four, or five, bits of the EXI command, and set the appropriate command
			-- flag. Do any reset (other flags, etc) first.
			case exi_count is
				when 0 =>

					-- Store the first EXI command bit
					exi_cmd(3) <= exi_do;
					exi_di <= '0';
					
					-- Reset any previously in-progress commands
					usb_read_mode_set <= '0';
					usb_write_mode_set <= '0';
					usb_tx_status_set <= '0';
					usb_rx_status_set <= '0';
					usb_short_send_set <= '0';
					usb_short_receive_set <= '0';
					id_mode_set <= '0';
					sixteenBitCmd <= '0';
					eightBitCmd <= '0';
					-- and return any RS232 signals to inactive if necessary.
					usb_wr <= '0';
					usb_rd <= '0';

				when 1 =>	exi_cmd(2) <= exi_do;
				when 2 =>	exi_cmd(1) <= exi_do;
				when 3 =>	exi_cmd(0) <= exi_do;

					-- Decode any command we have. Read data from the RS232 FIFO if needed, and advance it by
					-- setting usb_rd.
					-- Note the clumsy 'exicmd(..) & exi_do' - this is because the last exi_cmd write has not
					-- yet taken place.
					if( (exi_cmd(3 downto 1) & exi_do) = x"A") then	-- 'A' receive byte from PC
						if(usb_rxf = '0') then                		-- are we OK to read?
							exi_di <= '1';                      	-- We are. tell the wii
							usb_read_mode_set <= '1';
							usb_rd <= '1';
							exi_usb_data_in(7 downto 0) <= usb_data_in(7 downto 0);
							sixteenBitCmd <= '1';
						end if;
					elsif( (exi_cmd(3 downto 1) & exi_do) = x"4") then	-- '4' receive 2 bytes from PC
						if(usb_rxf = '0') then                  	-- are we OK to read?
							exi_di <= '1';                      	-- We are. tell the wii
							usb_short_receive_set <= '1';
							usb_rd <= '1';
							exi_usb_data_in(7 downto 0) <= usb_data_in(7 downto 0);
							sixteenBitCmd <= '0';	-- This transaction is more than 16 bits long.
						end if;
					elsif( (exi_cmd(3 downto 1) & exi_do) = x"E") then	-- 'E' send / receive
						if(usb_rxf = '0') then                  	-- are we OK to read?
							exi_di <= '1';                      	-- We are. tell the wii,but dont set mode
							usb_read_mode_set <= '1';
							usb_rd <= '1';
							exi_usb_data_in(7 downto 0) <= usb_data_in(7 downto 0);
							sixteenBitCmd <= '1';
						end if;
					end if; 
				when 4 =>

					-- clear any FIFO fetch we set going above
					usb_rd <= '0';

					if(exi_cmd = x"B") then					-- 'B' send byte to PC
						if(usb_txe = '0') then				-- can we write?
							exi_di <= '1';						-- yes we can. Tell the wii
							usb_write_mode_set <= '1';
							sixteenBitCmd <= '1';
							exi_read_buffer(7) <= exi_do;
						end if;
					elsif(exi_cmd = x"C") then	-- 'C' check TX status
						-- Check TX status, setting exi_di if we can accept at least one more transfer. Note 
						-- that, since the next command may attempt to write two bytes, it is only safe to 
						-- report success if at least _two_ bytes of storage space are free.
						if(usb_txe = '0') then	
							-- We're OK to write.
							exi_di <= '1';
						end if;
						usb_tx_status_set <= '1';
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"7") then		-- '7' LED off
						led_state <= '1';
						exi_di <= '0';
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"8") then		-- '8' LED on
						led_state <= '0';
						exi_di <= '0';
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"9") then		-- '9' ID
						id_mode_set <= '1';
						exi_di <= '1';
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"D") then		-- '6' receive rx status
						-- Check RX status, and set exi_di if at least one byte is waiting to go on to the EXI
						-- bus.
						if(usb_rxf = '0') then
							-- Data is pending.
							exi_di <= '1';
						end if;  
						usb_rx_status_set <= '1';
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"E") then		-- 'E' send / receive
						if(usb_txe = '0') then		-- are we OK to read?
							exi_di <= '1';				-- Yes we are. tell the wii
							usb_write_mode_set <= '1';
						end if; 
						sixteenBitCmd <= '1';
					elsif(exi_cmd = x"5") then 	-- '5' Send short
						if(usb_txe = '0') then
							exi_di <= '1';
							usb_short_send_set <= '1';
							exi_read_buffer(7) <= exi_do;
						end if;
						sixteenBitCmd <= '0';	-- This transaction is 16 bits long.
					-- The following are GC commands we don't support, but need to define the length of so that
					-- we can ignore them.
					elsif(exi_cmd = x"0") then
						eightBitCmd <= '1';
					elsif(exi_cmd = x"F") then
						eightBitCmd <= '1';
					end if;

					when 7 =>
						-- Terminate the command, if it is eight bits long
						if (eightBitCmd = '1') then
							exi_count <= 0;
						end if;

					when 15 =>
						if (sixteenBitCmd = '1') then
							-- These commands use only 16 bits of EXI clock.
							exi_count <= 0;
						end if;

					-- If an unknown command is recieved, or a command is sent which cannot be fulfilled (eg
					-- if the FIFO is full), then end the command after 30 bits.
					when 31 => 
						exi_count <= 0;
					when others =>
			end case;

		end if;
	end if; -- exi_cs
end process;

end arch_usbexi;