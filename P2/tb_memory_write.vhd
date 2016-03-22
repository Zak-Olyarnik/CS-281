library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_memory is
end entity;

architecture behavioral of tb_memory is

component clock1
 port (
  clk: out STD_LOGIC
 );
end component;

component memory
 port (
  address, write_data : in std_logic_vector(31 downto 0);
  MemWrite, MemRead: in STD_LOGIC;
  clk : in STD_LOGIC;
  read_data : out std_logic_vector (31 downto 0)
 );
end component;

signal clock_signal : std_logic := '0';
signal data_out, newAddr : std_logic_vector(31 downto 0);
signal rs, ws : std_logic;

begin

 TEST_CLOCK : clock1
  port map (
   clk => clock_signal
  );
 TEST_MEM : memory
  port map (
	address => newAddr,
	write_data => X"0000000F",
	MemWrite => ws,
	MemRead => rs,
   clk => clock_signal,
	read_data => data_out
  );

newAddr <= X"00000001";
           --X"00000002" after 30 ns,
           --X"00000003" after 50 ns,
           --X"00000004" after 70 ns;
           --X"00000005" after 50 ns,
           --X"00000006" after 60 ns,
           --X"00000007" after 70 ns;
ws <= '1' after 10 ns,
		'0' after 20 ns,
		'1' after 30 ns,
		'0' after 40 ns,
		'1' after 50 ns,
		'0' after 60 ns,
		'1' after 70 ns;
rs <= '0' after 10 ns,
		'1' after 20 ns,
		'0' after 30 ns,
		'1' after 40 ns,
		'0' after 50 ns,
		'1' after 60 ns,
		'0' after 70 ns;

end behavioral;
