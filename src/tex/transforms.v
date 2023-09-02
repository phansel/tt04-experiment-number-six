module memory(
input wire [7:0] addr, 
output reg [15:0] dout, 
input clk);

always @(posedge clk) begin
    case(addr) 
        8'b00000000: dout <= 16'b0011000100110001;
        8'b00000001: dout <= 16'b0010111100100000;
        8'b00000010: dout <= 16'b0111001100100000;
        8'b00000011: dout <= 16'b0011000101110100;
        8'b00000100: dout <= 16'b0010111100100000;
        8'b00000101: dout <= 16'b0111001100100000;
        8'b00000110: dout <= 16'b0101111000100000;
        8'b00000111: dout <= 16'b0011001000100000;
        default: dout <= 16'b0010000000100000;
    endcase;
end

endmodule



module line_mapper(
input wire clk, 
input wire [5:0] line, 
output reg [11:0] addr);

always @(posedge clk) begin
    case(line)
    8'b00000000: addr <= 12'b000011000000;
    8'b00000001: addr <= 12'b000101000011;
    endcase;
end

endmodule



module transformer(
input wire [5:0] line, // which line do we want?
input wire clk,        // clock
input wire rst_n,      // reset_n
output wire [7:0] lhs, // input version
output wire [7:0] rhs, // transformed version
input wire [11:0] pointer_addr, // what is the array ref for this txform?
output reg [7:0] mem_addr, // which address in memory has our chars?
input wire [15:0] mem_dout // what's the data 
);
 

wire [5:0] line_start, line_len;

assign line_start = pointer_addr[5:0];
assign line_len = pointer_addr[11:6];

// output assignment - the ascii chars
assign lhs = mem_dout[15:8];
assign rhs = mem_dout[7:0];

reg [7:0] char_count;

// set the addresses according to what we'd expect
always @(posedge clk) begin
    if (~rst_n) begin
        mem_addr <= line_start;
        char_count <= 8'd0;
    end else begin
        if (char_count < line_len) begin
            mem_addr <= mem_addr + 1;
            char_count <= char_count + 1;
        end else begin
            // out of bounds or whatever
            mem_addr = 8'b11111111;
        end
    end
end

endmodule
