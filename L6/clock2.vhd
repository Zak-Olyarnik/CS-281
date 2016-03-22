library IEEE;
use IEEE.std_logic_1164.all;

entity clock2 is
 port (
  clk : inout STD_LOGIC := '0'
  );
end clock2 ;

architecture behavioral of clock2 is

constant half_period: Time:= 25 ns;

begin

 process
 begin
  wait for half_period ;
  clk <= not clk ;
 end process ;

end behavioral ;

