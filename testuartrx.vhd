LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testuartrx IS
END testuartrx;
 
ARCHITECTURE behavior OF testuartrx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart
    PORT(
         clk : IN  std_logic;
         dataIn : IN  std_logic_vector(7 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0);
         dataInValid : IN  std_logic;
         rd_req : OUT  std_logic;
         wr_req : OUT  std_logic;
         uart_rx : IN  std_logic;
         uart_tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal wr : std_logic := '0';
   signal rxf : std_logic := '0';
   signal txe : std_logic := '0';
   signal uart_rx : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(7 downto 0);
   signal debug : std_logic_vector(7 downto 0);
   signal rd_req : std_logic;
   signal wr_req : std_logic;
   signal dbg_baud : std_logic;
   signal uart_tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart PORT MAP (
          clk => clk,
          dataIn => data,
          dataout => dataout,
          dataInValid => wr,
          rd_req => rd_req,
          wr_req => wr_req,
          uart_rx => uart_rx,
          uart_tx => uart_tx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		uart_rx <= '1';
      wait for clk_period*10;

		-- start bit
		uart_rx <= '0';
      wait for 104 us;

		--data bit 0
		uart_rx <= '1';
      wait for 104 us;

		--data bit 1
		uart_rx <= '0';
      wait for 104 us;

		--data bit 2
		uart_rx <= '1';
      wait for 104 us;

		--data bit 3
		uart_rx <= '0';
      wait for 104 us;

		--data bit 4
		uart_rx <= '0';
      wait for 104 us;

		--data bit 5
		uart_rx <= '0';
      wait for 104 us;

		--data bit 6
		uart_rx <= '0';
      wait for 104 us;
		
		-- data bit 7. Send this bit and wait for the modules write-enable to go high, since the core can
		-- do that at any point in this bit.
		uart_rx <= '0';
      wait until wr_req = '1';

		-- Now assert that the correct data is present.
--		assert (dataout = x"A0")  report "Wrong data" severity FAILURE;

		end process;

END;
