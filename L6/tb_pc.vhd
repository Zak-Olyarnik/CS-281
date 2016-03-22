library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_pc is
end entity;

architecture behavioral of tb_pc is

component clock1
 port (
  clk: out STD_LOGIC
 );
end component;

component PCv2
 port (
  Load_Value : in std_logic_vector(31 downto 0);
  clk : in STD_LOGIC;
  Curr_PC_Value : out std_logic_vector (31 downto 0)
 );
end component;

signal clock_signal : std_logic := '0';
signal Curr_Address, newAddr : std_logic_vector(31 downto 0);

begin

 TEST_CLOCK : clock1
  port map (
   clk => clock_signal
  );
 TEST_PC : PCv2
  port map (
   Load_Value => newAddr,
   clk => clock_signal,
   Curr_PC_Value => Curr_Address
  );

newAddr <= X"00000001" after 10 ns,
           X"00000002" after 20 ns,
           X"00000003" after 30 ns,
           X"00000004" after 40 ns,
           X"00000005" after 50 ns,
           X"00000006" after 60 ns,
           X"00000007" after 70 ns;

end behavioral;
