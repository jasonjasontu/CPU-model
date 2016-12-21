`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2016 01:15:26 PM
// Design Name: 
// Module Name: instruction
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


module instruction(pc, op, func, rs, rt, rd, sa, imm, addr);
    input   [31:0]  pc;
    output  [5:0]   op;
    output  [5:0]   func;
    output  [4:0]   rs;
    output  [4:0]   rt;
    output  [4:0]   rd;
    output  [4:0]   sa;
    output  [15:0]  imm;
    output  [25:0]  addr;
    reg     [31:0]  ins;
    
    wire [31:0] instruction_memory [0:31];
    /*
    assign instruction_memory[0] = 32'h0c000002;
    assign instruction_memory[1] = 32'h14050000;
    assign instruction_memory[2] = 32'h01000008;
    */
    
    assign instruction_memory[0] = 32'h3c010000;
    assign instruction_memory[1] = 32'h34240050;
    assign instruction_memory[2] = 32'h20050004;
    assign instruction_memory[3] = 32'h0c000018;
    assign instruction_memory[4] = 32'hac820000;
    assign instruction_memory[5] = 32'h8c890000;
    assign instruction_memory[6] = 32'h01244022;
    assign instruction_memory[7] = 32'h20050003;
    assign instruction_memory[8] = 32'h20a5ffff;
    assign instruction_memory[9] = 32'h34a8ffff;
    assign instruction_memory[10] = 32'h39085555;
    assign instruction_memory[11] = 32'h2009ffff;
    assign instruction_memory[12] = 32'h312affff;
    assign instruction_memory[13] = 32'h01493025;
    assign instruction_memory[14] = 32'h01494026;
    assign instruction_memory[15] = 32'h01463824;
    assign instruction_memory[16] = 32'h10a00001;
    assign instruction_memory[17] = 32'h08000008;
    assign instruction_memory[18] = 32'h2005ffff;
    assign instruction_memory[19] = 32'h000543c0;
    assign instruction_memory[20] = 32'h00084400;
    assign instruction_memory[21] = 32'h00084403;
    assign instruction_memory[22] = 32'h000843c2;
    assign instruction_memory[23] = 32'h08000017;
    assign instruction_memory[24] = 32'h00004020;
    assign instruction_memory[25] = 32'h8c890000;
    assign instruction_memory[26] = 32'h20840004;
    assign instruction_memory[27] = 32'h01094020;
    assign instruction_memory[28] = 32'h20a5ffff;
    assign instruction_memory[29] = 32'h14a0fffb;
    assign instruction_memory[30] = 32'h00081000;
    assign instruction_memory[31] = 32'h03e00008;
    
    always @(pc) begin
        ins = instruction_memory[pc/4];
    end
    
    assign op = {ins[31:26]};
    assign rs = {ins[25:21]};
    assign rt = {ins[20:16]};
    assign rd = {ins[15:11]};
    assign sa = {ins[10:6]};
    assign func = {ins[5:0]};
    assign imm = {ins[15:0]};
    assign addr = {ins[25:0]};

endmodule
