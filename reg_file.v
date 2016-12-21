`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2016 01:01:45 PM
// Design Name: 
// Module Name: reg_file
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


module regfile (rna,rnb,d,wn,we,clk,clrn,qa,qb);     // 32x32 regfile     
    input  [31:0] d;                                 // data of write port          come from ALU
    input   [4:0] rna;                               // reg # of read port A        rs
    input   [4:0] rnb;                               // reg # of read port B        rt
    input   [4:0] wn;                                // reg # of write port         rd
    input         we;                                // write enable                write
    input         clk, clrn;                         // clock and reset     
    output wire [31:0] qa, qb;                            // read ports A and B          goes into ALU
    reg    [31:0] register [0:31];                   // 31 32-bit registers     
    
    //initialize registers
    
    
    assign qa = (rna == 0)? 0 : register[rna];       // read port A     
    assign qb = (rnb == 0)? 0 : register[rnb];       // read port B     
    integer i;     
    always @(posedge clk or negedge clrn)            // write port      
        if (!clrn)begin                         
            for (i = 11; i < 32; i = i + 1)                 
                 register[i]  <= 0;                   // reset  
            register[0] = 32'h0;
            register[1] = 32'ha00000aa;
            register[2] = 32'h10000011;
            register[3] = 32'h20000022;
            register[4] = 32'h30000033;
            register[5] = 32'h40000044;
            register[6] = 32'h50000055;
            register[7] = 32'h60000066;
            register[8] = 32'h00000002;
            register[9] = 32'h80000088;
            register[10] = 32'h90000099;
        end
        else                    
            if ((wn != 0) && we)                     // not reg[0] & enabled                 
                register[wn] <= d;                   // write d to reg[wn] 
endmodule 
