#!/usr/bin/python

tex = open("transforms.tex", 'r')
ver = open("transforms.v", 'w')
print("trying to open transforms.tex")
linestoread=2
line = 0
startline = """module transformer(
input wire [7:0] line, // which line do we want?
input wire clk,        // clock
input wire rst_n,      // reset_n
output wire [7:0] lhs, // input version
output wire [7:0] rhs, // transformed version
input wire [15:0] pointer_addr, // what is the array ref for this txform?
output reg [7:0] mem_addr, // which address in memory has our chars?
input wire [15:0] mem_dout // what's the data 
);\n 

wire [7:0] line_start;
wire [7:0] line_len;

assign line_start = pointer_addr[7:0];
assign line_len = pointer_addr[15:8];

// output assignment - the ascii chars
assign lhs = mem_dout[15:8];
assign rhs = mem_dout[7:0];

reg [7:0] char_count;

// set the addresses according to what we'd expect
always @(posedge clk, negedge rst_n) begin
    if (~rst_n) begin
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
"""



startmemline = """module memory(
input wire [7:0] addr, 
output reg [15:0] dout, 
input rst,
input clk);

always @(posedge clk, posedge rst) begin
    if (rst)
        dout <= 16'b0010000000100000;
    case(addr) 
"""

stopmemline = """        default: dout <= 16'b0010000000100000;
    endcase;
end

endmodule
"""
ver.write(startmemline)
lhscnt = 0
rhscnt = 0
addr = 0
where = {}
while linestoread>0:
    try:
        lhs, rhs = tex.readline().split(",")
        lhs = lhs[7:]
        rhs = rhs[0:-4]
        lhs = lhs.strip()
        rhs = rhs.strip()
        print(lhs)
        print(rhs)
        strtowrite = ""
        lhsl = len(lhs)
        rhsl = len(rhs)
        print(lhsl, rhsl) 
        ind = max(lhsl, rhsl)
        rhs = rhs.ljust(ind)
        lhs = lhs.ljust(ind)
        print(lhs + ".", rhs + ".")
        print("ind: " + str(ind))
        # very wasteful but maybe it can actually work
        for char in range(ind):
            strtowrite += "        8'b" + '{0:08b}'.format(addr + char) + ": dout <= 16'b" + '{0:08b}'.format(ord(lhs[char])) + "{0:08b}".format(ord(rhs[char])) + ";\n"
        where[line] = [addr, ind]
        
        addr += ind
        print(strtowrite)
        ver.write(strtowrite)
        #ver.write(strtowrite + "\n")
        linestoread -= 1
        line += 1
    except:
        print('out of lines')
        tex.close()
        break

ver.write(stopmemline)
ver.write("\n")
ver.write("\n")
ver.write("\n")


startline2 = """module line_mapper(
input wire [7:0] line, 
output reg [15:0] addr);

always @(line) begin
    case(line)
"""

ver.write(startline2)

linestowrite = len(where)
print("writing " + str(linestowrite) + " lines")
line = 0
print("where dict, line: [start_in_mem, chars]")
print(where)
# packing: 12'b[length][start_address]
while linestowrite >0:
    str_to_write = ""
    number_of_this_line = "{0:08b}".format(where[line][1]) + "{0:08b}".format(where[line][0])
    str_to_write += "    8'b" + "{0:08b}".format(line) + ": addr <= 16'b" + number_of_this_line + ";\n"
    print(str_to_write)
    linestowrite -= 1
    line += 1
    ver.write(str_to_write)

endline_line_mapper = """    default: addr <= 16'b0000001100000000;
    endcase;
end

endmodule"""

ver.write(endline_line_mapper)

ver.write("\n\n\n\n")



ver.write(startline)







ver.close()





