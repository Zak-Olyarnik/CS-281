-- TEST BENCH MULTIPLEXER 4-1 STRUCTURAL

library IEEE;
use IEEE.std_logic_1164.all;

entity  tb_mux41s is
end entity;

architecture structural of tb_mux41s is

component mux41s is
        port (
                x0: in STD_LOGIC;
                x1: in STD_LOGIC;
                x2: in STD_LOGIC;
                x3: in STD_LOGIC;
                s0: in STD_LOGIC;
                s1: in STD_LOGIC;
                z: out STD_LOGIC
        );
end component;

signal x0_in, x1_in, x2_in, x3_in, s0_in, s1_in, z_out  :  STD_LOGIC;

begin

  TB : mux41s
    port map(
    x0 => x0_in,
    x1 => x1_in,
    x2 => x2_in,
    x3 => x3_in,
    s0 => s0_in, 
    s1 => s1_in,
    z => z_out
    );
                
  x0_in <= '0' after 0 ns, '1' after 15 ns, '0' after 30 ns, '1' after 45 ns, '0' after 60 ns;
  x1_in <= '0' after 0 ns, '1' after 15 ns, '1' after 30 ns, '1' after 45 ns, '0' after 60 ns;
  x2_in <= '0' after 0 ns, '0' after 15 ns, '0' after 30 ns, '1' after 45 ns, '1' after 60 ns;
  x3_in <= '0' after 0 ns, '0' after 15 ns, '0' after 30 ns, '1' after 45 ns, '0' after 60 ns;
  s0_in <= '0' after 0 ns,                  '1' after 30 ns,                  '0' after 60 ns;
  s1_in <= '1' after 0 ns,                  '1' after 30 ns,                  '0' after 60 ns;

end structural;
