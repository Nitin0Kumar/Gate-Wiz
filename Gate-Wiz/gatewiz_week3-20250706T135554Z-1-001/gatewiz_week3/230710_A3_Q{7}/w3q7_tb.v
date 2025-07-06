`timescale 1ps/1ps
`include "w3q7.v"

module w3q7_tb;
    
    reg clk=0;
    wire [2:0] q;
    always begin
        clk = ~clk;
        #10;
    end
    w3q7 uut(clk,q);
    initial begin
        $dumpfile("w3q7_tb.vcd");
        $dumpvars(0,w3q7_tb);
        #200;
        $finish;
    end

endmodule