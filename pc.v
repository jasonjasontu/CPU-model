`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2016 09:11:51 PM
// Design Name: 
// Module Name: pc
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


module program_counter 
(
    input update, 
    input branch, 
    input [15:0]branch_offset, 
    input clk, 
    input rst, 
    output reg [31:0] pc
    );
    parameter INCREMENT_AMOUNT = 32'd4;?

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 0;
        else if (update) 
            if (branch)
                pc <= pc + {16'd0,branch_offset};
            else
                pc <= pc + INCREMENT_AMOUNT;
    end
    
endmodule
