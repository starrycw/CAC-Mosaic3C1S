`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 18:57:03
// Design Name: 
// Module Name: TNS_encoder_09
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
module TNS_encoder_09(
    input wire [`BLEN03 - 1 : 0] datain,    //4 groups
    input wire clock,
    output reg [8:0] codeout
    );  
    
    //
    wire [8:0] code_wire;
    // define reg
    reg [2:0] r_bit;    //[(group number - 1) : 0]
    
    // get remaining value

    wire [`RLEN03_B - 1 : 0] r03_b;
    wire [`RLEN03_C - 1 : 0] r03_c;
    
    wire [`RLEN02 - 1 : 0] r02;
    wire [`RLEN02_B - 1 : 0] r02_b;
    wire [`RLEN02_C - 1 : 0] r02_c;
    
    wire [`RLEN01 - 1 : 0] r01;
    wire [`RLEN01_B - 1 : 0] r01_b;
    wire [`RLEN01_C - 1 : 0] r01_c;
    

    

    assign r03_b = (code_wire[8] == 0) ? (datain) : (datain - `TNS03_A);
    assign r03_c = (code_wire[7] == 0) ? (r03_b) : (r03_b - `TNS03_B);
    assign r02 = (code_wire[6] == 0) ? (r03_c) : (r03_c - `TNS03_C);
    
    assign r02_b = (code_wire[5] == 0) ? (r02) : (r02 - `TNS02_A);
    assign r02_c = (code_wire[4] == 0) ? (r02_b) : (r02_b - `TNS02_B);
    assign r01 = (code_wire[3] == 0) ? (r02_c) : (r02_c - `TNS02_C);
    
    assign r01_b = (code_wire[2] == 0) ? (r01) : (r01 - `TNS01_A);
    assign r01_c = (code_wire[1] == 0) ? (r01_b) : (r01_b - `TNS01_B);
    
    // get code
    
    assign code_wire[8] = (datain < `TNS03_A) ? (0) : ( (datain >= (`TNS03_A + `TNS03_C)) ? (1) : (r_bit[2]) );
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

      r_bit[2] <= code_wire[8];
      r_bit[1] <= code_wire[5];
      r_bit[0] <= code_wire[2];
    end
    
    
    
    
endmodule
