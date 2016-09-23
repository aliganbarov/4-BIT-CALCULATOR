library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity twoto1mux is
Port (
Input1: in STD_LOGIC_VECTOR (3
downto 0);
Input2: in STD_LOGIC_VECTOR (3
downto 0);
Selection: in STD_LOGIC;
Output: out STD_LOGIC_VECTOR (3
downto 0));
end twoto1mux;
architecture behavior of twoto1mux
is
begin
with Selection select
Output <= Input1 when '0',
Input2 when OTHERS;
end behavior;