`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:59:49
// Design Name: 
// Module Name: alu
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


module alu(
    input  [7:0] a,
    input  [7:0] b,
    input  [1:0] alu_sel,
    output reg [7:0] alu_out,
    output reg zf
);

always @(*) begin
    case(alu_sel)
        2'b00: alu_out = a + b;   // ADD
        2'b01: alu_out = a - b;   // SUB
        2'b10: alu_out = a & b;   // AND
        2'b11: alu_out = a ^ b;   // XOR
    endcase

    zf = (alu_out == 8'h00);
end

endmodule
