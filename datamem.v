`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:59:49
// Design Name: 
// Module Name: datamem
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


module datamem(
    input clk,
    input we,
    input [7:0] addr,
    input [7:0] din,
    output [7:0] dout
);

reg [7:0] RAM [0:255];

assign dout = RAM[addr];

always @(posedge clk) begin
    if(we)
        RAM[addr] <= din;
end

endmodule
