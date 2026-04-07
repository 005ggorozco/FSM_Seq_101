// top level design for sequence 101
module top_seq_101(out, state, clk_led, in, clk_in, rst_n);
	input in;
	input clk_in;
	input rst_n;
	output clk_led;
	output [1:0] state;
	output out;
	
	// nets
	wire clk_w;
	
	// clock divider instance
	clk_div #(.PERIOD_OUT(3)) divider(
		.clkOut(clk_w),
		.clkOut2(clk_led),
		.clkIn(clk_in)
	);
	
	// seq_101 instance
	seq_101 seq(
		.out(out),
		.state(state),
		.in(in),
		.clk(clk_w),
		.rst_n(rst_n)
	);

endmodule
