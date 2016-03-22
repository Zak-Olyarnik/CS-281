library IEEE;
use IEEE.std_logic_1164.all;

entity or_3 is
 port (
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  c: in STD_LOGIC;
  z: out STD_LOGIC
 );
end or_3;

architecture structural of or_3 is


 component or_2
  port(a  : in std_logic;
    b  : in std_logic;
    z  : out std_logic);
 end component;

 signal s_o0 : std_logic := '0';

begin

O0  : or_2 port map (a => a, b => b, z => s_o0);
O1  : or_2 port map (a => s_o0, b => c, z => z);

end structural;

