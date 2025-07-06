`timescale 1ps/1ps
`include "a4q1.v"

module a4q1_tb;

reg dark,bad_air,manual_light,manual_fan;
wire light,fan;

a4q1 uut(dark,bad_air,manual_light,manual_fan,light,fan);
initial begin
    $dumpfile("a4q1_tb.vcd");
    $dumpvars(0,a4q1_tb);
    manual_light=1;manual_fan=1;dark=0;bad_air=0;#20;
    manual_light=0;manual_fan=0;dark=0;bad_air=0;#20;
    manual_light=0;manual_fan=0;dark=1;bad_air=1;#20;
    manual_light=0;manual_fan=0;dark=0;bad_air=0;#20;
    $display("vcd file has been created");
end

endmodule