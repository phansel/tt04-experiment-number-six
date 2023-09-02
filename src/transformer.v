module transformer(
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

reg [7:0] char_count;

// set the addresses according to what we'd expect
always @(posedge clk, posedge rst) begin
    if (rst) begin
        mem_addr <= line_start;
        char_count <= 8'd0;
    end else begin
        if (char_count < line_len) begin
            mem_addr <= mem_addr + 1;
            char_count <= char_count + 1;
        end else begin
            // out of bounds or whatever
            mem_addr <= 8'b11111111;
        end
    end
end

endmodule
