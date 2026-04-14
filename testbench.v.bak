// testbench for seq_101

module testbench;
 // tb signals
 reg in;
 reg clk;
 reg rst_n;
 wire out;
 wire [1:0] state;
 
 // instantiate seq_101
 seq_101 dut (
  .out(out), 
  .state(state),
  .in(in), 
  .clk(clk), 
  .rst_n(rst_n)
 );
 
 // apply stimuli
 initial clk = 1'b0; // set initial value of clk to 0
 always #1 clk = ~clk;
 
 initial begin
  rst_n=0; in=1; #6; // state won't change during this point because reset is active
  rst_n=1; in=1; #2;
  rst_n=1; in=0; #2;
  rst_n=1; in=1; #2;
  rst_n=1; in=0; #2; 
 
 end

endmodule