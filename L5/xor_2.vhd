library IEEE;
use IEEE.std_logic_1164.all;

entity xor_2 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  z: out STD_LOGIC
 );
end xor_2;

architecture structural of xor_2 is

 component nand_2
  port(a,b : in std_logic;
    z   : out std_logic);
 end component;

 signal s_na0, s_na1, s_na2 : std_logic := '0';

begin


NA0 : nand_2 port map( a => a, b => b, z => s_na0);
NA1 : nand_2 port map( a => a, b => s_na0, z => s_na1);
NA2 : nand_2 port map( a => b, b => s_na0, z => s_na2);
NA3 : nand_2 port map( a => s_na1, b => s_na2, z => z);

end structural;

