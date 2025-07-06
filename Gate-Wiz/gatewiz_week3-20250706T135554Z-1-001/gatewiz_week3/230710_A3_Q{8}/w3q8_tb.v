`timescale 1ps/1ps
`include "w3q8.v"

module w3q8_tb;

    reg a,b;
    reg clk =0;
    wire q;
    always #10 clk = ~clk;
    w3q8 uut(clk,a,b,q);
    initial begin
        $dumpfile("w3q8_tb.vcd");
        $dumpvars(0,w3q8_tb);
        a=1;b=0;#20;
        a=0;b=1;#20;
        a=0;b=0;#20;
        a=1;b=1;#20;
        $display("vcd file has been created");
        $finish;
    end


endmodule