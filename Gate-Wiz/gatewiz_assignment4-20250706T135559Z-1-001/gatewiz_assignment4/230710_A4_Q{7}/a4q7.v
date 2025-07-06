module a4q7(
    input clk,
    input in,
    input reset,
    output out);

    reg out =0;
    parameter A =0,B=1,C=2,D=3;
    reg [1:0]state = A;
    always @(posedge clk ) begin
        if(reset) state<=A;
        else begin
            case (state)
                A : begin
                    if(in==0) state <= A;
                    else state <= B;
                end
                B : begin
                    if(in==0) state <= C;
                    else state <= B;
                end
                C : begin
                    if(in==0) state <= A;
                    else state <= D;
                end
                D : begin
                    if(in==0) state <= C;
                    else state <= B;
                end 
            endcase
        end
    end
    always @(out,state) begin
        if(state==A||state==B||state==C) out = 0;
        else out =1;
    end

endmodule
