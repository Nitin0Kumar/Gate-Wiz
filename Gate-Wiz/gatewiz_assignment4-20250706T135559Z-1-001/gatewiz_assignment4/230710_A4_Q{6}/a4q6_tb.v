`timescale 1ps/1ps
`include "a4q6.v"

module a4q6_tb ;
    
    reg clk=0,reset;
    wire [1:0] state;
    always #10 clk = ~clk;
    a4q6 uut(clk,reset,state);
    initial begin
        $dumpfile("a4q6_tb.vcd");
        $dumpvars(0,a4q6_tb);
        reset=1;#20; reset=0;#20;
        #120;
        $finish;
    end

endmodule