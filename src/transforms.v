module memory_chars(
input wire [8:0] addr, 
output reg [15:0] dout //,
// input rst,
// input clk
);

//always @(posedge clk, posedge rst) begin
always @(addr) begin
    //if (rst)
    //    dout <= 16'b0010000000100000;
    case(addr) 
        9'b000000000: dout <= 16'b0011000100110001;
        9'b000000001: dout <= 16'b0010111100100000;
        9'b000000010: dout <= 16'b0111001100100000;
        9'b000000100: dout <= 16'b0010000000100000;
        9'b000000101: dout <= 16'b0011000101110100;
        9'b000000110: dout <= 16'b0010111100100000;
        9'b000000111: dout <= 16'b0111001100100000;
        9'b000001000: dout <= 16'b0101111000100000;
        9'b000001001: dout <= 16'b0011001000100000;
        9'b000001011: dout <= 16'b0010000000100000;
        9'b000001100: dout <= 16'b0011000101110100;
        9'b000001101: dout <= 16'b0010111101011110;
        9'b000001110: dout <= 16'b0111001101111011;
        9'b000001111: dout <= 16'b0101111001101110;
        9'b000010000: dout <= 16'b0110111000101101;
        9'b000010001: dout <= 16'b0010000000110001;
        9'b000010010: dout <= 16'b0010000001111101;
        9'b000010011: dout <= 16'b0010000000101111;
        9'b000010100: dout <= 16'b0010000000101000;
        9'b000010101: dout <= 16'b0010000001101110;
        9'b000010110: dout <= 16'b0010000000101101;
        9'b000010111: dout <= 16'b0010000000110001;
        9'b000011000: dout <= 16'b0010000000101001;
        9'b000011001: dout <= 16'b0010000000100001;
        9'b000011011: dout <= 16'b0010000000100000;
        9'b000011100: dout <= 16'b0011000100110001;
        9'b000011101: dout <= 16'b0010111100101111;
        9'b000011110: dout <= 16'b0101110001011100;
        9'b000011111: dout <= 16'b0111001101110011;
        9'b000100000: dout <= 16'b0111000101110001;
        9'b000100001: dout <= 16'b0111001001110010;
        9'b000100010: dout <= 16'b0111010001110100;
        9'b000100011: dout <= 16'b0111101101111011;
        9'b000100100: dout <= 16'b0111001101011100;
        9'b000100101: dout <= 16'b0111110101110000;
        9'b000100110: dout <= 16'b0010000001101001;
        9'b000100111: dout <= 16'b0010000000100000;
        9'b000101000: dout <= 16'b0010000001110100;
        9'b000101001: dout <= 16'b0010000001111101;
        9'b000101011: dout <= 16'b0010000000100000;
        9'b000101100: dout <= 16'b0011000100110010;
        9'b000101101: dout <= 16'b0010111101011100;
        9'b000101110: dout <= 16'b0111001101110011;
        9'b000101111: dout <= 16'b0101111001110001;
        9'b000110000: dout <= 16'b0111101101110010;
        9'b000110001: dout <= 16'b0011001101110100;
        9'b000110010: dout <= 16'b0010111101111011;
        9'b000110011: dout <= 16'b0011001001110100;
        9'b000110100: dout <= 16'b0111110100101111;
        9'b000110101: dout <= 16'b0010000001011100;
        9'b000110110: dout <= 16'b0010000001110000;
        9'b000110111: dout <= 16'b0010000001101001;
        9'b000111000: dout <= 16'b0010000001111101;
        9'b000111010: dout <= 16'b0010000000100000;
        9'b000111011: dout <= 16'b0011000101110100;
        9'b000111100: dout <= 16'b0010111101011110;
        9'b000111101: dout <= 16'b0111001101111011;
        9'b000111110: dout <= 16'b0101111001100001;
        9'b000111111: dout <= 16'b0110000100101101;
        9'b001000000: dout <= 16'b0010000000110001;
        9'b001000001: dout <= 16'b0010000001111101;
        9'b001000010: dout <= 16'b0010000000101111;
        9'b001000011: dout <= 16'b0010000001011100;
        9'b001000100: dout <= 16'b0010000001000111;
        9'b001000101: dout <= 16'b0010000001100001;
        9'b001000110: dout <= 16'b0010000001101101;
        9'b001000111: dout <= 16'b0010000001101101;
        9'b001001000: dout <= 16'b0010000001100001;
        9'b001001001: dout <= 16'b0010000000101000;
        9'b001001010: dout <= 16'b0010000001100001;
        9'b001001011: dout <= 16'b0010000000101001;
        9'b001001101: dout <= 16'b0010000000100000;
        9'b001001110: dout <= 16'b0011000101100101;
        9'b001001111: dout <= 16'b0010111101011110;
        9'b001010000: dout <= 16'b0010100001111011;
        9'b001010001: dout <= 16'b0111001101100001;
        9'b001010010: dout <= 16'b0010110101110100;
        9'b001010011: dout <= 16'b0110000101111101;
        9'b001010100: dout <= 16'b0010100100100000;
        9'b001010110: dout <= 16'b0010000000100000;
        9'b001010111: dout <= 16'b0011000101110100;
        9'b001011000: dout <= 16'b0010111101100101;
        9'b001011001: dout <= 16'b0010100001011110;
        9'b001011010: dout <= 16'b0111001101111011;
        9'b001011011: dout <= 16'b0010110101100001;
        9'b001011100: dout <= 16'b0110000101110100;
        9'b001011101: dout <= 16'b0010100101111101;
        9'b001011110: dout <= 16'b0101111000100000;
        9'b001011111: dout <= 16'b0011001000100000;
        9'b001100001: dout <= 16'b0010000000100000;
        9'b001100010: dout <= 16'b0011000101011100;
        9'b001100011: dout <= 16'b0010111101100110;
        9'b001100100: dout <= 16'b0010100001110010;
        9'b001100101: dout <= 16'b0111001101100001;
        9'b001100110: dout <= 16'b0010110101100011;
        9'b001100111: dout <= 16'b0110000101111011;
        9'b001101000: dout <= 16'b0010100100110001;
        9'b001101001: dout <= 16'b0101111001111101;
        9'b001101010: dout <= 16'b0110111001111011;
        9'b001101011: dout <= 16'b0010000000101000;
        9'b001101100: dout <= 16'b0010000001101110;
        9'b001101101: dout <= 16'b0010000000101101;
        9'b001101110: dout <= 16'b0010000000110001;
        9'b001101111: dout <= 16'b0010000000101001;
        9'b001110000: dout <= 16'b0010000000100001;
        9'b001110001: dout <= 16'b0010000001111101;
        9'b001110010: dout <= 16'b0010000001110100;
        9'b001110011: dout <= 16'b0010000001011110;
        9'b001110100: dout <= 16'b0010000001111011;
        9'b001110101: dout <= 16'b0010000001101110;
        9'b001110110: dout <= 16'b0010000000101101;
        9'b001110111: dout <= 16'b0010000000110001;
        9'b001111000: dout <= 16'b0010000001111101;
        9'b001111001: dout <= 16'b0010000001100101;
        9'b001111010: dout <= 16'b0010000001011110;
        9'b001111011: dout <= 16'b0010000001111011;
        9'b001111100: dout <= 16'b0010000001100001;
        9'b001111101: dout <= 16'b0010000001110100;
        9'b001111110: dout <= 16'b0010000001111101;
        9'b010000000: dout <= 16'b0010000000100000;
        9'b010000001: dout <= 16'b0011000101011100;
        9'b010000010: dout <= 16'b0010111101100110;
        9'b010000011: dout <= 16'b0010100001110010;
        9'b010000100: dout <= 16'b0111001101100001;
        9'b010000101: dout <= 16'b0010110101100011;
        9'b010000110: dout <= 16'b0110000101111011;
        9'b010000111: dout <= 16'b0010100100110001;
        9'b010001000: dout <= 16'b0101111001111101;
        9'b010001001: dout <= 16'b0110101101111011;
        9'b010001010: dout <= 16'b0010000001011100;
        9'b010001011: dout <= 16'b0010000001000111;
        9'b010001100: dout <= 16'b0010000001100001;
        9'b010001101: dout <= 16'b0010000001101101;
        9'b010001110: dout <= 16'b0010000001101101;
        9'b010001111: dout <= 16'b0010000001100001;
        9'b010010000: dout <= 16'b0010000000101000;
        9'b010010001: dout <= 16'b0010000001101011;
        9'b010010010: dout <= 16'b0010000000101001;
        9'b010010011: dout <= 16'b0010000001111101;
        9'b010010100: dout <= 16'b0010000001110100;
        9'b010010101: dout <= 16'b0010000001011110;
        9'b010010110: dout <= 16'b0010000001111011;
        9'b010010111: dout <= 16'b0010000001101011;
        9'b010011000: dout <= 16'b0010000000101101;
        9'b010011001: dout <= 16'b0010000000110001;
        9'b010011010: dout <= 16'b0010000001111101;
        9'b010011011: dout <= 16'b0010000001100101;
        9'b010011100: dout <= 16'b0010000001011110;
        9'b010011101: dout <= 16'b0010000001111011;
        9'b010011110: dout <= 16'b0010000001100001;
        9'b010011111: dout <= 16'b0010000001110100;
        9'b010100000: dout <= 16'b0010000001111101;
        9'b010100010: dout <= 16'b0010000000100000;
        9'b010100011: dout <= 16'b0101110001011100;
        9'b010100100: dout <= 16'b0110011001100110;
        9'b010100101: dout <= 16'b0111001001110010;
        9'b010100110: dout <= 16'b0110000101100001;
        9'b010100111: dout <= 16'b0110001101100011;
        9'b010101000: dout <= 16'b0111101101111011;
        9'b010101001: dout <= 16'b0011000100110001;
        9'b010101010: dout <= 16'b0111110101111101;
        9'b010101011: dout <= 16'b0111101101111011;
        9'b010101100: dout <= 16'b0010100001100001;
        9'b010101101: dout <= 16'b0111001100101101;
        9'b010101110: dout <= 16'b0010110101100010;
        9'b010101111: dout <= 16'b0110000101111101;
        9'b010110000: dout <= 16'b0010100100101000;
        9'b010110001: dout <= 16'b0010100001100101;
        9'b010110010: dout <= 16'b0111001101011110;
        9'b010110011: dout <= 16'b0010110101111011;
        9'b010110100: dout <= 16'b0110001001100001;
        9'b010110101: dout <= 16'b0010100101110100;
        9'b010110110: dout <= 16'b0111110101111101;
        9'b010110111: dout <= 16'b0010000000101101;
        9'b010111000: dout <= 16'b0010000001100101;
        9'b010111001: dout <= 16'b0010000001011110;
        9'b010111010: dout <= 16'b0010000001111011;
        9'b010111011: dout <= 16'b0010000001100010;
        9'b010111100: dout <= 16'b0010000001110100;
        9'b010111101: dout <= 16'b0010000001111101;
        9'b010111110: dout <= 16'b0010000000101001;
        9'b011000000: dout <= 16'b0010000000100000;
        9'b011000001: dout <= 16'b0101110001011100;
        9'b011000010: dout <= 16'b0110011001100110;
        9'b011000011: dout <= 16'b0111001001110010;
        9'b011000100: dout <= 16'b0110000101100001;
        9'b011000101: dout <= 16'b0110001101100011;
        9'b011000110: dout <= 16'b0111101101111011;
        9'b011000111: dout <= 16'b0111001100110001;
        9'b011001000: dout <= 16'b0111110101111101;
        9'b011001001: dout <= 16'b0111101101111011;
        9'b011001010: dout <= 16'b0010100001100001;
        9'b011001011: dout <= 16'b0111001100101101;
        9'b011001100: dout <= 16'b0010110101100010;
        9'b011001101: dout <= 16'b0110000101111101;
        9'b011001110: dout <= 16'b0010100100101000;
        9'b011001111: dout <= 16'b0010100001100001;
        9'b011010000: dout <= 16'b0111001101100101;
        9'b011010001: dout <= 16'b0010110101011110;
        9'b011010010: dout <= 16'b0110001001111011;
        9'b011010011: dout <= 16'b0010100101100001;
        9'b011010100: dout <= 16'b0111110101110100;
        9'b011010101: dout <= 16'b0010000001111101;
        9'b011010110: dout <= 16'b0010000000101101;
        9'b011010111: dout <= 16'b0010000001100010;
        9'b011011000: dout <= 16'b0010000001100101;
        9'b011011001: dout <= 16'b0010000001011110;
        9'b011011010: dout <= 16'b0010000001111011;
        9'b011011011: dout <= 16'b0010000001100010;
        9'b011011100: dout <= 16'b0010000001110100;
        9'b011011101: dout <= 16'b0010000001111101;
        9'b011011110: dout <= 16'b0010000000101001;
        9'b011100000: dout <= 16'b0010000000100000;
        9'b011100001: dout <= 16'b0101110001011100;
        9'b011100010: dout <= 16'b0110011001100110;
        9'b011100011: dout <= 16'b0111001001110010;
        9'b011100100: dout <= 16'b0110000101100001;
        9'b011100101: dout <= 16'b0110001101100011;
        9'b011100110: dout <= 16'b0111101101111011;
        9'b011100111: dout <= 16'b0011000100110001;
        9'b011101000: dout <= 16'b0111110101111101;
        9'b011101001: dout <= 16'b0111101101111011;
        9'b011101010: dout <= 16'b0111001101011100;
        9'b011101011: dout <= 16'b0101111001101111;
        9'b011101100: dout <= 16'b0011001001101101;
        9'b011101101: dout <= 16'b0010101101100101;
        9'b011101110: dout <= 16'b0101110001100111;
        9'b011101111: dout <= 16'b0110111101100001;
        9'b011110000: dout <= 16'b0110110101111101;
        9'b011110001: dout <= 16'b0110010101110011;
        9'b011110010: dout <= 16'b0110011101101001;
        9'b011110011: dout <= 16'b0110000101101110;
        9'b011110100: dout <= 16'b0101111000101000;
        9'b011110101: dout <= 16'b0011001001011100;
        9'b011110110: dout <= 16'b0111110101101111;
        9'b011110111: dout <= 16'b0010000001101101;
        9'b011111000: dout <= 16'b0010000001100101;
        9'b011111001: dout <= 16'b0010000001100111;
        9'b011111010: dout <= 16'b0010000001100001;
        9'b011111011: dout <= 16'b0010000000100000;
        9'b011111100: dout <= 16'b0010000001110100;
        9'b011111101: dout <= 16'b0010000000101001;
        9'b011111111: dout <= 16'b0010000000100000;
        default: dout <= 16'b0010000000100000;
    endcase;
end

endmodule



module line_mapper(
//input wire clk,
//input wire rst,
input wire [7:0] line, 
output reg [17:0] addr);

//always @(posedge clk, posedge rst) begin
always @(line) begin
    // if (rst)
    //     addr <= 18'b0000001100000000;
    case(line)
    8'b00000000: addr <= 18'b000000011000000000;
    8'b00000001: addr <= 18'b000000101000000101;
    8'b00000010: addr <= 18'b000001110000001100;
    8'b00000011: addr <= 18'b000001110000011100;
    8'b00000100: addr <= 18'b000001101000101100;
    8'b00000101: addr <= 18'b000010001000111011;
    8'b00000110: addr <= 18'b000000111001001110;
    8'b00000111: addr <= 18'b000001001001010111;
    8'b00001000: addr <= 18'b000011101001100010;
    8'b00001001: addr <= 18'b000100000010000001;
    8'b00001010: addr <= 18'b000011100010100011;
    8'b00001011: addr <= 18'b000011110011000001;
    8'b00001100: addr <= 18'b000011101011100001;
    default: addr <= 18'b000000011000000000;
    endcase;
end

endmodule



