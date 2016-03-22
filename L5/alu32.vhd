library IEEE;
use IEEE.std_logic_1164.all;

entity alu32 is
 port (
  abus: in STD_LOGIC_vector (31 downto 0);
  bbus: in STD_LOGIC_vector (31 downto 0);
  ainv: in STD_LOGIC;
  binv: in STD_LOGIC;
  aluop : in STD_LOGIC_vector (1 downto 0);
  zero: out STD_LOGIC;
  result: out STD_LOGIC_vector (31 downto 0);
  overflow: out STD_LOGIC
 );
end alu32;

architecture structural of alu32 is

 component not_1
  port (x : in std_logic;
   z : out std_logic);
 end component;

 component or_32
  port (x : in STD_LOGIC_vector(31 downto 0);
   z : out std_logic);
 end component;

 component alu1
  port(a,b,c_in,less,a_invert,b_invert : in std_logic;
   op : in STD_LOGIC_vector (1 downto 0);
   z,c_out : out std_logic);
 end component;

 component alu1v
  port(a,b,c_in,less,a_invert,b_invert : in std_logic;
   op : in STD_LOGIC_vector (1 downto 0);
   z,set,v : out std_logic);
 end component;

 signal s_ALU31_set : std_logic := '0';
 signal s_carry : STD_LOGIC_vector (30 downto 0);
 signal s_result : STD_LOGIC_vector (31 downto 0);
 signal s_NotZero : std_logic := '0';
 signal ground : std_logic := '0';

begin
 first : alu1
  port map (
   a => abus(0),
   b => bbus(0),
   c_in => binv,
   less => s_ALU31_set,
   a_invert => ainv,
   b_invert => binv,
   op => aluop,
   z => s_result(0),
   c_out => s_carry(0)
   );

 middle : for i in 1 to 30 generate
  begin
   ALU : alu1
     port map (
      a => abus(i),
      b => bbus(i),
      c_in => s_carry(i-1),
      less => ground,
      a_invert => ainv,
      b_invert => binv,
      op => aluop,
      z => s_result(i),
      c_out => s_carry(i)
      );
  end generate middle;

 last : alu1v
  port map (
   a => abus(31),
   b => bbus(31),
   c_in => s_carry(30),
   less => ground,
   a_invert => ainv,
   b_invert => binv,
   op => aluop,
   z => s_result(31),
   set => s_ALU31_set,
   v => overflow
   );

 result <= s_result;

 O : or_32 port map (x => s_result, z => s_NotZero);
 N : not_1 port map (x => s_NotZero, z => zero);

end structural;
