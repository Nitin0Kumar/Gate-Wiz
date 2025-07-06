`timescale 1ps/1ps
`include "full_add.v"

module full_add_tb ;

    reg a,b,cin;
    wire s,cout;
    
    full_add uut(a,b,cin,s,cout);
    initial begin
        $dumpfile("full_add_tb.vcd");
        $dumpvars(0,full_add_tb);
        a=0;b=0;cin=0;#20;
        a=0;b=1;cin=0;#20;
        a=1;b=0;cin=0;#20;
        a=1;b=1;cin=0;#20;
        a=0;b=0;cin=1;#20;
        a=0;b=1;cin=1;#20;
        a=1;b=0;cin=1;#20;
        a=1;b=1;cin=1;#20;
        $display("Vcd file has been created");

    end
    
endmodule