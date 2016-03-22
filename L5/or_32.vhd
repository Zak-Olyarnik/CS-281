library IEEE;
use IEEE.std_logic_1164.all;

entity or_32 is
 port (
  x: in STD_LOGIC_vector(31 downto 0);
  z: out STD_LOGIC
 );
end or_32;

architecture behavioral of or_32 is
begin

z <= x(0)
or x(1)
or x(2)
or x(3)
or x(4)
or x(5)
or x(6)
or x(7)
or x(8)
or x(9)
or x(10)
or x(11)
or x(12)
or x(13)
or x(14)
or x(15)
or x(16)
or x(17)
or x(18)
or x(19)
or x(20)
or x(21)
or x(22)
or x(23)
or x(24)
or x(25)
or x(26)
or x(27)
or x(28)
or x(29)
or x(30)
or x(31) after 3 ns;

end behavioral;

