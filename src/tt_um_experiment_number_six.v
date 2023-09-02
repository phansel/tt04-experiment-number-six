`default_nettype none

module tt_um_experiment_number_six (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


// input: number between 0->50
// output uio_out: function encoded in LaTeX as ASCII
// output uo_out: laplace transform of function encoded in latex as ASCII

// mystery bit: triggers CQ DE KC1GPW

//assign uio_out = 8'b11111111;
assign uio_oe = 8'b11111111;
//assign uo_out = 8'b11111111;

wire [5:0] fn_id;

reg [1:0] cnt_div_pre; // divide the clock by 2**(2**(cnt_div*2))
// 2**(2**(0*2)) = 2
// 2**(2**(1*2)) = 2**4 = 16
// 2**(2**(2*2)) = 2**16 = 65536
// 2**(2**3) = 2**8 = 256

reg [31:0] cnt;


wire [7:0] line;
wire [7:0] lhs, rhs;
wire [7:0] mem_addr;
wire [15:0] pointer_addr;
wire [15:0] mem_dout;

wire rst;
assign rst = ~rst_n;

transformer transformer_1 (
	.line(line),
	.clk(clk),
	.rst_n(rst_n),
	.lhs(lhs),
	.rhs(rhs),
	.pointer_addr(pointer_addr),
	.mem_addr(mem_addr),
	.mem_dout(mem_dout)
);


// stores the transforms as packed ascii
memory_chars memory_1 (
    .addr(mem_addr),
    .dout(mem_dout),
    .clk(clk),
    .rst(rst)
);

// gets the appropriate indices for each line
line_mapper line_mapper_1 (
    .line(line),
    .addr(pointer_addr)
);

// ignore top two bits for now
assign line = {2'b0, ui_in[5:0]};
assign uio_out = lhs;
assign uo_out = rhs;


endmodule
