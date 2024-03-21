LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
ENTITY my_dff is
	PORT	(  clk 	: in std_logic;
				rst	: in std_logic;
				ena 	: in std_logic;
				d 		: in std_logic;
				q		: out std_logic);
end my_dff;

architecture rtl of my_dff is 
	BEGIN 
		diff: process(clk,rst,d)
		begin
			if (rst='1') then
				q <='0';
			elsif(rising_edge(clk))then 
				if (ena  ='1')then 
					q<=d;
				end if;
			end if;
	end process;
end architecture;
