`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 03:39:48 PM
// Design Name: 
// Module Name: mux6
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


module mux6(control, a, b, out);
    input                   control;
    input   [4:0]           a;
    input   [4:0]           b;
    output  reg [4:0]    out;
    
    always @(*) begin
        case(control)
            0:out = a;
            1:out = b;
        endcase
    end
endmodule
