module transformer(
input wire start, // goes high when the user wants to start printing
input wire [7:0] line, // which line do we want?
input wire clk,        // clock
input wire rst,      // reset
output wire [7:0] lhs, // input version
output wire [7:0] rhs, // transformed version
input wire [19:0] pointer_addr, // what is the array ref for this txform?
output reg [9:0] mem_addr, // which address in memory has our chars?
input wire [15:0] mem_dout // what's the data
);


wire [9:0] line_start;
wire [9:0] line_len;

assign line_start = pointer_addr[9:0];
assign line_len = pointer_addr[19:10];

// output assignment - the ascii chars
assign lhs = mem_dout[15:8];
assign rhs = mem_dout[7:0];

reg [9:0] chars_remaining;

reg started;

reg [3:0] which_state;

always @(posedge clk) begin
    if (rst) begin
        mem_addr <= 10'b1111111111;
        chars_remaining <= 10'd0;
        started <= 1'b0;
        which_state <= 0;
    end else if (~start) begin
        mem_addr <= line_start;
        chars_remaining <= line_len;
        started <= 1'b0;
        which_state <= 1;
    end
    else begin
        if ((chars_remaining > 0)) begin
        mem_addr <= mem_addr + 1;
        chars_remaining <= chars_remaining - 1;
        which_state <= 2;
        end else begin
            started <= 1'b1;
            which_state <= 3;
        end
    end
    /*
    else if (chars_remaining == 0) begin
        mem_addr = 8'hFF;
    */
end

endmodule
