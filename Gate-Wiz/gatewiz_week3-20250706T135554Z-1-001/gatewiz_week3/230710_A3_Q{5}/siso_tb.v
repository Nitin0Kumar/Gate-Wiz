`timescale 1ps/1ps
`include "siso.v"

module siso_tb;
    
    reg  clk=0,in,reset;
    wire out;
    always #10 clk = ~clk;
    siso uut(clk,in,reset,out);
    initial begin
        $dumpfile("siso_tb.vcd");
        $dumpvars(0,siso_tb);
        reset =1;in=1; #20;
        reset =1;in=0; #20;
        reset =1;in=1; #20;
        reset =1;in=0; #20;
        reset =1;in=1; #20;
        reset =1;in=1; #20;
        reset =1;in=1; #20;
        reset =1;in=1; #20;
        reset =0;in=1; #20;
        reset =1;in=1; #20;
        $display("vcd file has been created");
        $finish;
    end

endmodule