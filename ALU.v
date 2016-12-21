`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2016 01:21:10 PM
// Design Name: 
// Module Name: ALU
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


module alu(aluc, a, b, r, zero);
    input   [3:0]   aluc;
    input   [31:0]  a;
    input   [31:0]  b;
    output reg [31:0]  r;
    output reg         zero;

    always @(aluc, a, b) begin
        case (aluc)
            4'b0000:  r = a+b;
            4'b0100:  r = a-b;
            4'b0001:  r = a&b;
            4'b0101:  r = a|b;
            4'b0011:  r = b << a;
            4'b0111:  r = b >> a;
            4'b0010:begin
                r = a^b;   
                if (a != b)
                    zero = 0;
                else
                    zero = 1;
            end
            4'b0110:  r = {b[15:0],16'b0};        
        endcase
    end
endmodule
