module w3q6 (
    input clk,output [2:0]out
);
    reg out =0;
    always @(posedge clk ) begin
        out[2] <= (~out[2])&out[0] | out[2]&(out[1]^out[0]);
        out[1] <= out[2]&(~out[1]) | ~out[2]&(out[1]&out[0] | ~out[1] & ~out[0]);
        out[0] <= ~out[1] & out[2] | out[1]&(~out[0]);
    end
    
endmodule