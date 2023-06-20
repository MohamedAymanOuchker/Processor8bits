library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux0 is
	Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
		b: in STD_LOGIC_VECTOR (1 downto 0);
		sel: in STD_LOGIC;
		y : out STD_LOGIC_VECTOR (1 downto 0));
end mux0;
 
architecture Behavioral of mux0 is 

begin
	process (sel, a, b) 
	begin
		if (sel = '1') then
			y <= a;
		else
			y <= b;
		end if;
	end process;
end Behavioral;