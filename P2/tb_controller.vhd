library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_controller is
end entity;

architecture behavioral of tb_controller is

component control
 port (
	opcode : in STD_LOGIC_VECTOR (5 downto 0);
	funct : in STD_LOGIC_VECTOR (5 downto 0);
	RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch : out STD_LOGIC;
	ALUOp : out STD_LOGIC_VECTOR (1 downto 0);
	ALUControl : out STD_LOGIC_VECTOR (2 downto 0)
 );
end component;

signal s_RegDST, s_ALUSrc, s_MemToReg, s_RegWrite : std_logic;
signal s_MemRead, s_MemWrite, s_Branch : std_logic;
signal s_ALUOp : std_logic_vector (1 downto 0);
signal s_ALUControl : std_logic_vector(2 downto 0);
signal s_opcode : std_logic_vector (5 downto 0);
signal s_funct : std_logic_vector (5 downto 0);

begin

 TEST_CONT : control
  port map (
	opcode => s_opcode,
	funct => s_funct,
	RegDst => s_RegDst,
	ALUSrc => s_ALUSrc,
	MemToReg => s_MemToReg,
	RegWrite => s_RegWrite,
	MemRead => s_MemRead,
	MemWrite => s_MemWrite,
	Branch => s_Branch,
	ALUOP => s_ALUOP,
	ALUControl => s_ALUControl
  );

s_opcode <= "000000" after 5 ns,		--add
				"100011" after 25 ns,	--lw
				"101011" after 45 ns,	--sw
				"000000" after 65 ns,	--and
				"000000" after 85 ns,	--or
				"000000" after 105 ns,	--slt
				"000000" after 125 ns;	--add
s_funct <= "100000" after 5 ns,	--add
			  "000000" after 25 ns,	--lw
			  "000000" after 45 ns,	--sw
			  "100100" after 65 ns,	--and
			  "100101" after 85 ns,	--or
			  "101010" after 105 ns, --slt
			  "000000" after 125 ns;	--add

end behavioral;
