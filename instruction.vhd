library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instruction is
	Port ( addr_instr : in STD_LOGIC_VECTOR (2 downto 0);
	       op : out STD_LOGIC_VECTOR (1 downto 0);
	       add_rs : out STD_LOGIC_VECTOR (1 downto 0);
	       add_rt : out STD_LOGIC_VECTOR (1 downto 0);
	       add_rd : out STD_LOGIC_VECTOR (1 downto 0));
end instruction;

architecture Behavioral of instruction is

type set_instr is array (0 to 7) of STD_LOGIC_VECTOR (7 downto 0);
  constant instr : set_instr := (
	"01000000",
	"01000000",
	"11101011",
	"01000111",
	"10101100",
	"00000000",
	"00000000",
	"00000000");

begin
  op <= instr(to_integer (unsigned(addr_instr)))(7 downto 6);
  add_rs <= instr(to_integer (unsigned(addr_instr)))(5 downto 4);
  add_rt <= instr(to_integer (unsigned(addr_instr)))(3 downto 2);
  add_rd <= instr(to_integer (unsigned(addr_instr)))(1 downto 0);

end Behavioral;