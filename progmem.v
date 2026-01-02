`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:59:49
// Design Name: 
// Module Name: progmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module progmem(
    input  [7:0] addr,
    output [7:0] instr
);

reg [7:0] ROM [0:255];

assign instr = ROM[addr];

initial begin
    // SAMPLE PROGRAM
    // Load constants and add

    ROM[0] = 8'b10000001; // LOADI R0 <- 1
    ROM[1] = 8'b10010100; // LOADI R1 <- 2
    ROM[2] = 8'b00000100; // ADD R0,R1
    ROM[3] = 8'b11000000; // JMP 0 (loop)
end

endmodule


