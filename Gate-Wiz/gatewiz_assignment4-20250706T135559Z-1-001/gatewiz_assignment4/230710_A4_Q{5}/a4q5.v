module a4q5 (
    input clk,
    input reset,
    input up,
    input down,
    output reg [1:0] floor
);

    parameter s0 =1,s1 = 2, s2 = 3;

    always @(posedge clk ) begin
        if(reset) floor <= s0;
        else begin
            if(up==1 && down==0)begin
                case (floor)
                    s0 : floor <=s1;
                    s1 : floor <=s2;
                    default: floor <=s2;
                endcase
            end
            else if(up==0 && down==1)begin
                case (floor)
                    s2 : floor <=s1;
                    s1 : floor <=s0;
                    default: floor <=s0;
                endcase
            end
        end
    end

endmodule
