`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: DPS_dec_02
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
module DPS_dec_02(
    input wire [1 : 0] codein,
    output wire [`DBLEN02 - 1 :0] dataout
    );
   
    
    assign dataout = (codein[1] * `FNS02) + (codein[0] * (`FNS01 * 2));
    
endmodule
