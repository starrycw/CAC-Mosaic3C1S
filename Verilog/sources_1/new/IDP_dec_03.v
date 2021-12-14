`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: IDP_dec_03
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
module IDP_dec_03(
    input wire [2:0] codein,
    output wire [`IBLEN03 - 1 : 0] dataout
    );
    
    assign dataout = (codein[2] * `FNS03) + (codein[1] * `FNS02) + (codein[0] * `FNS01);
endmodule
