`timescale 1ps/1ps
`include "w3q1.v"

module w3q1_tb ;
    
    reg in,clk = 0;
    wire q;
    always #10 clk = ~clk;
    w3q1 uut(in,clk,q);
    initial begin
        $dumpfile("w3q1_tb.vcd");
        $dumpvars(0,w3q1_tb);
        in = 1; #20;
        in = 0; #20;
        $finish;
        $display("vcd file has been created");
    end

endmodule