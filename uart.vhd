library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity uart is
    Port ( clk : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (7 downto 0);	-- Data to send to the RS232 port
           dataout : out  STD_LOGIC_VECTOR (7 downto 0);	-- Data recieved from the RS232 port
           dataInValid : in  STD_LOGIC;	-- Assert to write data from 'datain'
			  rd_req : out STD_LOGIC;	-- Assert after a byte is read from 'datain'
			  wr_req : out STD_LOGIC;	-- Assert when a byte is written to 'dataout'
			  uart_rx : in STD_LOGIC;	-- RS232 signal from PC
			  uart_tx : out STD_LOGIC;	-- RS232 signal to PC
			  debug : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end uart;

architecture Behavioral of uart is
	signal clkDiv: integer;
	signal txInProgress: std_logic;
	signal dataToTx: std_logic_vector(7 downto 0);

	signal baudCounter: integer;
	signal baudCounterRx: integer;
	signal stateRx: integer := 0;
	signal rxCounter: integer :=0;
	signal rx: std_logic_vector(7 downto 0);
begin

-- Tx side
process(clk)
begin
	if rising_edge(clk) then
		if (dataInValid = '1' and txInProgress = '0') then
			-- There's a new bit to transmit, and the line is idle, so we can transmit it.
			-- Capture it in to our buffer, and advance the FIFO to the next byte.
			txInProgress <= '1';
			dataToTx <= dataIn;
			rd_req <= '1';
		else
			rd_req <= '0';
		end if;
		
		if (txInProgress = '0') then
			-- Not much going on. Reset our counters and idle our line.
			clkDiv <= 0;
			baudCounter <= 0;
			uart_tx <= '1';					
		else
			if (clkDiv = 434) then
				-- OK, new bit!
				clkDiv <= 0;
				baudCounter <= baudCounter + 1;
				case baudCounter is
					when 0 => uart_tx <= '0';		-- Start bit
					when 1 => uart_tx <= dataToTx(0);
					when 2 => uart_tx <= dataToTx(1);
					when 3 => uart_tx <= dataToTx(2);
					when 4 => uart_tx <= dataToTx(3);
					when 5 => uart_tx <= dataToTx(4);
					when 6 => uart_tx <= dataToTx(5);
					when 7 => uart_tx <= dataToTx(6);
					when 8 => uart_tx <= dataToTx(7);
					when 9 => uart_tx <= '1';		-- Stop bit
					when others =>
						txInProgress <= '0';
				end case;
			else
				clkDiv <= clkDiv + 1;
			end if;
		end if;
	end if;
end process;

-- Rx side
process(clk, stateRx, rxCounter, uart_rx)
begin
	if rising_edge(clk) then
		if (stateRx = 0) then
				-- init
				wr_req <= '0';
				rxCounter <= 0;

				-- Wait for a start bit
				if (uart_rx = '0') then
					stateRx <= 1;
				end if;		
		end if;
	
		if (stateRx = 1) then
			-- OK, a transmission has just started.
			-- Advance a half baud so we're in the middle of the incoming bit and can sample there.
			if (rxCounter = 217) then
				stateRx <= 2;
				rxCounter <= 0;
				baudCounterRx <= 0;
			else
				rxCounter <= rxCounter + 1;
			end if;
		end if;

		if (stateRx = 2) then
				-- Bits are being recieved.
				-- Wait for a bit time, and then sample.
				if (rxCounter = 434) then
					if (baudCounterRx = 0) then
						rx(0) <= uart_rx;
					end if;
					if (baudCounterRx = 1) then
						rx(1) <= uart_rx;
					end if;
					if (baudCounterRx = 2) then
						rx(2) <= uart_rx;
					end if;
					if (baudCounterRx = 3) then
						rx(3) <= uart_rx;
					end if;
					if (baudCounterRx = 4) then
						rx(4) <= uart_rx;
					end if;
					if (baudCounterRx = 5) then
						rx(5) <= uart_rx;
					end if;
					if (baudCounterRx = 6) then
						rx(6) <= uart_rx;
					end if;
					if (baudCounterRx = 7) then
						rx(7) <= uart_rx;
					end if;
					if (baudCounterRx = 8) then
						-- We're in the middle of our stop bit - we can finish up.
						stateRx <= 3;
					end if;

					baudCounterRx <= baudCounterRx + 1;
					rxCounter <= 0;
				else
					rxCounter <= rxCounter + 1;
				end if;
				
		end if;

		if (stateRx = 3) then
			-- OK, we have a full byte!
			wr_req <= '1';
			dataout <= rx;

			stateRx <= stateRx + 1;
			debug <= rx(3 downto 0);
		end if;

		if (stateRx = 4) then
			wr_req <= '0';
			stateRx <= 0;
		end if;
		
	end if;
end process;

end Behavioral;

