`timescale 1ps/1ps
`include "subt.v"

module subt_tb;

    reg a,b;
    wire diff,borr;
    subt uut(a,b,diff,borr);
    initial begin
        $dumpfile("subt_tb.vcd");
        $dumpvars(0,subt_tb);
        a=0;b=0;#20;
        a=0;b=1;#20;
        a=1;b=0;#20;
        a=1;b=1;#20;
        $display("vcd file has been created");
    end
    
endmodule