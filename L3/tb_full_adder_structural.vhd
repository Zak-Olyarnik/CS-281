-- TEST BENCH FULL ADDER STRUCTURAL

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_full_adder_s is
	port (
		sum: out STD_LOGIC;
		carry: out STD_LOGIC
	);
end entity;

architecture structural of tb_full_adder_s is

component full_adder
        port (
                a : in STD_LOGIC;
                b : in STD_LOGIC;
                c_in : in STD_LOGIC;
                sum: out STD_LOGIC;
                c_out: out STD_LOGIC
	);
end component;

  signal myA, myB, myC, mySum, myC_out : STD_LOGIC;

begin

   TB: full_adder
    port map (
    a => myA,
    b => myB, 
    c_in => myC, 
    sum => mySum, 
    c_out => myC_out
    );
   
  sum <= mySum;
  carry <= myC_out;

  myA <= '0' after   0 ns,
         '1' after  20 ns,
	 '0' after  40 ns,
         '1' after  60 ns,
	 '0' after  80 ns,
         '1' after 100 ns,
	 '0' after 120 ns,
         '1' after 140 ns,
         '0' after 160 ns,
         '1' after 200 ns;

  myB <= '0' after   0 ns,
         '0' after  20 ns,
	 '1' after  40 ns,
         '1' after  60 ns,
	 '0' after  80 ns,
         '0' after 100 ns,
	 '1' after 120 ns,
         '1' after 140 ns,
         '0' after 160 ns;

  myC <= '0' after   0 ns,
         '0' after  20 ns,
	 '0' after  40 ns,
         '0' after  60 ns,
	 '1' after  80 ns,
         '1' after 100 ns,
	 '1' after 120 ns,
         '1' after 140 ns,
         '0' after 160 ns;

end structural;

