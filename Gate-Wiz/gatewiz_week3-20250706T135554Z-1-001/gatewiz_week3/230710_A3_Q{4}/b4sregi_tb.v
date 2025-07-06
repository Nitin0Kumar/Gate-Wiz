`timescale 1ps/1ps
`include "b4sregi.v"

module b4sregi_tb;
    
    reg clk =0, ena,load,reset;
    reg [3:0]data;
    wire [3:0]q;
    always #10 clk = ~clk;

    b4sregi uut(clk,ena,load, reset,data,q);
    initial begin
        $dumpfile("b4sregi_tb.vcd");
        $dumpvars(0,b4sregi_tb);
        reset=0;load =1;data = 4'b1011;ena=1;#20;
        reset=0;load =0;data = 4'b1011;ena=1;#20;
        reset=1;load =1;data = 4'b1011;ena=1;#20;
        reset=0;load =1;data = 4'b1111;ena=1;#20;
        $display("vcd file has been created");
        $finish;
    end

endmodule