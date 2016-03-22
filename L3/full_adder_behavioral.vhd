-- FULL ADDER BEHAVIORAL

library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is 
        port(
	        a : in STD_LOGIC;
	        b : in STD_LOGIC;
	        c_in : in STD_LOGIC;
                sum : out STD_LOGIC;
                c_out : out STD_LOGIC
	);
end full_adder;

architecture behavioral of full_adder is

signal s1,s2,s3 : STD_LOGIC;

begin
  s1 <= (a xor b) after 5 ns;
  s2 <= (c_in and s1) after 5 ns;
  s3 <= (a and b) after 5 ns;
  sum <= (s1 xor c_in) after 5 ns;
  c_out <= (s2 or s3) after 5 ns;
end behavioral;

	 
