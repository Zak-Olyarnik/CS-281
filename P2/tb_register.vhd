library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_register is
end entity;

architecture behavioral of tb_register is

component clock1
 port (
  clk: out STD_LOGIC
 );
end component;

component reg
 port (
  reg1, reg2, write_address, write_data : in std_logic_vector(31 downto 0);
  RegWrite : in STD_LOGIC;
  clk : in STD_LOGIC;
  read_data1, read_data2 : out std_logic_vector (31 downto 0)
 );
end component;

signal clock_signal : std_logic := '0';
signal data_out1, data_out2 : std_logic_vector(31 downto 0);
signal ws : std_logic;

begin

 TEST_CLOCK : clock1
  port map (
   clk => clock_signal
  );
 TEST_REG : reg
  port map (
	reg1 => X"00000001",
	reg2 => X"00000002",
	write_address => X"00000001",
	write_data => X"0000000F",
	RegWrite => ws,
   clk => clock_signal,
	read_data1 => data_out1,
	read_data2 => data_out2
  );

ws <= '0' after 10 ns,
		'1' after 40 ns;

end behavioral;
