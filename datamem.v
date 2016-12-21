`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 03:44:24 PM
// Design Name: 
// Module Name: datamem
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


module datamem(addr, datain, we, clk, dataout);
    input [31:0]    addr;
    input [31:0]    datain;
    input           we;
    input           clk;
    output reg [31:0]    dataout;
    
    reg [31:0] memory [0:31];
    
    always @(clk) begin        
        if (we)
            memory[addr/4] = datain;
        else
            dataout = memory[addr/4];
    end
    integer i;
    initial begin                        // initialize memory         
        for (i = 0; i < 32; i = i + 1)             
            memory[i] = 0;         // ram[word_addr] = data         // (byte_addr)          
        memory[5'h14] = 32'h000000a3;       // (50hex)          
        memory[5'h15] = 32'h00000027;       // (54hex)          
        memory[5'h16] = 32'h00000079;       // (58hex)          
        memory[5'h17] = 32'h00000115;       // (5chex)          // ram[5'h18] should be 0x00000258, the sum stored by sw instruction     
    end

endmodule
