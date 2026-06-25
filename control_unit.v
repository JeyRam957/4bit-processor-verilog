`timescale 1ns / 1ps

module control_unit(

    input [7:0] instruction,

    output [2:0] opcode,
    output [1:0] rd,
    output [1:0] rs

);

assign opcode = instruction[7:5];
assign rd     = instruction[4:3];
assign rs     = instruction[2:1];

endmodule