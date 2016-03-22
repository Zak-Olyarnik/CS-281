  del *.cf *.vcd
  ghdl -a    clock1.vhd
  ghdl -a    pc.vhd
  ghdl -a    pcv2.vhd
  ghdl -a tb_pc.vhd
  ghdl -e    clock1
  ghdl -e    pc
  ghdl -e    pcv2
  ghdl -e tb_pc
  ghdl -r tb_pc    --stop-time=200ns --disp-time --vcd=tb_pc.vcd
  gtkwave tb_pc.vcd
