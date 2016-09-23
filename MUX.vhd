LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux IS
PORT ( 
 I0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I5 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I6 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 I7 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 selector : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
 Output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END mux;
ARCHITECTURE behavior OF mux IS
BEGIN
WITH selector SELECT
 Output <= I0 WHEN "000",
 I1 WHEN "001",
 I2 WHEN "010",
 I3 WHEN "011",
 I4 WHEN "100",
 I5 WHEN "101",
 I6 WHEN "110",
 I7 WHEN OTHERS;
END behavior;
