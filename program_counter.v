`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 02:47:11 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(in, clk, reset, current, next, out);
    input [31:0] in;
    input       clk;
    input       reset;
    output  reg [31:0]  current;
    output  reg [31:0]  next; 
    output  reg      out;   
    reg     [31:0]  pc;
    wire    [2:0]   increment;
    
    assign increment = 4;
        
    always @(posedge clk, negedge reset) begin
        if (reset)
            pc = in;
        else
            pc = 0;
    end
        
    always @(*) begin
        current = pc;
        next = pc + increment;
        if (pc == 32'h5c)
            out = 1;
        else
            out = 0;
    end

endmodule
