library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4 is
 port (
  a:  in STD_LOGIC;
  b:  in STD_LOGIC;
  c:  in STD_LOGIC;
  d:  in STD_LOGIC;
  s0: in STD_LOGIC;
  s1: in STD_LOGIC;
  z:  out STD_LOGIC
 );
end mux_4;

architecture structural of mux_4 is

 component nand_3
  port(a,b,c : in std_logic;
   z : out std_logic);
 end component;

 component nand_4
  port(a,b,c,d : in std_logic;
   z : out std_logic);
 end component;

 component not_1
  port(x  : in std_logic;
   z : out std_logic);
 end component;

 signal s_n0, s_n1, s_na0, s_na1, s_na2, s_na3 : std_logic := '0';

begin

N0 :  not_1 port map( x => s0, z => s_n0);
N1 :  not_1 port map( x => s1, z => s_n1);
NA0 : nand_3 port map( a => a, b => s_n0, c => s_n1, z => s_na0);
NA1 : nand_3 port map( a => b, b => s1, c => s_n0, z => s_na1);
NA2 : nand_3 port map( a => c, b => s_n1, c => s0, z => s_na2);
NA3 : nand_3 port map( a => d, b => s0, c => s1, z => s_na3);
NA4 : nand_4 port map( a => s_na0, b => s_na1, c => s_na2, d => s_na3, z => z);

end structural;

