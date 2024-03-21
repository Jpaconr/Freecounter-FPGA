
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------
ENTITY counterGates_des IS
	PORT (	clk	:	IN	STD_LOGIC;
				rst 	:	IN	STD_LOGIC;
				ena	:	IN	STD_LOGIC;
				max 	: 	in std_logic_vector(3 downto 0);
				q		: 	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
END counterGates_des;
----------------------------------------------------------------
ARCHITECTURE gateLevel OF counterGates_des IS
	SIGNAL 	q0		:	STD_LOGIC;
	SIGNAL 	q1		:	STD_LOGIC;
	SIGNAL 	q2		:	STD_LOGIC;
	SIGNAL 	q3		:	STD_LOGIC;
	
	SIGNAL 	d0		:	STD_LOGIC;
	SIGNAL 	d1		:	STD_LOGIC;
	SIGNAL 	d2		:	STD_LOGIC;
	SIGNAL 	d3		:	STD_LOGIC;
	
	SIGNAL 	ena2	:	STD_LOGIC;
	SIGNAL 	ena3	:	STD_LOGIC;
	SIGNAL 	q_Temp	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	signal 	reset : std_logic;
	
BEGIN

	d0 <= NOT (q0);
	d1 <= NOT (q1);
	d2 <= NOT (q2);
	d3 <= NOT (q3);
	
	ena2 <= q1 AND q0;
	ena3 <= q2 AND q1 AND q0;
	
	q_Temp <= q3&q2&q1&q0;
	
	reset <= '1' WHEN (q_Temp > max) else '0';
	q <=	"0000"	WHEN	rst ='1'	ELSE q_Temp;
	
	
	bit0: ENTITY work.my_dff
	PORT MAP ( clk  => clk,
				  rst  => reset,
				  ena  => ena,
				  d	 => d0,
				  q	 => q0);
				  
	bit1: ENTITY work.my_dff
	PORT MAP ( clk  => clk,
				  rst  => reset,
				  ena  => q0,
				  d	 => d1,
				  q	 => q1);
				  
	bit2: ENTITY work.my_dff
	PORT MAP ( clk  => clk,
				  rst  => reset,
				  ena  => ena2,
				  d	 => d2,
				  q	 => q2);
				  
	bit3: ENTITY work.my_dff
	PORT MAP ( clk  => clk,
				  rst  => reset,
				  ena  => ena3,
				  d	 => d3,
				  q	 => q3);			  
END ARCHITECTURE;
