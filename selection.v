`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2016 08:33:46 PM
// Design Name: 
// Module Name: selection
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


module selection(shift, a, b, out);
    input                   shift;
    input   [31:0]          a;
    input   [4:0]           b;
    output  reg [31:0]    out;
    
    always @(*) begin
        case(shift)
            0:out = a;
            1:out = b;
        endcase
    end
endmodule
