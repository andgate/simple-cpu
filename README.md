# A Basic CPU
A simple machine architecture, written with CLaSH for testing on a Basys2 FPGA board.

To setup, install ISE, Adept, and CLaSH, following their directions on the net.

To build this project, run the following command

`clash Machine/Basic.hs --verilog -odir build -hidir build`

or

`clash --interactive Machine/Basic.hs -odir build -hidir build`

With interactive mode, use `:verilog` and `reload` respectively.
This is the preferred mode for testing individual functions.

The verilog files produced can then be copied into an ISE project for preparing a .bit file.
The .bit is then flashed to a Basys2.