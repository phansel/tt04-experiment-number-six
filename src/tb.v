`default_nettype none
`timescale 1ns/1ps

module tb();
    
    reg clk;
    reg rst_n;
    reg ena;
    reg [7:0] ui_in;
    reg [7:0] uo_out;
    reg [7:0] uio_in;
    reg [7:0] uio_out;
    reg [7:0] uio_oe;
	
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
	//rst_n = 1;
	//ui_in = 0;
  	//#1;
	//rst_n = 0;
	//#5; 
	//rst_n = 1;
    end



    tt_um_experiment_number_six tt_um_experiment_number_six_1 (
    	.ui_in(ui_in),
	.uo_out(uo_out),
	.uio_in(uio_in),
	.uio_out(uio_out),
	.uio_oe(uio_oe),
	.ena(ena),
	.clk(clk),
	.rst_n(rst_n)
    );

endmodule
