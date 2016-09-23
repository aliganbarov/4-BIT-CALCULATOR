library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity segmentDecoder is
Port (
 Input: in STD_LOGIC_VECTOR (3
downto 0);
 Output: out STD_LOGIC_VECTOR (6
downto 0));
end segmentDecoder;
architecture Beh of segmentDecoder is
begin
process (Input)
begin
case Input is
WHEN "0000" =>
 Output <=
"0000001";
WHEN "0001" =>
 Output <=
"1001111";
WHEN "0010" => 
Output <=
"0010010";
WHEN "0011" =>
 Output <=
"0000110";
WHEN "0100" =>
 Output <=
"1001100";
WHEN "0101" =>
 Output <=
"0100100";
WHEN "0110" =>
 Output <=
"0100000";
WHEN "0111" =>
 Output <=
"0001101";
WHEN "1000" => 
Output <=
"0000000";
WHEN "1001" =>
 Output <=
"0000100";
WHEN "1010" =>
 Output <=
"0001000";
WHEN "1011" => 
Output <=
"1100000";
WHEN "1100" =>
 Output <=
"0110010";
WHEN "1101" =>
 Output <=
"1000010";
WHEN "1110" =>
 Output <=
"0110000";
WHEN OTHERS =>
 Output <=
"0111000";
end case;
end process;
end Beh;