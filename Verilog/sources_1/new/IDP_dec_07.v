`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: IDP_dec_07
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
module IDP_dec_07(
    input wire [6:0] codein,
    output wire [`IBLEN07 - 1 : 0] dataout
    );
    
    assign dataout = (codein[6] * `FNS06) + (codein[5] * `FNS07) + (codein[4] * `FNS07) + (codein[3] * `FNS04) + 
                        (codein[2] * `FNS03) + (codein[1] * `FNS02) + 
                        (codein[0] * `FNS01);
endmodule
