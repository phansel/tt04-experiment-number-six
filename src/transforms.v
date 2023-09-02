module memory_chars(
input wire [7:0] addr, 
output reg [15:0] dout, 
input rst,
input clk);

always @(posedge clk, posedge rst) begin
    if (rst)
        dout <= 16'b0010000000100000;
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
input wire rst,
input wire [7:0] line, 
output reg [15:0] addr);

always @(posedge clk, posedge rst) begin
    if (rst)
        addr <= 16'b0000001100000000;
    case(line)
    8'b00000000: addr <= 16'b0000001100000000;
    8'b00000001: addr <= 16'b0000010100000011;
    default: addr <= 16'b0000001100000000;
    endcase;
end

endmodule



