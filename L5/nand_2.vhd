library IEEE;
use IEEE.std_logic_1164.all;

entity nand_2 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  z: out STD_LOGIC
 );
end nand_2;

architecture behavioral of nand_2 is
begin
  z <= a nand b after 1 ns;
end behavioral;
