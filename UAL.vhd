library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UAL is
    Port ( op : in STD_LOGIC_VECTOR (1 downto 0);
	   rs : in STD_LOGIC_VECTOR (7 downto 0);
	   rt : in STD_LOGIC_VECTOR (7 downto 0);
	   rd : out STD_LOGIC_VECTOR (7 downto 0));
end UAL;

architecture Behavioral of UAL is
      signal resultat : STD_LOGIC_VECTOR (7 downto 0);
begin
   process(op, rs, rt)
   begin
     if (op = "00") then        -- AND
	resultat <= rs and rt;
     elsif (op = "01") then     -- ADD
	resultat <= rs + rt;
     elsif (op = "10") then     -- SUB
	resultat <= rs - rt;
     elsif (op = "11") then     -- ADDi
	resultat <= rs + rt;
     end if;

end process;

rd <= resultat;

end Behavioral;