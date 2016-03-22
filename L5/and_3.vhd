library IEEE;
use IEEE.std_logic_1164.all;

entity and_3 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  c: in STD_LOGIC;
  z: out STD_LOGIC
 );
end and_3;

architecture structural of and_3 is

 component nand_2
  port(a,b : in std_logic;
    z   : out std_logic);
 end component;

 signal s_na0 : std_logic := '0';

begin

NA0 : nand_2 port map( a => a, b => b, z => s_na0);
NA1 : nand_2 port map( a => c, b => s_na0, z => z);

end structural;
