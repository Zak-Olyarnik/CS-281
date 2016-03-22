library IEEE;
use IEEE.std_logic_1164.all;

entity or_2 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  z: out STD_LOGIC
 );
end or_2;

architecture structural of or_2 is

 component nand_2
  port(a,b : in std_logic;
   z   : out std_logic);
 end component;

 component not_1
  port(x  : in std_logic;
   z  : out std_logic);
 end component;

 signal s_n0, s_n1 : std_logic := '0';

begin

N0  : not_1  port map( x => a, z => s_n0);
N1  : not_1  port map( x => b, z => s_n1);
NA0 : nand_2 port map( a => s_n0, b => s_n1, z => z);

end structural;

