-- MULTIPLEXER 4-1 BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity mux41bv1 is
        port (S1, S0, A, B, C, D: in std_logic;
              Z: out std_logic);
end mux41bv1;

architecture behavioral of mux41bv1 is

begin
  Z <= A when S1='0' and S0='0' else
       B when S1='0' and S0='1' else
       C when S1='1' and S0='0' else
       D;
end behavioral;
