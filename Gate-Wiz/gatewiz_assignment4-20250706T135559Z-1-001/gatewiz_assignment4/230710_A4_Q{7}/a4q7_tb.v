`timescale 1ps/1ps
`include "a4q7.v"

module a4q7_tb;
    
    reg clk=0,in,reset;
    wire out;
    always #10 clk = ~clk;
    a4q7 uut(clk,in,reset,out);
    initial begin
        $dumpfile("a4q7_tb.vcd");
        $dumpvars(0,a4q7_tb);
        reset = 0;in=1;#20;
        reset = 0;in=0;#20;
        reset = 0;in=1;#20;
        reset = 0;in=0;#20;
        reset = 1;in=1;#20;
        $finish;
    end

endmodule