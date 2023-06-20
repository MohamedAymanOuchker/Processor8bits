library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extension_de_signe is
	Port ( data_in : in STD_LOGIC_VECTOR (1 downto 0);
	       data_out : out STD_LOGIC_VECTOR (7 downto 0));
end extension_de_signe;

architecture Behavioral of extension_de_signe is
begin

	data_out <= "000000" & data_in;

end Behavioral;