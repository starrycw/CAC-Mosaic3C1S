`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 14:52:38
// Design Name: 
// Module Name: TNS_encoder_28
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


`include "TNS.vh"
module TNS_encoder_28(
    input wire [`BLEN10_C - 1 : 0] datain,    //7 groups
    input wire clock,
    output reg [27:0] codeout
    );  
    
    //
    wire [27:0] code_wire;
    // define reg
    reg [8:0] r_bit;    //[(group number - 1) : 0]
    
    // get remaining value
    wire [`RLEN09 - 1 : 0] r09;
    wire [`RLEN09_B - 1 : 0] r09_b;
    wire [`RLEN09_C - 1 : 0] r09_c;
    
    wire [`RLEN08 - 1 : 0] r08;
    wire [`RLEN08_B - 1 : 0] r08_b;
    wire [`RLEN08_C - 1 : 0] r08_c;
    
    wire [`RLEN07 - 1 : 0] r07;
    wire [`RLEN07_B - 1 : 0] r07_b;
    wire [`RLEN07_C - 1 : 0] r07_c;
    
    wire [`RLEN06 - 1 : 0] r06;
    wire [`RLEN06_B - 1 : 0] r06_b;
    wire [`RLEN06_C - 1 : 0] r06_c;
    
    wire [`RLEN05 - 1 : 0] r05;
    wire [`RLEN05_B - 1 : 0] r05_b;
    wire [`RLEN05_C - 1 : 0] r05_c;
    
    wire [`RLEN04 - 1 : 0] r04;
    wire [`RLEN04_B - 1 : 0] r04_b;
    wire [`RLEN04_C - 1 : 0] r04_c;
    
    wire [`RLEN03 - 1 : 0] r03;
    wire [`RLEN03_B - 1 : 0] r03_b;
    wire [`RLEN03_C - 1 : 0] r03_c;
    
    wire [`RLEN02 - 1 : 0] r02;
    wire [`RLEN02_B - 1 : 0] r02_b;
    wire [`RLEN02_C - 1 : 0] r02_c;
    
    wire [`RLEN01 - 1 : 0] r01;
    wire [`RLEN01_B - 1 : 0] r01_b;
    wire [`RLEN01_C - 1 : 0] r01_c;
    
    
    assign r09 = (code_wire[27] == 0) ? (datain) : (datain - `TNS10_C);
    
    assign r09_b = (code_wire[26] == 0) ? (r09) : (r09 - `TNS09_A);
    assign r09_c = (code_wire[25] == 0) ? (r09_b) : (r09_b - `TNS09_B);
    assign r08 = (code_wire[24] == 0) ? (r09_c) : (r09_c - `TNS09_C);
    
    assign r08_b = (code_wire[23] == 0) ? (r08) : (r08 - `TNS08_A);
    assign r08_c = (code_wire[22] == 0) ? (r08_b) : (r08_b - `TNS08_B);
    assign r07 = (code_wire[21] == 0) ? (r08_c) : (r08_c - `TNS08_C);
    
    assign r07_b = (code_wire[20] == 0) ? (r07) : (r07 - `TNS07_A);
    assign r07_c = (code_wire[19] == 0) ? (r07_b) : (r07_b - `TNS07_B);
    assign r06 = (code_wire[18] == 0) ? (r07_c) : (r07_c - `TNS07_C);
    
    assign r06_b = (code_wire[17] == 0) ? (r06) : (r06 - `TNS06_A);
    assign r06_c = (code_wire[16] == 0) ? (r06_b) : (r06_b - `TNS06_B);
    assign r05 = (code_wire[15] == 0) ? (r06_c) : (r06_c - `TNS06_C);
    
    assign r05_b = (code_wire[14] == 0) ? (r05) : (r05 - `TNS05_A);
    assign r05_c = (code_wire[13] == 0) ? (r05_b) : (r05_b - `TNS05_B);
    assign r04 = (code_wire[12] == 0) ? (r05_c) : (r05_c - `TNS05_C);
    
    assign r04_b = (code_wire[11] == 0) ? (r04) : (r04 - `TNS04_A);
    assign r04_c = (code_wire[10] == 0) ? (r04_b) : (r04_b - `TNS04_B);
    assign r03 = (code_wire[9] == 0) ? (r04_c) : (r04_c - `TNS04_C);
    
    assign r03_b = (code_wire[8] == 0) ? (r03) : (r03 - `TNS03_A);
    assign r03_c = (code_wire[7] == 0) ? (r03_b) : (r03_b - `TNS03_B);
    assign r02 = (code_wire[6] == 0) ? (r03_c) : (r03_c - `TNS03_C);
    
    assign r02_b = (code_wire[5] == 0) ? (r02) : (r02 - `TNS02_A);
    assign r02_c = (code_wire[4] == 0) ? (r02_b) : (r02_b - `TNS02_B);
    assign r01 = (code_wire[3] == 0) ? (r02_c) : (r02_c - `TNS02_C);
    
    assign r01_b = (code_wire[2] == 0) ? (r01) : (r01 - `TNS01_A);
    assign r01_c = (code_wire[1] == 0) ? (r01_b) : (r01_b - `TNS01_B);
    
    // get code

    assign code_wire[27] = (datain < `TNS10_C) ? (0) : (1);
    
    assign code_wire[26] = (r09 < `TNS09_A) ? (0) : ( (r09 >= (`TNS09_A + `TNS09_C)) ? (1) : (r_bit[8]) );
    assign code_wire[25] = (r09_b < `TNS09_B) ? (0) : (1);
    assign code_wire[24] = (r09_c < `TNS09_C) ? (0) : (1);
    
    assign code_wire[23] = (r08 < `TNS08_A) ? (0) : ( (r08 >= (`TNS08_A + `TNS08_C)) ? (1) : (r_bit[7]) );
    assign code_wire[22] = (r08_b < `TNS08_B) ? (0) : (1);
    assign code_wire[21] = (r08_c < `TNS08_C) ? (0) : (1);
    
    assign code_wire[20] = (r07 < `TNS07_A) ? (0) : ( (r07 >= (`TNS07_A + `TNS07_C)) ? (1) : (r_bit[6]) );
    assign code_wire[19] = (r07_b < `TNS07_B) ? (0) : (1);
    assign code_wire[18] = (r07_c < `TNS07_C) ? (0) : (1);
    
    assign code_wire[17] = (r06 < `TNS06_A) ? (0) : ( (r06 >= (`TNS06_A + `TNS06_C)) ? (1) : (r_bit[5]) );
    assign code_wire[16] = (r06_b < `TNS06_B) ? (0) : (1);
    assign code_wire[15] = (r06_c < `TNS06_C) ? (0) : (1);
    
    assign code_wire[14] = (r05 < `TNS05_A) ? (0) : ( (r05 >= (`TNS05_A + `TNS05_C)) ? (1) : (r_bit[4]) );
    assign code_wire[13] = (r05_b < `TNS05_B) ? (0) : (1);
    assign code_wire[12] = (r05_c < `TNS05_C) ? (0) : (1);
    
    assign code_wire[11] = (r04 < `TNS04_A) ? (0) : ( (r04 >= (`TNS04_A + `TNS04_C)) ? (1) : (r_bit[3]) );
    assign code_wire[10] = (r04_b < `TNS04_B) ? (0) : (1);
    assign code_wire[9] = (r04_c < `TNS04_C) ? (0) : (1);
    
    assign code_wire[8] = (r03 < `TNS03_A) ? (0) : ( (r03 >= (`TNS03_A + `TNS03_C)) ? (1) : (r_bit[2]) );
    assign code_wire[7] = (r03_b < `TNS03_B) ? (0) : (1);
    assign code_wire[6] = (r03_c < `TNS03_C) ? (0) : (1);
    
    assign code_wire[5] = (r02 < `TNS02_A) ? (0) : ( (r02 >= (`TNS02_A + `TNS02_C)) ? (1) : (r_bit[1]) );
    assign code_wire[4] = (r02_b < `TNS02_B) ? (0) : (1);
    assign code_wire[3] = (r02_c < `TNS02_C) ? (0) : (1);
    
    assign code_wire[2] = (r01 < `TNS01_A) ? (0) : ( (r01 >= (`TNS01_A + `TNS01_C)) ? (1) : (r_bit[0]) );
    assign code_wire[1] = (r01_b < `TNS01_B) ? (0) : (1);
    assign code_wire[0] = r01_c;
    
    
    //sync
    always @(posedge clock) begin
      codeout <= code_wire;
      
      r_bit[8] <= code_wire[26];
      r_bit[7] <= code_wire[23];
      r_bit[6] <= code_wire[20];
      r_bit[5] <= code_wire[17];
      r_bit[4] <= code_wire[14];
      r_bit[3] <= code_wire[11];
      r_bit[2] <= code_wire[8];
      r_bit[1] <= code_wire[5];
      r_bit[0] <= code_wire[2];
    end
endmodule  
