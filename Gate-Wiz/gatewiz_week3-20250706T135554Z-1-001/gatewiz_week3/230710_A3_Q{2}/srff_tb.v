`timescale 1ps/1ps
`include "srff.v"

module srff_tb;
    
    reg s,r,clk =0;
    wire q;
    always #10 clk = ~clk;

    srff uut(s,r,clk,q);
    initial begin
        $dumpfile("srff_tb.vcd");
        $dumpvars(0,srff_tb);
        s=1;r=0;#20;
        s=0;r=0;#20;
        s=0;r=1;#20;
        $display("vcd file has been created");
        $finish;
    end

endmodule