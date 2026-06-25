`timescale 1ns / 1ps

module cpu_top(

    input clk,
    input rst

);



wire [3:0] pc;
wire [7:0] instruction;

wire [2:0] opcode;
wire [1:0] rd;
wire [1:0] rs;

wire [3:0] reg_data1;
wire [3:0] reg_data2;

wire [3:0] alu_result;

wire zero;
wire carry;



program_counter PC(

    .clk(clk),
    .rst(rst),
    .jump(1'b0),
    .jump_addr(4'b0000),
    .pc(pc)

);



instruction_memory IM(

    .addr(pc),
    .instruction(instruction)

);


control_unit CU(

    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs(rs)

);



register_file RF(

    .clk(clk),
    .we(1'b1),

    .write_addr(rd),
    .write_data(alu_result),

    .read_addr1(rd),
    .read_addr2(rs),

    .read_data1(reg_data1),
    .read_data2(reg_data2)

);



alu ALU(

    .A(reg_data1),
    .B(reg_data2),
    .opcode(opcode),

    .result(alu_result),
    .zero(zero),
    .carry(carry)

);

endmodule