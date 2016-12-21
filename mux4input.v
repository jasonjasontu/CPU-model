`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 04:37:54 PM
// Design Name: 
// Module Name: mux4input
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


module mux4input(pcsrc, in0, imm, in2, in3, out);
    input [1:0] pcsrc;
    input [31:0] in0;
    input [31:0] in2;
    input [31:0] in3;
    input [31:0] imm;
    output reg [31:0] out;
    reg [31:0] temp;
    
    always @(*) begin
        temp = in0 + imm;
        case (pcsrc)
            0: out = in0;
            1: out = {14'b0, temp[17:0]};
            2: out = in2;
            3: out = in3;
        endcase
    end
endmodule
