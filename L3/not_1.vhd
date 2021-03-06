library IEEE;
use IEEE.std_logic_1164.all;

entity not_1 is
	port (
		x: in STD_LOGIC;
		z: out STD_LOGIC
	);
end not_1;

architecture behavioral of not_1 is
begin
  z <= (not x) after 2 ns;
end behavioral;
