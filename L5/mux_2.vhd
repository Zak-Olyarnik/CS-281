library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  s: in STD_LOGIC;
  z: out STD_LOGIC
 );
end mux_2;

architecture structural of mux_2 is

 component nand_2
  port(a,b : in std_logic;
   z   : out std_logic);
 end component;

 component not_1
  port(x  : in std_logic;
   z  : out std_logic);
 end component;

 signal s_n0, s_na0, s_na1 : std_logic := '0';

begin

N0  : not_1  port map( x => s, z => s_n0);
NA0 : nand_2 port map( a => a, b => s_n0, z => s_na0);
NA1 : nand_2 port map( a => s, b => b, z => s_na1);
NA2 : nand_2 port map( a => s_na0, b => s_na1, z => z);

end structural;

