-- FULL ADDER BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
 port(a,b,c_in : in STD_LOGIC;
  sum,c_out: out STD_LOGIC);
end full_adder;

architecture behavioral of full_adder is

signal s1,s2,s3 : STD_LOGIC;

constant gate_delay: Time:=5 ns;

begin
 s1 <= (a xor b) after gate_delay;
 s2 <= (c_in and s1) after gate_delay;
 s3 <= (a and b) after gate_delay;
 sum <= (s1 xor c_in) after gate_delay;
 c_out <= (s2 or s3) after gate_delay;
end behavioral;

         
