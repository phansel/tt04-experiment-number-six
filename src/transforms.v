module memory_chars(
input wire [9:0] addr,
output reg [15:0] dout,
input wire rst,
input wire clk
);

always @(posedge clk) begin
    if (rst)
        dout <= 16'b0010000000100000;
    case(addr)
        10'b0000000000: dout <= 16'b0011000100110001;
        10'b0000000001: dout <= 16'b0010111100100000;
        10'b0000000010: dout <= 16'b0111001100100000;
        10'b0000000100: dout <= 16'b0010000000100000;
        10'b0000000101: dout <= 16'b0011000101110100;
        10'b0000000110: dout <= 16'b0010111100100000;
        10'b0000000111: dout <= 16'b0111001100100000;
        10'b0000001000: dout <= 16'b0101111000100000;
        10'b0000001001: dout <= 16'b0011001000100000;
        10'b0000001011: dout <= 16'b0010000000100000;
        default: dout <= 16'b0010000000100000;
    endcase;
end

endmodule



module line_mapper(
input wire clk,
input wire rst,
input wire [7:0] line, 
output reg [19:0] addr);

always @(posedge clk) begin
    if (rst)
        addr <= 20'b000000011000000000;
    case(line)
    8'b00000000: addr <= 20'b00000000110000000000;
    8'b00000001: addr <= 20'b00000001010000000101;
    default: addr <= 20'b00000000110000000000;
    endcase;
end

endmodule



