-- MULTIPLEXER 4-1 BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity mux41bv0 is
        port (S1, S0, A, B, C, D: in std_logic;
              Z: out std_logic);
end mux41bv0;

architecture behavioral of mux41bv0 is

begin
  Z <= (A and not S0 and not S1) or
       (B and     S0 and not S1) or
       (C and not S0 and     S1) or
       (D and     S0 and     S1);
end behavioral;
