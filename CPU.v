`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2016 02:58:31 PM
// Design Name: 
// Module Name: CPU
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


module cpu(clk, clrn, o);
    input                    clk;
    input                    clrn;
    output                   o;
    wire            [31:0]   out;
    
    //S1
    wire            [31:0]  pc;
    wire            [31:0]  current;
    wire            [31:0]  next;
    
    //S2    
    wire             [5:0]   op;
    wire             [5:0]   func;
    wire             [4:0]   rs;
    wire             [4:0]   rt;
    wire             [4:0]   rd;
    wire            [4:0]    sa;
    wire            [15:0]  imm;
    wire            [25:0]  addr;
    
    //control
    wire                    zero;
    wire                    m2reg;
    wire             [1:0]  pcsrc;
    wire                    wmem;    
    wire             [3:0]   aluc;
    wire                    shift;
    wire                    aluimm;
    wire                     wreg;
    wire                    regrt;
    wire                    sext;
    wire                    jal;
    
    //S3
    wire            [4:0]   wnn;
    wire            [4:0]   wn;
    wire            [31:0]  d;
    wire            [31:0]   qa;
    wire            [31:0]   qb;
    wire            [31:0]   a;
    wire            [31:0]  imm_ext;
    wire            [31:0]   b;
    
    //S4
    wire            [31:0]  r;
    
    //S5 datamem
    wire            [31:0]  dataout;
    
    //S1
    program_counter m_counter(pc, clk, clrn, current, next, o);
    
    //S2
    instruction m_instruction(current, op, func, rs, rt, rd, sa, imm, addr);
    
    //control
    control m_control(zero, op, func, m2reg, pcsrc, wmem, aluc, shift, aluimm, wreg, regrt, sext, jal);
    
    //S3
    mux6 mux_wn(regrt, rd, rt, wnn);
    mux6 mux_j(jal, wnn, 5'b11111, wn);
    mux32 mux_d(jal, out, next, d);
    regfile m_regfile(rs,rt,d,wn,wreg,clk,clrn,qa,qb);
    selection select(shift, qa, sa, a);
    sign m_sign(imm, sext, imm_ext);
    mux32 mux_b(aluimm, qb, imm_ext, b);
    
    //S4    
    alu Alu(aluc, a, b, r, zero);
    
    //S5
    datamem m_datamem(r, qb, wmem, clk, dataout);
    mux32 mux_datamem(m2reg, r, dataout, out);
    mux4input mux_4input(pcsrc, next, {14'b0, imm_ext[15:0], 2'b0}, qa, {4'b0, addr[25:0], 2'b0}, pc);

endmodule
