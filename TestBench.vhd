library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TestBench is
end TestBench;

architecture Behavioral of TestBench is

component FSM 
    port(
          Load_A: OUT STD_LOGIC; 
          Load_B: OUT STD_LOGIC; 
          Cin: OUT STD_LOGIC; 
          Reset: OUT STD_LOGIC; 
          Clock: IN STD_LOGIC; 
          RUN : IN STD_LOGIC; 
          
          ALUop: OUT STD_LOGIC_VECTOR (2 DOWNTO 0); 
          Input_Select: OUT STD_LOGIC_VECTOR (2 DOWNTO 0); 
          out_state: OUT STD_LOGIC_VECTOR (3 DOWNTO 0); 
          MOP: IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
end component;

signal Load_A   : STD_LOGIC;
signal Load_B   : STD_LOGIC;
signal Cin      : STD_LOGIC;
signal Reset    : STD_LOGIC;
signal Clock    : STD_LOGIC;
signal RUN      : STD_LOGIC;
signal ALUop    : STD_LOGIC_VECTOR(2 downto 0); 
signal Input_Select: STD_LOGIC_VECTOR(2 downto 0); 
signal out_state: STD_LOGIC_VECTOR(3 downto 0); 
signal MOP      : STD_LOGIC_VECTOR(3 downto 0); 

	constant PERIOD : time := 20 ns;
	constant DUTY_CYCLE : real := 0.5;
	constant OFFSET : time := 100 ns;

begin
    uut: FSM port map(
		Load_A => Load_A,
		Load_B => Load_B,
		Cin => Cin,
		Reset => Reset,
		Clock => Clock,
		RUN => RUN,
		ALUop => ALUop,
		Input_Select => Input_Select,
		out_state => out_state,
		MOP => MOP
   );

		clockProcess : process
		begin
			wait for OFFSET;
			clock_LOOP : loop
				Clock <= '0';
				      wait for (PERIOD - (PERIOD * DUTY_CYCLE));
				      Clock <= '1';
				      wait for (PERIOD * DUTY_CYCLE);
				end loop clock_LOOP;
		end process;

		resetProcess : process
		begin                
			wait for OFFSET;
			-- reset state for 100 ns.
			Reset <= '1';
			wait for 100 ns;
			Reset <= '0';
			wait;
			MOP  <= "0000";
		end process;

end Behavioral;
