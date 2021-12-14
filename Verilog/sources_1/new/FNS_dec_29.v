`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 15:47:52
// Design Name: 
// Module Name: FNS_dec_29
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
module FNS_dec_29(
    input wire [28:0] codein,
    output wire [`FBLEN29 - 1 : 0] dataout
    );
    
    assign dataout = (codein[28] * `FNS29) + (codein[27] * `FNS28) + (codein[26] * `FNS27) + (codein[25] * `FNS26) + 
                        (codein[24] * `FNS25) + (codein[23] * `FNS24) + (codein[22] * `FNS23) + (codein[21] * `FNS22) + (codein[20] * `FNS21) + (codein[19] * `FNS20) + (codein[18] * `FNS19) + 
                        (codein[17] * `FNS18) + (codein[16] * `FNS17) + 
                        (codein[15] * `FNS16) + (codein[14] * `FNS15) + (codein[13] * `FNS14) + (codein[12] * `FNS13) + (codein[11] * `FNS12) + 
                        (codein[10] * `FNS11) + (codein[9] * `FNS10) + (codein[8] * `FNS09) + (codein[7] * `FNS08) + (codein[6] * `FNS07) + 
                        (codein[5] * `FNS06) + (codein[4] * `FNS05) + (codein[3] * `FNS04) + (codein[2] * `FNS03) + (codein[1] * `FNS02) + 
                        (codein[0] * `FNS01);
endmodule
