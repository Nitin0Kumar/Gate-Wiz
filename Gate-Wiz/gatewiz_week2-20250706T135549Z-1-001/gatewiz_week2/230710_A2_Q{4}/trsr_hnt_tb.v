`timescale 1ns/1ns
`include "trsr_hnt.v"

module trsr_hnt_tb ;

    reg[511:0] vault;
    reg[5:0] sel;
    wire[7:0] tr;

    trsr_hnt uut(vault,sel,tr);
    initial begin
        $dumpfile("trsr_hnt_tb.vcd");
        $dumpvars(0,trsr_hnt_tb);
        vault = 512'b1111111111110111;sel = 6'd0; #20;
        vault = 512'd0;sel = 6'd5; #20;
        vault = 512'b0111111111111111;sel = 6'd1; #20;
        $display("vcd file has been created");
    end
    
endmodule