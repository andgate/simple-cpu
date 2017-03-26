# Sky
Graph reduction machine with SKI based assembly langauge, written in Haskell and intended for testing on an FPGA.

This project is specifically for a Basys2 at the moment.

To setup, install ISE, Adept, and CLaSH, following their directions on the net.

To build this project, run the following command

`clash Machine/Sky.hs --verilog -odir build -hidir build`

or

`clash --interactive Machine/Sky.hs -odir build -hidir build`

With interactive mode, use `:verilog` and `reload` respectively.
This is the preferred mode for testing individual functions.

The verilog files produced can then be copied into an ISE project for preparing a .bit file.
The .bit is then flashed to a Basys2.