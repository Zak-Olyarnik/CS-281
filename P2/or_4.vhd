library IEEE;
use IEEE.std_logic_1164.all;

entity or_4 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  c: in STD_LOGIC;
  d: in STD_LOGIC;
  z: out STD_LOGIC
 );
end or_4;

architecture structural of or_4 is


 component or_2
  port(a  : in std_logic;
    b  : in std_logic;
    z  : out std_logic);
 end component;

 signal s_o0, s_o1 : std_logic := '0';

begin

O0  : or_2 port map (a => a, b => b, z => s_o0);
O1  : or_2 port map (a => c, b => d, z => s_o1);
O2  : or_2 port map (a => s_o0, b => s_o1, z => z);

end structural;
