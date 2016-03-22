library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_alu1 is
end entity;

architecture behavioral of tb_alu1 is

component alu1 is
 port (
  a:  in STD_LOGIC;
  b:  in STD_LOGIC;
  c_in:  in STD_LOGIC;
  less:  in STD_LOGIC;
  a_inv: in STD_LOGIC;
  b_inv: in STD_LOGIC;
  op :  in STD_LOGIC_vector (1 downto 0);
  z:  out STD_LOGIC;
  c_out: out STD_LOGIC
 );
end component;

signal a_in, b_in : STD_LOGIC;
signal op : STD_LOGIC_vector (3 downto 0);
signal zero_out, v_out, carry_out : std_logic;
signal result_out : STD_LOGIC;
signal a_int, b_int, carry_in : STD_LOGIC;

begin
  TB : alu1
    port map(
 a => a_in,
 b => b_in,
 c_in => carry_in,
 less => carry_in,
    a_inv => op(3),
    b_inv => op(2),
    op(1) => op(1),
 op(0) => op(0),
    z => result_out,
     c_out => carry_out
    );

 op(3) <= '0' after 0 ns; --do not invert A
 op(2) <= '0' after 0 ns; -- no subtraction
 op(1) <= '1' after 0 ns; -- add
 op(0) <= '0' after 0 ns; -- add


end behavioral;
