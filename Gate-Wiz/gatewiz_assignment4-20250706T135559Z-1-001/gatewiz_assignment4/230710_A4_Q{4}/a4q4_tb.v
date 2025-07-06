`timescale 1ps/1ps
`include "a4q4.v"

module a4q4_tb ;
    
    reg clk =0,x;
    wire z;
    always #10 clk = ~clk;
    a4q4 uut(clk,x,z);
    initial begin
        $dumpfile("a4q4_tb.vcd");
        $dumpvars(0,a4q4_tb);
        x=0;#20;x=1;#20;x=1;#20;x=0;#20;
        x=1;#20;x=1;#20;x=0;#20;x=0;#20;x=1;#20;x=1;#20;
        $finish;
    end

endmodule