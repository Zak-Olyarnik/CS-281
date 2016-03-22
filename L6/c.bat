  del *.cf *.vcd
  ghdl -a    clock1.vhd
  ghdl -a    clock2.vhd
  ghdl -a tb_clock.vhd
  ghdl -e    clock1
  ghdl -e    clock2
  ghdl -e tb_clock
  ghdl -r tb_clock --stop-time=200ns --disp-time --vcd=tb_clock.vcd
  gtkwave tb_clock.vcd
