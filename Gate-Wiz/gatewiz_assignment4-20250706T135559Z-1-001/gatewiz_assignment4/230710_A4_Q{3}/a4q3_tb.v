`timescale 1ps/1ps
`include "a4q3.v"

module a4q3_tb;
    
    reg clk =0,x;
    wire z;
    always #10 clk = ~clk;
    a4q3 uut(clk,x,z);
    initial begin
        $dumpfile("a4q3_tb.vcd");
        $dumpvars(0,a4q3_tb);
        x=0;#20;
        x=1;#20;
        x=1;#20;
        x=0;#20;
        $finish;
    end

endmodule