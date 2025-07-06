module b4sregi (
    input clk,ena,load,reset,input [3:0]data,
    output [3:0]q
    );
    reg q = 0;
    always @(posedge clk ) begin
        if(reset) q<=0;
        else begin
            if(load) q <= data;
            else begin
                if(ena) q <= {1'b0,q[3:1]};
            end
        end
    end


endmodule