library IEEE;
use IEEE.std_logic_1164.all;

entity tb_clock is
end entity;

architecture behavioral of tb_clock is

component clock1 is
 port (
  clk : out STD_LOGIC
  );
end component;

component clock2 is
 port(
  clk : inout STD_LOGIC
  );
end component;

signal clk1_out : std_logic := '0';
signal clk2_out : STD_LOGIC := '0';

begin

 TB1 : clock1
  port map (
   clk => clk1_out
   );

 TB2 : clock2
  port map (
   clk => clk2_out
   );

end behavioral;
