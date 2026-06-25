`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 20:20:30
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
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,

    output reg [3:0] result,
    output reg zero,
    output reg carry
    );
    always @(*)
begin
    carry  = 0;
    result = 4'b0000;

    case(opcode)

        3'b000: begin
            {carry, result} = A + B;   // ADD
        end

        3'b001: begin
            {carry, result} = A - B;   // SUB
        end

        3'b010: begin
            result = A & B;            // AND
        end

        3'b011: begin
            result = A | B;            // OR
        end

        3'b100: begin
            result = A ^ B;            // XOR
        end

        3'b101: begin
            result = B;                // MOV
        end

        default: begin
            result = 4'b0000;
            carry  = 0;
        end

    endcase

    if(result == 4'b0000)
        zero = 1'b1;
    else
        zero = 1'b0;

end
endmodule
