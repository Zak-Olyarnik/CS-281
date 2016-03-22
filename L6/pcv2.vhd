library IEEE;
use IEEE.std_logic_1164.all;

entity PCv2 is
 port (
  Load_Value : in std_logic_vector (31 downto 0) ;
  clk : in std_ulogic ;
 Curr_PC_Value : out std_logic_vector (31 downto 0)
       );
end PCv2 ;

architecture behavioral of PCv2 is

signal internal : std_logic_vector (31 downto 0) := X"00000000" ;

begin

process (clk)
begin

 if (clk'EVENT and clk = '1') then
  internal <= Load_Value ;
    end if;
end process;

Curr_PC_Value <= internal ;

end behavioral ;
