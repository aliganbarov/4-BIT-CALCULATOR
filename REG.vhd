LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY REG IS
PORT (  D : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        Q : OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Enable: in std_logic;
        clk :in std_logic;
        R:in std_logic ) ;
END REG ;
ARCHITECTURE Behavior OF REG IS
BEGIN
PROCESS ( R, Enable ,clk)
BEGIN
If R ='1' Then 
  Q <= "0000" ;
elsif clk'event and clk='1' then
      if (Enable = '1') then
         Q<= D;
      end if;
   end if;
   END PROCESS ;
END Behavior ;
