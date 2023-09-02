#!/usr/bin/python

tex = open("transforms.tex", 'r')
ver = open("../transforms.v", 'w')
print("trying to open transforms.tex")
linestoread=20
line = 0

startmemline = """module memory_chars(
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
            strtowrite += "        9'b" + '{0:09b}'.format(addr + char) + ": dout <= 16'b" + '{0:08b}'.format(ord(lhs[char])) + "{0:08b}".format(ord(rhs[char])) + ";\n"
        # add padding 
        strtowrite += "        9'b" + '{0:09b}'.format(addr + ind + 1) + ": dout <= 16'b" + '{0:08b}'.format(ord(" ")) + "{0:08b}".format(ord(" ")) + ";\n"
        where[line] = [addr, ind]
        
        addr += ind + 2
        print(strtowrite)
        ver.write(strtowrite)
        #ver.write(strtowrite + "\n")
        linestoread -= 1
        line += 1
        print("addr in mem: " +str(addr))
    except:
        print('out of lines')
        tex.close()
        break

ver.write(stopmemline)
ver.write("\n")
ver.write("\n")
ver.write("\n")


startline2 = """module line_mapper(
//input wire clk,
//input wire rst,
input wire [7:0] line, 
output reg [17:0] addr);

//always @(posedge clk, posedge rst) begin
always @(line) begin
    // if (rst)
    //     addr <= 18'b0000001100000000;
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
    number_of_this_line = "{0:09b}".format(where[line][1]) + "{0:09b}".format(where[line][0])
    str_to_write += "    8'b" + "{0:08b}".format(line) + ": addr <= 18'b" + number_of_this_line + ";\n"
    print(str_to_write)
    linestowrite -= 1
    line += 1
    ver.write(str_to_write)

endline_line_mapper = """    default: addr <= 18'b000000011000000000;
    endcase;
end

endmodule"""

ver.write(endline_line_mapper)

ver.write("\n\n\n\n")


ver.close()





