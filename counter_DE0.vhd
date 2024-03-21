LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------------
ENTITY counter_DE0 IS
	PORT(		clk : IN  STD_LOGIC;
				ena : IN  STD_LOGIC;
				rst : IN  STD_LOGIC;
				max : in std_logic_vector(3 downto 0);
				sseg, sseg1: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END ENTITY counter_DE0;
-------------------------------------------------------------------------------------
ARCHITECTURE functional OF counter_DE0 IS
	SIGNAL q_temp : STD_LOGIC_VECTOR (3 DOWNTO 0);
-------------------------------------
BEGIN

counterGates_0: ENTITY work.counterGates_des
	PORT MAP( 	clk => clk,
					rst => rst,
					ena => ena,
					q	 => q_temp,
					max=>max);

impresionseg7: ENTITY work.bing_to_sseg
	PORT MAP( 	bin => q_temp,
					max=>max,
					sseg => sseg,
					sseg1=> sseg1);

END ARCHITECTURE;
