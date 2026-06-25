`timescale 1ns / 1ps

module tb_cpu;

//====================================
// Testbench Signals
//====================================

reg clk;
reg rst;

//====================================
// Instantiate CPU
//====================================

cpu_top uut(

    .clk(clk),
    .rst(rst)

);

//====================================
// Clock Generation
//====================================

always #5 clk = ~clk;

//====================================
// Stimulus
//====================================

initial
begin

    clk = 0;
    rst = 1;

    // Apply Reset
    #20;
    rst = 0;

    // Run CPU
    #300;

    $finish;

end

endmodule