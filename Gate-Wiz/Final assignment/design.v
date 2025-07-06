module alarm_clock(
    input clk,
    input reset,
    input [1:0] H_in1,
    input [3:0] H_in0,
    input [2:0] M_in1,
    input [3:0] M_in0,
    input LD_time,
    input LD_alarm,
    input STOP_al,
    input AL_ON,
    output reg Alarm,
    output reg [1:0] H_out1,
    output reg [3:0] H_out0,
    output reg [2:0] M_out1,
    output reg [3:0] M_out0,
    output reg [2:0] S_out1,
    output reg [3:0] S_out0
);

    reg [1:0] H_alarm1;
    reg [3:0] H_alarm0;
    reg [2:0] M_alarm1;
    reg [3:0] M_alarm0;
    reg [2:0] S_alarm1;
    reg [3:0] S_alarm0;

    always @ (posedge clk or posedge reset)
    begin
        if(reset)
        begin
            Alarm <= 0;
            H_out1 <= H_in1;
            H_out0 <= H_in0;
            M_out1 <= M_in1;
            M_out0 <= M_in0;
            S_out1 <= 0;
            S_out0 <= 0;
        end
        else
        begin
            if(LD_alarm)
            begin
                H_alarm1 <= H_in1;
                H_alarm0 <= H_in0;
                M_alarm1 <= M_in1;
                M_alarm0 <= M_in0;
                S_alarm1 <= 0;
                S_alarm1 <= 0;
            end
            if(LD_time)
            begin
                H_out1 <= H_in1;
                H_out0 <= H_in0;
                M_out1 <= M_in1;
                M_out0 <= M_in0;
                S_out1 <= 0;
                S_out0 <= 0;
            end
            else
            begin
                if(S_out1 == 3'b101 & S_out0 == 4'b1001)
                begin
                    S_out1 <= 3'b000;
                    S_out0 <= 4'b0000;
                    if(M_out1 == 3'b101 & M_out0 == 4'b1001)
                    begin
                        M_out1 <= 3'b000;
                        M_out0 <= 4'b0000;
                        if(H_out1 == 2'b10 & H_out0 == 3'b011)
                        begin
                            H_out1 <= 2'b00;
                            H_out0 <= 3'b000;
                        end
                        else
                        begin
                            if(H_out0 == 3'b101)
                            begin
                                H_out0 <= 3'b000;
                                H_out1 <= H_out1 + 1;
                            end
                            else H_out0 <= H_out0 + 1;
                        end
                    end
                    else
                    begin
                        if(M_out0 == 3'b101)
                        begin
                            M_out1 <= M_out1 + 1;
                            M_out0 <= 0;
                        end
                        else
                        begin
                            M_out0 <= M_out0 + 1;
                        end
                    end
                end
                else
                begin
                    if(S_out0 == 4'b1001)
                        begin
                            S_out1 <= S_out1 + 1;
                            S_out0 <= 0;
                        end
                        else
                        begin
                            S_out0 <= S_out0 + 1;
                        end
                end
            end

            if(H_alarm1 == H_out1 && M_alarm1 == M_out1 && H_alarm0 == H_out0 && M_alarm0 == M_out0) 
            begin
                if(AL_ON) Alarm <= 1;
                else if(STOP_al) Alarm <= 0;
            end
        end
    end

endmodule