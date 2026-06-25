`timescale 1ns / 1ps

module program_counter(

    input clk,
    input rst,
    input jump,
    input [3:0] jump_addr,

    output reg [3:0] pc

);

always @(posedge clk or posedge rst)
begin

    if(rst)
        pc <= 0;

    else if(jump)
        pc <= jump_addr;

    else
        pc <= pc + 1;

end

endmodule