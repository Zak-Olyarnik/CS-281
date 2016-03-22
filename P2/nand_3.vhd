library IEEE;
use IEEE.std_logic_1164.all;

entity nand_3 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  c: in STD_LOGIC;
  z: out STD_LOGIC
 );
end nand_3;

architecture behavioral of nand_3 is
begin
  z <= not(a and b and c) after 1 ns;
end behavioral;
