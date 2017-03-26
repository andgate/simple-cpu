
// Basys clockspeed is 50Mhz by default,


module clock(clksrc, clk, clklk);
	input clksrc;
	output reg clk;
	output clklk;
	
	localparam threshold = 50000; // mclk freq / target freq or mclk freq * wait_time
 	reg [31:0] count;
	
	assign clklk = 1;
	
	always @ (posedge(clksrc)) begin
		if (count == threshold - 1) begin
			count <= 32'b0;
			clk <= ~clk;
		end else begin
			count <= count + 1;
			clk <= clk;
		end
	end
	
endmodule
