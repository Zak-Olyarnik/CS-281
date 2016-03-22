library IEEE;
use IEEE.std_logic_1164.all;

entity nand_4 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  c: in STD_LOGIC;
  d: in STD_LOGIC;
  z: out STD_LOGIC
 );
end nand_4;

architecture behavioral of nand_4 is
begin
  z <= not(a and b and c and d) after 1 ns;
end behavioral;
