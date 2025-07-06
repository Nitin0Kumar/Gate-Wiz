`timescale 1ps/1ps
`include "a4q5.v"

module a4q5_tb;
    
    reg clk=0,reset,up,down;
    wire [1:0] floor;
    always #10 clk = ~clk;
    a4q5 uut(clk,reset,up,down,floor);
    initial begin
        $dumpfile("a4q5_tb.vcd");
        $dumpvars(0,a4q5_tb);
        reset=1;up=1;down=1;#20;
        reset=0;up=1;down=0;#20;
        reset=0;up=1;down=0;#20;
        reset=0;up=0;down=1;#20;
        reset=0;up=0;down=1;#20;
        reset=0;up=0;down=0;#20;
        $finish;
    end

endmodule