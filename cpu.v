`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:59:49
// Design Name: 
// Module Name: cpu
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

module cpu(input clk, input reset);

reg [7:0] pc;
wire [7:0] instr;

wire [1:0] opcode   = instr[7:6];
wire [1:0] rd       = instr[5:4];
wire [1:0] rs       = instr[3:2];
wire [1:0] func     = instr[1:0];

wire [7:0] reg_rd, reg_rs;
wire [7:0] alu_out;
wire zf;

reg reg_write;
reg mem_write;
reg [7:0] write_data;
reg [1:0] alu_sel;

wire [7:0] mem_out;

progmem PM(pc, instr);
regfile RF(clk, reg_write, rd, rs, write_data, reg_rd, reg_rs);
alu ALU(reg_rd, reg_rs, alu_sel, alu_out, zf);
datamem DM(clk, mem_write, reg_rs, reg_rd, mem_out);

always @(posedge clk or posedge reset) begin
    if(reset)
        pc <= 0;
    else begin
        case(opcode)

        2'b00: begin // ALU
            alu_sel   <= func;
            write_data <= alu_out;
            reg_write <= 1;
            pc <= pc + 1;
        end

        2'b01: begin // LOAD / STORE
            if(func == 2'b00) begin
                write_data <= mem_out;
                reg_write <= 1;
            end else begin
                mem_write <= 1;
            end
            pc <= pc + 1;
        end

        2'b10: begin // IMMEDIATE
            write_data <= {6'b000000, func};
            reg_write <= 1;
            pc <= pc + 1;
        end

        2'b11: begin // JUMPS
            if(func == 2'b00)
                pc <= reg_rd;
            else if(func == 2'b01 && zf)
                pc <= reg_rd;
            else
                pc <= pc + 1;
        end

        endcase
    end
end

endmodule

