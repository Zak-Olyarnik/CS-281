library IEEE;
use IEEE.std_logic_1164.all;

entity alu1 is
 port (
  a:  in STD_LOGIC;
  b:  in STD_LOGIC;
  c_in:  in STD_LOGIC;
  less:  in STD_LOGIC;
  a_invert: in STD_LOGIC;
  b_invert: in STD_LOGIC;
  op :  in STD_LOGIC_vector (1 downto 0);
  z:  out STD_LOGIC;
  c_out: out STD_LOGIC
 );
end alu1;

architecture structural of alu1 is

 component not_1
  port (x : in std_logic;
   z : out std_logic);
 end component;

 component and_2
  port(a,b : in std_logic;
   z  : out std_logic);
 end component;

 component or_2
  port(a,b : in std_logic;
   z  : out std_logic);
 end component;

 component fulladder
  port(a,b,c_in : in std_logic;
   s,c_out  : out std_logic);
 end component;

 component mux_2
  port (a,b,s : in std_logic;
   z  : out std_logic);
 end component;

 component mux_4
  port(a,b,c,d,s0,s1 : in std_logic;
   z    : out std_logic);
 end component;

 signal s_n0, s_n1  : std_logic := '0';
 signal s_m0, s_m1  : std_logic := '0';
 signal s_a   : std_logic := '0';
 signal s_ad_s  : std_logic := '0';
 signal s_o   : std_logic := '0';

begin

N0 : not_1 port map
  (x => a,
   z => s_n0);

N1  : not_1 port map
  (x => b,
   z => s_n1);

M0 : mux_2 port map
  (a => a, b => s_n0, s => a_invert,
   z => s_m0);

M1 : mux_2 port map
  (a => b, b => s_n1, s => b_invert,
   z => s_m1);

AN  : and_2 port map
  (a => s_m0, b => s_m1,
   z => s_a);

O : or_2 port map
  (a => s_m0, b => s_m1,
   z => s_o);

AD : fulladder port map
  (a => s_m0, b => s_m1, c_in => c_in,
   s => s_ad_s, c_out => c_out);

M2 : mux_4 port map
  (a => s_a, b => s_o, c => s_ad_s, d => less,
  s0 => op(1), s1 => op(0),
   z => z);

end structural;
