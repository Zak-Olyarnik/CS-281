library IEEE;
use IEEE.std_logic_1164.all;

entity control is
	port (
		opcode : in STD_LOGIC_VECTOR (5 downto 0);
		funct : in STD_LOGIC_VECTOR (5 downto 0);
		RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch: out STD_LOGIC;
		ALUOp : out STD_LOGIC_VECTOR (1 downto 0);
		ALUControl : out STD_LOGIC_VECTOR (2 downto 0)
	);
end control;

architecture behavioral of control is	  

signal R_format, lw, sw, beq : STD_LOGIC;
signal op : STD_LOGIC_VECTOR (1 downto 0);

begin
	
	--determine instruction type
	R_format <= '1' when opcode = "000000" else '0';
	lw <= '1' when opcode = "100011" else '0';
	sw <= '1' when opcode = "101011" else '0';
	beq <= '1' when opcode = "000100" else '0';

	--determine normal outputs
	RegDst <= R_format;
	ALUSrc <= lw or sw;
	MemToReg <= lw;
	RegWrite <= R_format or lw;
	MemRead <= lw;
	MemWrite <= sw;
	Branch <= beq;
	ALUOp(1) <= R_format;
	ALUOp(0) <= beq;
	op(1) <= R_format;
	op(0) <= beq;

	--determine ALUControl
	ALUControl <= "010" when op = "00" else
					  "110" when op = "01" else
					  "010" when funct = "100000" else
					  "110" when funct = "100010" else
					  "000" when funct = "100100" else
					  "001" when funct = "100101" else
					  "111" when funct = "101010";

end behavioral;
