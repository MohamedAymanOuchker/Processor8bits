library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registers is
	Port ( clk : in STD_LOGIC;
	       add_rs : in STD_LOGIC_VECTOR (1 downto 0);
	       add_rt : in STD_LOGIC_VECTOR (1 downto 0);
	       add_rd : in STD_LOGIC_VECTOR (1 downto 0);
	       wr_data : in STD_LOGIC_VECTOR (7 downto 0);
	       rs : out STD_LOGIC_VECTOR (7 downto 0);
	       rt : out STD_LOGIC_VECTOR (7 downto 0));
end registers;

architecture Behavioral of registers is

type registerFile is array (0 to 3) of STD_LOGIC_VECTOR (7 downto 0);
  signal reg : registerFile := (
	"00000001",
	"00000001",
	"11101011",
	"01000111");
begin
  process(clk)
  begin
    if falling_edge(clk) then
      reg(to_integer(unsigned(add_rd))) <= wr_data;
    end if;
  end process;

rs <= reg(to_integer(unsigned(add_rs)));
rt <= reg(to_integer(unsigned(add_rt)));
end Behavioral;