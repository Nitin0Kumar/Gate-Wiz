module a4q6 (
    input clk,reset,
    output reg [1:0]state
);

    parameter s0=0,s1=1,s2=2,s3=3;
    always @(posedge clk ) begin
        if(reset) state <=s3;
        else begin
            case (state)
                s3 : state <=s2;
                s2 : state <=s1;
                s1 : state <=s0;
                s0 : state <=s3;
                default: state <= s3;
            endcase
        end
    end
    
endmodule