library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc is
    Port ( clk : in STD_LOGIC;
	   instr_suivante : out STD_LOGIC_VECTOR (2 downto 0));
end pc;

architecture Behavioral of pc is
      signal signal_courant : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
   process(clk)
   begin
	  if falling_edge(clk) then 
	   signal_courant <= STD_LOGIC_VECTOR(unsigned(signal_courant) + to_unsigned(1, 3));
     end if;

end process;

instr_suivante <= signal_courant;

end Behavioral;