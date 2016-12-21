`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 04:14:46 PM
// Design Name: 
// Module Name: sign
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sign(imm, sext, out);
    input   [15:0]  imm;
    input           sext;
    output reg [31:0]   out;
    
    always @(*) begin
        if (sext) begin
            if (imm[15])
                out = {16'hffff, imm[15:0]};
            else 
                out = {16'h0000, imm[15:0]};
        end
        else 
            out = {16'h0000, imm[15:0]};
    end
endmodule
