`timescale 1ps/1ps
`include "srm.v"

module srm_tb ;

    reg[99:0] data_in;
    reg ctrl;
    wire[99:0] out1,out2;
    srm uut(data_in,ctrl,out1,out2);
    initial begin
        $dumpfile("srm_tb.vcd");
        $dumpvars(0,srm_tb);
        data_in = 100'h44; ctrl = 0;#20;
        data_in = 100'h44; ctrl = 1;#20;
        $display("vcd file is created");
    end
    
endmodule