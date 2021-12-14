`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 17:57:11
// Design Name: 
// Module Name: DPS_dec_42
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
module DPS_dec_42(
    input wire [41 : 0] codein,
    output wire [`DBLEN42 - 1 :0] dataout
    );
   
    
    assign dataout = (codein[41] * `FNS42) + (codein[40] * (`FNS41 * 2)) + 
                        (codein[39] * `FNS40) + (codein[38] * `FNS39) + (codein[37] * (`FNS38)) + (codein[36] * `FNS37) +(codein[35] * `FNS36) + 
                        (codein[34] * `FNS35) + (codein[33] * `FNS34) + (codein[32] * (`FNS33)) + (codein[31] * `FNS32) + 
                        (codein[30] * `FNS31) + (codein[29] * `FNS30) + (codein[28] * (`FNS29)) + (codein[27] * `FNS28) + 
                        (codein[26] * (`FNS27)) + (codein[25] * `FNS26) + (codein[24] * `FNS25) + 
                        (codein[23] * `FNS24) + (codein[22] * `FNS23) + (codein[21] * (`FNS22)) + (codein[20] * `FNS21) + (codein[19] * `FNS20) + (codein[18] * `FNS19) + 
                        (codein[17] * `FNS18) + (codein[16] * `FNS17) + 
                        (codein[15] * `FNS16) + (codein[14] * `FNS15) + (codein[13] * `FNS14) + (codein[12] * `FNS13) + (codein[11] * `FNS12) + 
                        (codein[10] * `FNS11) + (codein[9] * `FNS10) + (codein[8] * `FNS09) + (codein[7] * `FNS08) + (codein[6] * `FNS07) + 
                        (codein[5] * `FNS06) + (codein[4] * `FNS05) + (codein[3] * `FNS04) + (codein[2] * `FNS03) + (codein[1] * `FNS02) + 
                        (codein[0] * `FNS01);
    
endmodule
