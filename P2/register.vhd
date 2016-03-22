library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	port (
		reg1, reg2, write_address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		RegWrite: in STD_LOGIC;
		clk : in std_ulogic;
		read_data1, read_data2: out STD_LOGIC_VECTOR (31 downto 0)
	);
end reg;

architecture behavioral of reg is	  

type reg_array is array(0 to 7) of STD_LOGIC_VECTOR (31 downto 0);

begin
  -- <<enter your statements here>>								
  reg_process: process(write_address, write_data, clk)
  variable data_reg: reg_array := (
    X"00000000", -- initialize registers
    X"00000001",
    X"00000002",
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007");
  variable w_addr, addr1, addr2: integer;  
  
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
	  addr1 := to_integer(reg1(7 downto 0));
	  addr2 := to_integer(reg2(7 downto 0));
	  w_addr := to_integer(write_address(7 downto 0));
	  if (clk'EVENT and clk = '1') then
	  		read_data1 <= data_reg(addr1) after 2 ns;
	  		read_data2 <= data_reg(addr2) after 2 ns;
			if (RegWrite = '1') then
				data_reg(w_addr) := write_data;
			end if;
	  end if;
  end process reg_process;
end behavioral;
