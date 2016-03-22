library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
 port (
  Load_Value : in std_logic_vector(31 downto 0);
  clk : in STD_LOGIC;
  Curr_PC_Value : out std_logic_vector (31 downto 0)
 );
end PC;
  
architecture behavioral of PC is

signal internal : std_logic_vector(31 downto 0) := X"00000000" ;

begin

process (Load_Value, clk)
begin

 if (clk'event and clk = '1') then
  internal <= Load_Value;
 end if;
end process;

Curr_PC_Value <= internal;

end behavioral;
