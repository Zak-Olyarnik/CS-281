library IEEE;
use IEEE.std_logic_1164.all;

entity not_1 is
 port (
  x: in STD_LOGIC;
  z: out STD_LOGIC
 );
end not_1;

architecture structural of not_1 is

 component nand_2
  port(a,b  : in std_logic;
    z   : out std_logic);
 end component;

begin

N : nand_2 port map( a => x, b => x, z => z);

end structural;
