
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY top_top_sch_tb IS
END top_top_sch_tb;
ARCHITECTURE behavioral OF top_top_sch_tb IS 

   COMPONENT top
   PORT( EXIDO	:	IN	STD_LOGIC; 
          EXICS	:	IN	STD_LOGIC; 
          EXICLK	:	IN	STD_LOGIC; 
          EXIDI	:	OUT	STD_LOGIC; 
          LED	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          debug	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   SIGNAL EXIDO	:	STD_LOGIC;
   SIGNAL EXICS	:	STD_LOGIC;
   SIGNAL EXICLK	:	STD_LOGIC;
   SIGNAL EXIDI	:	STD_LOGIC;
   SIGNAL LED	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL debug	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

   UUT: top PORT MAP(
		EXIDO => EXIDO, 
		EXICS => EXICS, 
		EXICLK => EXICLK, 
		EXIDI => EXIDI, 
		LED => LED, 
		debug => debug
   );

   tb : PROCESS
   BEGIN
      WAIT for 50ns;
		EXICS <= '1';	-- reset it
		EXICLK <= '0';
		EXIDO <= '0';
      WAIT for 50ns;
		EXICS <= '0';	-- release from reset

		EXIDO <= '1';

      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';

		EXIDO <= '0';
		
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
		
		EXIDO <= '0';

      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
		
		EXIDO <= '1';

      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';

		EXIDO <= '0';

      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns; 
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';
      WAIT for 50ns;
		EXICLK <= '1';
      WAIT for 50ns;
		EXICLK <= '0';

   END PROCESS;

END;
