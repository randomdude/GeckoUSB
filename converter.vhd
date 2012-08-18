library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity converter is
port (
-- Connections to the Gamecube/Wii's EXI bus
    exi_cs : in std_logic;
    exi_clk : in std_logic;
    exi_do : in std_logic;
    exi_di : out std_logic;
    exi_int : in std_logic;

-- Misc. IO pins
   led : out std_logic;
	fastclk : in  STD_LOGIC;	-- 50MHz

-- Connections to the RS232 signal to the PC
	uart_RXD : in STD_LOGIC;		-- RS232 signal from PC
	uart_TXD : out STD_LOGIC;	-- RS232 signal to PC
	uart_CTS : out STD_LOGIC;	-- RS232 signal that we can accept more data
	uart_RTS : in STD_LOGIC		-- RS232 signal that the DTE can accept more data
			  );
end converter;
	
architecture Behavioral of converter is

	COMPONENT usbexi PORT(
		usb_txe : IN std_logic;
		usb_rxf : IN std_logic;
		usb_data_in : IN std_logic_vector(7 downto 0);
		fastclk : IN std_logic;
		exi_cs : IN std_logic;
		exi_clk : IN std_logic;
		exi_do : IN std_logic;
		exi_int : IN std_logic;    
		led : OUT std_logic;      
		usb_rd : OUT std_logic;
		usb_wr : OUT std_logic;
		usb_data_out : OUT std_logic_vector(7 downto 0);
		exi_di : OUT std_logic;
		debug : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	component fifo port (
		wr_clk: IN std_logic;
		rd_clk: IN std_logic;
		din: IN std_logic_VECTOR(7 downto 0);
		wr_en: IN std_logic;
		rd_en: IN std_logic;
		dout: OUT std_logic_VECTOR(7 downto 0);
		full: OUT std_logic;
		almost_full: OUT std_logic;
		overflow: OUT std_logic;
		empty: OUT std_logic;
		valid: OUT std_logic;
		prog_full: OUT std_logic);
	end component;
	COMPONENT uart	PORT(
		clk : IN std_logic;
		dataIn : IN std_logic_vector(7 downto 0);
		dataInValid : IN std_logic;
		uart_rx : IN std_logic;          
		dataout : OUT std_logic_vector(7 downto 0);
		rd_req : OUT std_logic;
		wr_req : OUT std_logic;
		uart_tx : OUT std_logic;
		debug : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	-- Signals to/from the TX (RS232-to-EXI) FIFO
	signal rx_full: std_logic;
	signal rx_almost_full: std_logic;
	signal rx_wr_en: std_logic;
	signal rx_rd_en: std_logic;
	signal rx_data_out: std_logic_vector(7 downto 0);
	signal rx_data_in: std_logic_vector(7 downto 0);
	signal rx_valid: std_logic;
	
	-- Signals to/from the TX (EXI-to-RS232) FIFO
	signal tx_full: std_logic;
	signal tx_almost_full: std_logic;
	signal tx_wr_en: std_logic;
	signal tx_rd_en: std_logic;
	signal tx_data_out: std_logic_vector(7 downto 0);
	signal tx_data_in: std_logic_vector(7 downto 0);
	signal tx_valid: std_logic;	
	
	-- Misc signals.
	signal usb_txe: std_logic;
	signal tx_dataInValid: std_logic;
begin

	-- Each reception may result in one or two bytes of data, so we must use the almostfull pin to prevent
	-- reception if only one byte remains.
	usb_txe <= (tx_almost_full or tx_full);

	-- Only signal data waiting from EXI to RS232 if the DTR can handle it.
	tx_dataInValid <= (tx_valid AND (NOT uart_RTS));

	Inst_usbexi: usbexi PORT MAP(
		fastclk => fastclk,
		-- Send data to the TX FIFO
		usb_txe => usb_txe,
		usb_wr => tx_wr_en,
		usb_data_out => tx_data_in,
		-- Pull data from the RX FIFO
		usb_rd => rx_rd_en,
		usb_data_in => rx_data_out,
		usb_rxf => not rx_valid,		-- Data is pending when rxvalid
		-- EXI connections
		exi_cs => exi_cs,
		exi_clk => exi_clk,
		exi_do => exi_do,
		exi_di => exi_di,
		exi_int => exi_int,
		-- The Gecko LED
		led => led
	);

	-- This FIFO is in charge of buffering data from the RS232 port to the EXI bus.
	RXFIFO : fifo port map (
			wr_clk => fastclk,
			rd_clk => exi_clk,
			din => rx_data_in,
			wr_en => rx_wr_en,
			rd_en => rx_rd_en,
			dout => rx_data_out,
			full => rx_full,
			almost_full => rx_almost_full,
--			overflow => ,
--			empty => ,
--			prog_full => ,
			valid => rx_valid
			);

	-- This FIFO is in charge of buffering data from the EXI port to the RS232 side.
	TXFIFO : fifo port map (
			wr_clk => exi_clk,
			wr_en => tx_wr_en,
			din => tx_data_in,
			
			rd_clk => fastclk,
			rd_en => tx_rd_en,
			dout => tx_data_out,
			
			full => tx_full,
			almost_full => tx_almost_full,
--			overflow => ,
--			empty => ,
			valid => tx_valid
--			prog_full => 
			);

	-- The RS232 UART logic lives here.
	rs232: uart PORT MAP(
		clk => fastclk,
		-- send our RS232 straight to the RX FIFO
		dataout => rx_data_in,
		wr_req => rx_wr_en,
		-- pull data from the TX FIFO
		rd_req => tx_rd_en,
		dataInValid => tx_dataInValid,
		dataIn => tx_data_out,
		-- Connections to the RS232 data lines themselves
		uart_rx => uart_RXD,
		uart_tx => uart_TXD
	);
	
	-- Our CTS/RTS pins, generated straight from FIFO logic.
	-- why use almostfull here? Hm.
	uart_CTS <= rx_almost_full OR rx_full;
end Behavioral;

