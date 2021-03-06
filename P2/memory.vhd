library IEEE;
use IEEE.std_logic_1164.all;

entity memory is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead: in STD_LOGIC;
		clk : in std_ulogic;
		read_data: out STD_LOGIC_VECTOR (31 downto 0)
	);
end memory;

architecture behavioral of memory is	  

type mem_array is array(0 to 7) of STD_LOGIC_VECTOR (31 downto 0);

begin
  -- <<enter your statements here>>								
  mem_process: process(address, write_data, clk)
  variable data_mem: mem_array := (
    X"00000000", -- initialize data memory
    X"00000001",
    X"00000002",
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007");
  variable addr: integer;  
  
  function to_integer(X: STD_LOGIC_VECTOR) return INTEGER is
  variable result: INTEGER;
  begin
	  result := 0;
	  for i in X'range loop
		  result := result * 2;
		  case X(i) is
			  when '0' | 'L' => null;
			  when '1' | 'H' => result := result + 1;
			  when others => null;
		  end case;
	  end loop;
	  return result;
  end to_integer;
  
  begin
	  addr := to_integer(address(7 downto 0));
	  if (MemWrite = '1' and clk'EVENT and clk = '1') then
		  data_mem(addr) := write_data;
	  elsif (MemRead = '1' and clk'EVENT and clk = '1') then
		  read_data <= data_mem(addr) after 2 ns;
	  end if;
  end process mem_process;
end behavioral;
