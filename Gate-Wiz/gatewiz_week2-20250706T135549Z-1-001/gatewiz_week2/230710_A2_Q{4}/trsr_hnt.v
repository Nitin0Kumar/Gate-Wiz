module trsr_hnt (vault,sel,tr);
    
    input[511:0] vault;
    input[5:0] sel;
    output [7:0] tr;

    wire [7:0] vault_slice [0:63];
    genvar i;

    generate
        for (i = 0; i < 64; i = i + 1) begin
            assign vault_slice[i] = vault[i*8 + 7 : i*8];
        end
    endgenerate

    assign tr = vault_slice[sel];
    


endmodule