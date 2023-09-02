module transformer(
input wire start, // goes high when the user wants to start printing
input wire [7:0] line, // which line do we want?
input wire clk,        // clock
input wire rst,      // reset
output wire [7:0] lhs, // input version
output wire [7:0] rhs, // transformed version
input wire [15:0] pointer_addr, // what is the array ref for this txform?
output reg [7:0] mem_addr, // which address in memory has our chars?
input wire [15:0] mem_dout // what's the data
);


wire [7:0] line_start;
wire [7:0] line_len;

assign line_start = pointer_addr[7:0];
assign line_len = pointer_addr[15:8];

// output assignment - the ascii chars
assign lhs = mem_dout[15:8];
assign rhs = mem_dout[7:0];

reg [7:0] chars_remaining;

always @(posedge clk) begin
    if ((rst) && (~start)) begin
        mem_addr <= 8'hFF;
        chars_remaining <= 8'd0;
    end
    if ((~rst) && (~start)) begin
        mem_addr <= line_start;
        chars_remaining <= line_len;
    end
    else begin
        if ( chars_remaining > 0) begin
        mem_addr <= mem_addr + 1;
        chars_remaining <= chars_remaining - 1;
        end
    end
    /*
    else if (chars_remaining == 0) begin
        mem_addr = 8'hFF;
    */
end

endmodule
