-- TEST BENCH MULTIPLEXER 4-1 BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux41bv2 is
end entity;

architecture behavioral of tb_mux41bv2 is

component mux41bv2 is
        port(
              A, B, C, D : in std_logic;
              SEL: in std_logic_vector (1 downto 0);
              Z: out std_logic
              );
end component;

signal i0,i1,i2,i3,z_out  :  std_logic;
signal sel_in : std_logic_vector (1 downto 0) ;

begin

  TB : mux41bv2
    port map(
    A => i0,
    B => i1,
    C => i2,
    D => i3,
    SEL => sel_in,
    Z => z_out
    );

   i0 <= '0' after  0 ns, '0' after 10 ns, '1' after 20 ns,
         '0' after 30 ns, '1' after 40 ns, '1' after 50 ns,
         '0' after 60 ns, '1' after 70 ns ;
   i1 <= '1' after  0 ns, '1' after 10 ns, '1' after 20 ns,
         '0' after 30 ns, '0' after 40 ns, '0' after 50 ns,
         '0' after 60 ns, '1' after 70 ns ;
   i2 <= '1' after  0 ns, '0' after 10 ns, '0' after 20 ns,
         '0' after 30 ns, '0' after 40 ns, '1' after 50 ns,
         '1' after 60 ns, '1' after 70 ns ;
   i3 <= '1' after  0 ns, '0' after 10 ns, '1' after 20 ns,
         '1' after 30 ns, '0' after 40 ns, '1' after 50 ns,
         '0' after 60 ns, '0' after 70 ns ;

   sel_in <= "00" after  0 ns, "01" after 10 ns, "10" after 20 ns,
             "11" after 30 ns, "00" after 40 ns, "01" after 50 ns,
             "10" after 60 ns, "11" after 70 ns ;

end behavioral;

