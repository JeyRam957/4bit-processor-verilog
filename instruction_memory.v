`timescale 1ns / 1ps

module instruction_memory(

    input [3:0] addr,
    output reg [7:0] instruction

);

always @(*)
begin

    case(addr)

        4'd0: instruction = 8'b10000000; // MOV R0
        4'd1: instruction = 8'b10001000; // MOV R1
        4'd2: instruction = 8'b00000010; // ADD R0,R1
        4'd3: instruction = 8'b00110010; // SUB R2,R1

        default:
            instruction = 8'b00000000;

    endcase

end

endmodule