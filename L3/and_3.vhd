library IEEE;
use IEEE.std_logic_1164.all;

entity and_3 is
	port (
		a: in STD_LOGIC;
		b: in STD_LOGIC;
		c: in STD_LOGIC;
		z: out STD_LOGIC
	);
end and_3;

architecture behavioral of and_3 is
begin
  z <= (a and b and c) after 2 ns;
end behavioral;
