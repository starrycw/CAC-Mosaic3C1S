`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 18:57:03
// Design Name: 
// Module Name: TNS_encoder_06
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
module TNS_encoder_06(
    input wire [`BLEN02 - 1 : 0] datain,    //4 groups
    input wire clock,
    output reg [5:0] codeout
    );  
    
    //
    wire [5:0] code_wire;
    // define reg
    reg [1:0] r_bit;    //[(group number - 1) : 0]
    
    // get remaining value

    wire [`RLEN02_B - 1 : 0] r02_b;
    wire [`RLEN02_C - 1 : 0] r02_c;
    
    wire [`RLEN01 - 1 : 0] r01;
    wire [`RLEN01_B - 1 : 0] r01_b;
    wire [`RLEN01_C - 1 : 0] r01_c;
    


    assign r02_b = (code_wire[5] == 0) ? (datain) : (datain - `TNS02_A);
    assign r02_c = (code_wire[4] == 0) ? (r02_b) : (r02_b - `TNS02_B);
    assign r01 = (code_wire[3] == 0) ? (r02_c) : (r02_c - `TNS02_C);
    
    assign r01_b = (code_wire[2] == 0) ? (r01) : (r01 - `TNS01_A);
    assign r01_c = (code_wire[1] == 0) ? (r01_b) : (r01_b - `TNS01_B);
    
    // get code

    assign code_wire[5] = (datain < `TNS02_A) ? (0) : ( (datain >= (`TNS02_A + `TNS02_C)) ? (1) : (r_bit[1]) );
    assign code_wire[4] = (r02_b < `TNS02_B) ? (0) : (1);
    assign code_wire[3] = (r02_c < `TNS02_C) ? (0) : (1);
    
    assign code_wire[2] = (r01 < `TNS01_A) ? (0) : ( (r01 >= (`TNS01_A + `TNS01_C)) ? (1) : (r_bit[0]) );
    assign code_wire[1] = (r01_b < `TNS01_B) ? (0) : (1);
    assign code_wire[0] = r01_c;
    
    
    //sync
    always @(posedge clock) begin
      codeout <= code_wire;

      r_bit[1] <= code_wire[5];
      r_bit[0] <= code_wire[2];
    end
    
    
    
    
endmodule
