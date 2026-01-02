`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:59:49
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input we,
    input [1:0] rd,
    input [1:0] rs,
    input [7:0] din,
    output [7:0] dout_rd,
    output [7:0] dout_rs
);

reg [7:0] R [0:3];

assign dout_rd = R[rd];
assign dout_rs = R[rs];

always @(posedge clk) begin
    if(we)
        R[rd] <= din;
end

endmodule
