`include "design.v"
`timescale 1ns/1ns

module alarm_clock_tb;

    reg clk;
    reg reset;
    reg [1:0] H_in1;
    reg [3:0] H_in0;
    reg [2:0] M_in1;
    reg [3:0] M_in0;
    reg LD_time;
    reg LD_alarm;
    reg STOP_al;
    reg AL_ON;

    wire Alarm;
    wire [1:0] H_out1;
    wire [3:0] H_out0;
    wire [2:0] M_out1;
    wire [3:0] M_out0;
    wire [2:0] S_out1;
    wire [3:0] S_out0;

    alarm_clock uut (
        .clk(clk),
        .reset(reset),
        .H_in1(H_in1),
        .H_in0(H_in0),
        .M_in1(M_in1),
        .M_in0(M_in0),
        .LD_time(LD_time),
        .LD_alarm(LD_alarm),
        .STOP_al(STOP_al),
        .AL_ON(AL_ON),
        .Alarm(Alarm),
        .H_out1(H_out1),
        .H_out0(H_out0),
        .M_out1(M_out1),
        .M_out0(M_out0),
        .S_out1(S_out1),
        .S_out0(S_out0)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("alarm_clock_tb.vcd");
        $dumpvars(0, alarm_clock_tb);

        clk = 0;
        reset = 0;
        H_in1 = 2'b00;
        H_in0 = 4'b0001;
        M_in1 = 3'b000;
        M_in0 = 4'b0000;
        LD_time = 0;
        LD_alarm = 0;
        STOP_al = 0;
        AL_ON = 1;

        #100 reset = 1;
        #100 reset = 0;
        #100 LD_time = 1; H_in1 = 2'b00; H_in0 = 4'b0101; M_in1 = 3'b000; M_in0 = 4'b0010;
        #100 LD_time = 0;

        #100 LD_alarm = 1; H_in1 = 2'b00; H_in0 = 4'b0101; M_in1 = 3'b000; M_in0 = 4'b0011;
        #100 LD_alarm = 0;

        #500 $finish;
    end

endmodule
