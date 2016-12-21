`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2016 01:09:34 PM
// Design Name: 
// Module Name: control
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


module control(zero, op, func, m2reg, pcsrc, wmem, aluc, shift, aluimm, wreg, regrt, sext, jal);
     input          zero;
     input  [5:0]   op;
     input  [5:0]   func;
     output reg         m2reg;
     output reg [1:0]   pcsrc;
     output reg         wmem;
     output reg [3:0]   aluc;
     output reg         shift;
     output reg         aluimm;
     output reg         wreg;
     output reg         regrt;
     output reg         sext;
     output reg         jal;
     
     always @(zero, op, func) begin
        if (op == 0) begin
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift = 0;
            aluimm = 0;
            wmem = 0;
            pcsrc = 0;
                                
            case(func)
                6'b100000:         aluc = 4'b0; //add
                6'b100010:         aluc = 4'b100;   //sub
                6'b100100:         aluc = 4'b001;   //and
                6'b100101:         aluc = 4'b101;   //or
                6'b100110:         aluc = 4'b010;   //xor
                6'b0:              aluc = 4'b0011;  //sll
                6'b10:             aluc = 4'b0111;  //srl
                6'b11:             aluc = 4'b1111;  //sra
                6'b1000:           aluc = 4'b110;   //jr
            endcase
     
            if (func == 6'b001000) begin
                wreg = 1'b0;
                pcsrc = 2'b10;
            end
            
            case(aluc)
                4'b0011: shift = 1;
                4'b0111: shift = 1;
                4'b1111: shift = 1;
            endcase
        end
        
        else begin
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift = 0;
            wmem = 0;
            pcsrc = 0;
            case(op)
                //addi
                6'b001000:begin
                    wreg = 1;
                    aluimm = 1;
                    sext = 1;
                    aluc = 4'b0;
                end
                
                //andi
                6'b001100: begin
                    wreg = 1;
                    aluimm = 1;
                    sext = 0;
                    aluc = 4'b1;
                end
                
                //ori
                6'b001101:begin
                     wreg = 1;
                     aluimm = 1;
                     sext = 0;
                     aluc = 4'b101;
                end
                
                //xori
                6'b001110:begin
                     wreg = 1;
                     aluimm = 1;
                     sext = 0;
                     aluc = 4'b010;
                end
                
                //lw
                6'b100011:begin
                     wreg = 1; 
                     m2reg = 1;
                     aluimm = 1;
                     sext = 1;
                     aluc = 4'b0;
                end
                
                //sw
                6'b101011:begin
                    wreg = 0;
                    aluimm = 1;
                    sext = 1;
                    aluc = 4'b0;
                    wmem = 1;
                end
                
                //beq
                6'b000100:begin
                    wreg = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b010;
                    if (zero)
                        pcsrc = 2'b01;                    
                end
                
                //bne
                6'b000101:begin
                    wreg = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b010;
                    if (~zero)
                        pcsrc = 2'b01;                    
                end
                
                //lui
                6'b001111:begin
                    wreg = 1;
                    aluimm = 1;
                    aluc = 4'b110;
                end
                
                //j
                6'b000010:begin
                    wreg = 0;
                    pcsrc = 2'b11;
                end
                
                //jal
                6'b000011:begin
                    wreg = 1;
                    jal = 1;
                    pcsrc = 2'b11;
                end                
            endcase
        end
     end
endmodule
