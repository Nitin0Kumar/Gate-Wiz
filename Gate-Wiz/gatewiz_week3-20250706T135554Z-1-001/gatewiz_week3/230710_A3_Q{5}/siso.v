module siso (
    input clk,in,reset,
    output out
);
    reg [3:0]data=0;
    reg out =0;
    always @(posedge clk ) begin
        if(~reset)begin
            data <=0;
            out <= 0;
        end
        else begin
            data <= {in,data[3:1]};
            out <= data[0];
        end
        
    end
    
endmodule