library IEEE;
use IEEE.std_logic_1164.all;

entity and_2 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  z: out STD_LOGIC
 );
end and_2;

architecture structural of and_2 is

 component nand_2
  port(a,b : in std_logic;
    z   : out std_logic);
 end component;

 component not_1
  port(x  : in std_logic;
    z  : out std_logic);
 end component;

 signal s_na0 : std_logic := '0';

begin

NA0 : nand_2 port map( a => a, b => b, z => s_na0);
N0  : not_1  port map( x => s_na0, z => z);

end structural;

