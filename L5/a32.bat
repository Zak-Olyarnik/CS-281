  del *.cf *.vcd
:
  ghdl -a alu1.vhd
  ghdl -a alu1v.vhd
  ghdl -a alu32.vhd
  ghdl -a and_2.vhd
  ghdl -a and_3.vhd
  ghdl -a fulladder.vhd
  ghdl -a mux_2.vhd
  ghdl -a mux_4.vhd
  ghdl -a nand_2.vhd
  ghdl -a nand_3.vhd
  ghdl -a nand_4.vhd
  ghdl -a not_1.vhd
  ghdl -a or_2.vhd
  ghdl -a or_3.vhd
  ghdl -a or_32.vhd
  ghdl -a or_4.vhd
: ghdl -a tb_alu1.vhd
  ghdl -a tb_alu_32.vhd
  ghdl -a xor_2.vhd
:
  ghdl -e nand_2
  ghdl -e nand_3
  ghdl -e nand_4
  ghdl -e and_2
  ghdl -e and_3
  ghdl -e not_1
  ghdl -e or_2
  ghdl -e or_3
  ghdl -e or_32
  ghdl -e or_4
  ghdl -e xor_2
  ghdl -e mux_2
  ghdl -e mux_4
  ghdl -e alu1
  ghdl -e alu1v
  ghdl -e alu32
  ghdl -e fulladder
: ghdl -e tb_alu1
  ghdl -e tb_alu_32
  ghdl -r tb_alu_32 --stop-time=500ns --disp-time --vcd=tb_alu_32.vcd
  gtkwave tb_alu_32.vcd
