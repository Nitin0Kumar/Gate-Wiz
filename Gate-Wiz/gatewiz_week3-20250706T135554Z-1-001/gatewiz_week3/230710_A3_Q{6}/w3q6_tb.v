`timescale 1ps/1ps
`include "w3q6.v"

module w3q6_tb;
    
    reg clk = 0;
    wire [2:0]out;
    always #10 clk = ~clk;
    w3q6 uut(clk,out);
    initial begin
        $dumpfile("w3q6_tb.vcd");
        $dumpvars(0,w3q6_tb);
        #200;
        $display("vcd file has been created");
        $finish;
    end

endmodule