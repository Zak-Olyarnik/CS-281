: Analysis command
:      $ ghdl -a [options] files
: The analysis command compiles one or more files, and creates an object file for each source file. GHDL analyzes each filename in the given order, and stops the analysis in case of error.
:
: Elaboration command
:      $ ghdl -e [options] primary_unit [secondary_unit]
: On GNU/Linux the elaboration command creates an executable containing the code of the  VHDL  sources, the elaboration code and simulation code to execute a design hierarchy. On Windows this command elaborates the design but does not generate anything. For the elaboration command,  GHDL  re-analyzes all the configurations, entities, architectures and package declarations, and creates the default configurations and the default binding indications according to the LRM rules. It also generates the list of objects files required for the executable. Then, it links all these files with the runtime library. The actual elaboration is performed at runtime. On Windows this command can be skipped because it is also done by the run command.
:
: Run command
: Run (or simulate) a design.
:      $ ghdl -r [options] primary_unit [secondary_unit] [simulation_options]
: The options and arguments are the same as for the elaboration command, see Elaboration command. On GNU/Linux this command simply determines the filename of the executable and executes it. Options are ignored. You may also directly execute the program. On Windows this command elaborates and launches the simulation. As a consequence you must use the same options used during analysis.
: Options
: --vcd= FILENAME
: --vcdgz= FILENAME
: --vcd  dumps into the VCD file FILENAME the signal values before each non-delta cycle.
: If FILENAME is � - ', then the standard output is used, otherwise a file is created or overwritten.
: The  --vcdgz  option is the same as the  --vcd  option, but the output is compressed using the zlib.
:
  del *.cf *.vcd
  ghdl -a    half_adder_behavioral.vhd
  ghdl -a tb_half_adder_behavioral.vhd
  ghdl -e    half_adder
  ghdl -e tb_half_adder_b
  ghdl -r tb_half_adder_b --stop-time=100ns --disp-time --vcd=tb_half_adder_b.vcd
  gtkwave tb_half_adder_b.vcd
