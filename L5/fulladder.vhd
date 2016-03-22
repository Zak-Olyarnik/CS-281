library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
 port (
  a:   in STD_LOGIC;
  b:   in STD_LOGIC;
  c_in:  in STD_LOGIC;
  s:   out STD_LOGIC;
  c_out: out STD_LOGIC
 );
end fulladder;

architecture structural of fulladder is

 component nand_2
  port(a,b  : in std_logic;
    z   : out std_logic);
 end component;

 signal s_na0, s_na1, s_na2, s_na3, s_na4, s_na5, s_na6 : std_logic := '0';


begin

NA0: nand_2 port map (a => a, b => b, z => s_na0);
NA1: nand_2 port map (a => a, b => s_na0, z => s_na1);
NA2: nand_2 port map (a => s_na0, b => b, z => s_na2);
NA3: nand_2 port map (a => s_na1, b => s_na2, z => s_na3);
NA4: nand_2 port map (a => s_na3, b => c_in, z => s_na4);
NA5: nand_2 port map (a => s_na3, b => s_na4, z => s_na5);
NA6: nand_2 port map (a => s_na4, b => c_in, z => s_na6);
NA7: nand_2 port map (a => s_na5, b => s_na6, z => s);
NA8: nand_2 port map (a => s_na0, b => s_na4, z => c_out);

end structural;
