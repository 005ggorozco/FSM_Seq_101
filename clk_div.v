/*
========================================================================================
                                   CLOCK DIVIDER
========================================================================================
Description: 
 This module takes a high-frequency input clock (clk_in) and divides it down to a
 lower frequency. By default, it divides a 50MHz input clock down to 1s clock period
 toggling the outputs every 25,000,000 ticks.
 
 Design Engineer:
  Gabriel G. Orozco
 Date:
  30 Mar 2026
*/


module clk_div(clkOut, clkOut2, clkIn);
    input clkIn;
    // define initial values for clock
    output reg clkOut = 1'b0;
    output reg clkOut2 = 1'b0; // 2nd output for led indicator

    /*/ cpld clock speed is 50Mhz
    parameter integer ticksAtHalfSec = 75_000_000;
    reg[27:0] tickCount = 27'b0; // log base 2 (75_000_000) = 26.16 or 27*/
	 
	 // Division factor
	 parameter integer FREQ_IN = 50_000_000; // 50MHz
	 parameter integer PERIOD_OUT = 1; // 1s
	 localparam integer TICKS = (FREQ_IN*PERIOD_OUT)/2; // Number of ticks every half cycle
	 
	 integer tickCount = 0;

    always @(posedge clkIn) begin
        // if tick count has reached half of the clock input ticks
        if(tickCount == (TICKS - 1)) begin 
            clkOut <= ~clkOut;
            clkOut2 <= ~clkOut;

            tickCount <= 27'b0; // clear tick count
        end 
        else tickCount <= tickCount + 1; // increment by one
    end // always end
endmodule