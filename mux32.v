`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 03:41:16 PM
// Design Name: 
// Module Name: mux32
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


module mux32(control, a, b, out);
    input                   control;
    input   [31:0]           a;
    input   [31:0]           b;
    output  reg [31:0]    out;
    
    always @(*) begin
        case(control)
            0:out = a;
            1:out = b;
        endcase
    end
endmodule
