`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: DPS_encoder_02
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


`include "FNS.vh"
module DPS_encoder_02(
    input wire [`DBLEN02 - 1 : 0] datain,
    input wire clock,
    output reg [1:0] codeout
    );
    
    wire [1:0] code_wire;
    
    // get remaining value
    
 
    wire [`FRLEN01 - 1 : 0] r01;
    

    assign r01 = (code_wire[0] == 0) ? (datain) : (datain - (`FNS01 * 2));
    
    
    
    //get code
    
    assign code_wire[0] = (datain < (`FNS03)) ? (0) : (1);
    assign code_wire[1] = r01;
    
    
    
    
    //sync
    always @(posedge clock) begin
        codeout <= code_wire;
    end
    
    
endmodule
