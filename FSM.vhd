library ieee;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY FSM IS 
	PORT (Clock,Resetn,run : IN STD_LOGIC;
		   MOP: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		   Reset,Load_A,Load_B,Cin:OUT STD_LOGIC;
		   Input_Select,ALUop:OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		   out_state: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END FSM;

ARCHITECTURE Behavior OF FSM IS 
		SIGNAL presentState , nextState  : STD_LOGIC_VECTOR (4 DOWNTO 0);
		CONSTANT S0 :STD_LOGIC_VECTOR (4 DOWNTO 0) :="10000";	---S0
		CONSTANT S1 :STD_LOGIC_VECTOR (4 DOWNTO 0) :="01000";	---S1
		CONSTANT S2 :STD_LOGIC_VECTOR (4 DOWNTO 0) :="00100";	---S2
		CONSTANT S3 :STD_LOGIC_VECTOR (4 DOWNTO 0) :="00010";	---S3
		CONSTANT S4 :STD_LOGIC_VECTOR (4 DOWNTO 0) :="00001";	---S4
		
	BEGIN
			PROCESS (MOP,presentState)
			BEGIN
				CASE presentState IS 
					WHEN S0 =>
							out_state<="0000";
							Input_Select<="000";
							if run='1' then
								nextState <= S1;
								else 
								nextState <= S0;
								end if;
							Load_A<='0';
							Load_B<='0';							
							Cin<='0';
							ALUop<="000";
							Reset<='0';		
						
					WHEN S1 =>
							out_state<="0001";
							Input_Select<="000";
							if run='1' then
								nextState <= S2;
								else 
								nextState <= S0;
								end if;
							Load_A<='0';
							Load_B<='0';							
							Cin<='0';
							ALUop<="000";
							Reset<='0';	
					WHEN S2 =>
					out_state<="0010";
					Input_Select<="000";
					if run='1' then
								nextState <= S3;
								else 
								nextState <= S0;
								end if;
					Load_A<='0';
					Load_B<='0';							
					Cin<='0';
					ALUop<="000";
					Reset<='0';									
					WHEN S3 =>
							out_state<="0011";
							Input_Select<="000";
							if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
							Load_A<='0';
							Load_B<='0';							
							Cin<='0';
							ALUop<="000";
							Reset<='0';
										
					WHEN S4 =>
							IF MOP="000" THEN
								out_state<="0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select<="000";
								Load_A<='0';
								Load_B<='0';
								Cin<='0';
								ALUop<="000";
								Reset<='0';
								elsIF MOP="001" THEN
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "000";
								Load_A <= '0';
								Load_B <= '0';
								Cin <= '0';
								ALUop <= "000";
								Reset <= '1';
								elsIF MOP="010" THEN	---If operation is Load A
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "110";	---makes 8-1 mux to choose input DIN[3..0]
								Load_A <= '1';			---Loading input into A
								Load_B <= '0';
								Cin <= '0';
								ALUop <= "000";
								Reset <= '0';
								elsIF MOP="011" THEN	---If operation is Load B
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "110";	---Makes 8-1 mux to choose input DIN[3..0]
								Load_A <= '0';
								Load_B <= '1';			---Loading input into B
								Cin <= '0';
								ALUop <= "000";
								Reset <= '0';
								elsIF MOP="100" THEN	---If operation is add Ra & Rb
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "100";	---Makes 8-1 mux to take input from B (first given input)
								Load_A <= '0';
								Load_B <= '1';			---Storing value in Rb
								Cin <= '0';
								ALUop <= "001";			---Giving ALU add operation	
								Reset <= '0';
								elsIF MOP="101" THEN	---If operation is sub
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "100";	---Makes 8-1 mux to take input from B (first given input)
								Load_A <= '0';
								Load_B <= '1';			---Storing value in Rb
								Cin <= '1';				---Taking Cin
								ALUop <= "011";			---Giving ALU Y - X - Cin'			
								Reset <= '0';
								elsIF MOP="110" THEN	---If operation is BINVB
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "101";	---Makes 8-1 mux to choose inverse of value in Rb
								Load_A <= '0';
								Load_B <= '1';			---Storing value in Rb
								Cin <= '0';
								ALUop <= "000";
								Reset <= '0';
								elsIF MOP="111" THEN	---If operation is BAND
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "100";	---Mux choice 
								Load_A <= '0';
								Load_B <= '1';
								Cin <= '0';
								ALUop <= "101";			---Giving ALU AND operation
								Reset <= '0';
								else
								out_state <= "0100";
								if run='1' then
								nextState <= S4;
								else 
								nextState <= S0;
								end if;
								Input_Select <= "000";
								Load_A <= '0';
								Load_B <= '0';
								Cin <= '0';
								ALUop <= "000";
								Reset <= '0';
								end if;			

					WHEN OTHERS => nextState<=S0;		
				END CASE;
			END PROCESS;
			
			PROCESS (Clock,Resetn)
			BEGIN
					IF Resetn='0' THEN 
						presentState <= S0;
					ELSIF (Clock'EVENT AND Clock='1') THEN 
						presentState<=nextState;
					END IF ;
			END PROCESS;
			
		
			
	END Behavior;
