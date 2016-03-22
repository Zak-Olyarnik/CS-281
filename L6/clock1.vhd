library IEEE;
use IEEE.std_logic_1164.all;

entity clock1 is
 port (
  clk : out STD_LOGIC := '0'
 );
end clock1;

architecture behavioral of clock1 is

 signal internal : STD_LOGIC := '0';
 constant half_period : time := 25 ns;

begin

 process(internal)
 begin
  internal <= not internal after half_period;
 end process;

clk <= internal;

end behavioral;

