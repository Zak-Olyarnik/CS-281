library IEEE;
use IEEE.std_logic_1164.all;

--declares inputs and outputs
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

--declares other files needed
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

--declares other variables needed
 signal s_ALU31_set : std_logic := '0';
 signal s_carry : STD_LOGIC_vector (30 downto 0);
 signal s_result : STD_LOGIC_vector (31 downto 0);
 signal s_NotZero : std_logic := '0';
 signal ground : std_logic := '0';

begin
 first : alu1	--says to run alu1 (above) with the following inputs
  port map (		--this is separated from the for because we know
   a => abus(0),	--there will be no carry in to worry about
   b => bbus(0),
   c_in => binv,
   less => s_ALU31_set,
   a_invert => ainv,
   b_invert => binv,
   op => aluop,
   z => s_result(0),
   c_out => s_carry(0)
   );

 middle : for i in 1 to 30 generate	--VHDL for statement, generates the
  begin											--middle bits by running alu1 30
   ALU : alu1									--times witht the following inputs
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

 last : alu1v	--says to run alu1v (above) with the following inputs
  port map (		--this is separated from the for because we care about
   a => abus(31),	--collecting overflow, which alu1v handles
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

 result <= s_result;	--this is the final result

--zero flag - all the bits are or'ed together and the result is negated, so
	--if they were all zero, the flag is set to one
 O : or_32 port map (x => s_result, z => s_NotZero);
 N : not_1 port map (x => s_NotZero, z => zero);

end structural;
