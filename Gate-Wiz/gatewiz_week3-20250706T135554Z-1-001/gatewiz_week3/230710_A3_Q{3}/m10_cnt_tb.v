`timescale 1ps/1ps
`include "m10_cnt.v"

module m10_cnt_tb;
    
    reg reset,pause,clk =0;
    wire [3:0]q;
    always #10 clk = ~clk;
    m10_cnt uut(clk,reset,pause,q);
    initial begin
        $dumpfile("m10_cnt_tb.vcd");
        $dumpvars(0,m10_cnt_tb);
        reset=0;pause=1;#100;
        reset=0;pause=0;#40;
        reset=0;pause=1;#200;
        $display("vcd file has been created");
        $finish;
    end

endmodule