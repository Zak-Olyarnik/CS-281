-- MULTIPLEXER 4-1 BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity mux41bv3 is
        port (A, B, C, D: in std_logic;
              SEL: in std_logic_vector(1 downto 0);
              Z: out std_logic);
end mux41bv3;

architecture behavioral of mux41bv3 is

begin
  with SEL select
  Z <= A when "00",
       B when "01",
       C when "10",
       D when "11";
end behavioral;
