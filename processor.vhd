library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
	Port ( clk : in STD_LOGIC;
	       valeur : out STD_LOGIC_VECTOR (7 downto 0));
end processor;

architecture Behavioral of processor is
component UAL
	Port ( op : in STD_LOGIC_VECTOR(1 downto 0);
	       rs : in STD_LOGIC_VECTOR(7 downto 0);
	       rt : in STD_LOGIC_VECTOR(7 downto 0);
	       rd : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component control
	Port ( instr : in STD_LOGIC_VECTOR(1 downto 0);
	       ual_src : out STD_LOGIC;
	       reg_dst : out STD_LOGIC;
	       ual_op : out STD_LOGIC_VECTOR(1 downto 0));
end component;

component instruction
	Port ( addr_instr : in STD_LOGIC_VECTOR(2 downto 0);
	       op : out STD_LOGIC_VECTOR(1 downto 0);
	       add_rt : out STD_LOGIC_VECTOR(1 downto 0);
	       add_rs : out STD_LOGIC_VECTOR(1 downto 0);
	       add_rd : out STD_LOGIC_VECTOR(1 downto 0));
end component;

component mux0
	Port ( sel : in STD_LOGIC;
	       a : in STD_LOGIC_VECTOR(1 downto 0);
	       b : in STD_LOGIC_VECTOR(1 downto 0);
	       y : out STD_LOGIC_VECTOR(1 downto 0));
end component;

component mux1
	Port ( sel : in STD_LOGIC;
	       a : in STD_LOGIC_VECTOR(7 downto 0);
	       b : in STD_LOGIC_VECTOR(7 downto 0);
	       y : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component pc
	Port ( clk : in STD_LOGIC;
	       instr_suivante : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component registers
	Port ( clk : in STD_LOGIC;
	       add_rd : in STD_LOGIC_VECTOR(1 downto 0);
	       add_rs : in STD_LOGIC_VECTOR(1 downto 0);
	       add_rt : in STD_LOGIC_VECTOR(1 downto 0);
	       wr_data : in STD_LOGIC_VECTOR(7 downto 0);
	       rs : out STD_LOGIC_VECTOR(7 downto 0);
	       rt : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component extension_de_signe
	Port ( data_in : in STD_LOGIC_VECTOR(1 downto 0);
	       data_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal WIRE_0 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_1 : STD_LOGIC_VECTOR(7 downto 0);
signal WIRE_2 : STD_LOGIC_VECTOR(7 downto 0);
signal WIRE_3 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_5 : STD_LOGIC;
signal WIRE_18 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_19 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_8 : STD_LOGIC;
signal WIRE_9 : STD_LOGIC_VECTOR(7 downto 0);
signal WIRE_10 : STD_LOGIC_VECTOR(7 downto 0);
signal WIRE_12 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_13 : STD_LOGIC_VECTOR(1 downto 0);
signal WIRE_14 : STD_LOGIC_VECTOR(2 downto 0);
signal WIRE_15 : STD_LOGIC_VECTOR(7 downto 0);

begin

  valeur <= WIRE_15;

  unite_ar_log : UAL
  Port map(op => WIRE_0,
	   rs => WIRE_1,
	   rt => WIRE_2,
	   rd => WIRE_15);

  unite_control : control
  Port map(instr => WIRE_3,
	   ual_src => WIRE_8,
	   reg_dst => WIRE_5,
	   ual_op => WIRE_0);

  mem_instr : instruction
  Port map(addr_instr => WIRE_14,
	   op => WIRE_3,
	   add_rd=> WIRE_19,
	   add_rs=> WIRE_13,
	   add_rt=> WIRE_18);

  mux_0 : mux0
  Port map(sel => WIRE_5,
	   a => WIRE_18,
	   b => WIRE_19,
	   y => WIRE_12);

  mux_1 : mux1
  Port map(sel => WIRE_8,
	   a => WIRE_9,
	   b => WIRE_10,
	   y => WIRE_2);

  program_counter_inst : pc
  Port map(clk => clk,
	   instr_suivante => WIRE_14);

  fichier_registre_inst : registers
  Port map(clk => clk,
	   add_rd => WIRE_12,
	   add_rs => WIRE_13,
	   add_rt => WIRE_18,
	   wr_data => WIRE_15,
	   rs => WIRE_1,
           rt => WIRE_9);

  extension_de_signe_inst : extension_de_signe
  Port map(data_in => WIRE_19,
	   data_out => WIRE_10);

 
end Behavioral;


