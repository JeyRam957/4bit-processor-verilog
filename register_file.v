`timescale 1ns / 1ps

module register_file(

    input clk,
    input we,

    input [1:0] write_addr,
    input [3:0] write_data,

    input [1:0] read_addr1,
    input [1:0] read_addr2,

    output [3:0] read_data1,
    output [3:0] read_data2

);

    // 4 registers, each 4 bits wide
    reg [3:0] regfile [0:3];

    // Initial values for simulation
    initial
    begin
        regfile[0] = 4'd3;   // R0
        regfile[1] = 4'd5;   // R1
        regfile[2] = 4'd1;   // R2
        regfile[3] = 4'd0;   // R3
    end

    // Write operation
    always @(posedge clk)
    begin
        if(we)
            regfile[write_addr] <= write_data;
    end

    // Read operations
    assign read_data1 = regfile[read_addr1];
    assign read_data2 = regfile[read_addr2];

endmodule