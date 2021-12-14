`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 18:57:03
// Design Name: 
// Module Name: TNS_encoder_03
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
module TNS_encoder_03(
    input wire [`BLEN01 - 1 : 0] datain,    //4 groups
    input wire clock,
    output reg [2:0] codeout
    );  
    
    //
    wire [2:0] code_wire;
    // define reg
    reg r_bit;    //[(group number - 1) : 0]
    
    // get remaining value

    wire [`RLEN01_B - 1 : 0] r01_b;
    wire [`RLEN01_C - 1 : 0] r01_c;
    


    assign r01_b = (code_wire[2] == 0) ? (datain) : (datain - `TNS01_A);
    assign r01_c = (code_wire[1] == 0) ? (r01_b) : (r01_b - `TNS01_B);
    
    // get code

    assign code_wire[2] = (datain < `TNS01_A) ? (0) : ( (datain >= (`TNS01_A + `TNS01_C)) ? (1) : (r_bit) );
    assign code_wire[1] = (r01_b < `TNS01_B) ? (0) : (1);
    assign code_wire[0] = r01_c;
    
    
    //sync
    always @(posedge clock) begin
      codeout <= code_wire;

      r_bit <= code_wire[2];
    end
    
    
    
    
endmodule
