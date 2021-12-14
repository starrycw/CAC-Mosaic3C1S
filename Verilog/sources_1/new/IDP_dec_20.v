`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: IDP_dec_20
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
module IDP_dec_20(
    input wire [19:0] codein,
    output wire [`IBLEN20 - 1 : 0] dataout
    );
    
    assign dataout = (codein[19] * `FNS19) + (codein[18] * `FNS20) + (codein[17] * `FNS20) + (codein[16] * `FNS17) + 
                        (codein[15] * `FNS16) + (codein[14] * `FNS15) + (codein[13] * `FNS14) + (codein[12] * `FNS13) + (codein[11] * `FNS12) + 
                        (codein[10] * `FNS11) + (codein[9] * `FNS10) + (codein[8] * `FNS09) + (codein[7] * `FNS08) + (codein[6] * `FNS07) + 
                        (codein[5] * `FNS06) + (codein[4] * `FNS05) + (codein[3] * `FNS04) + (codein[2] * `FNS03) + (codein[1] * `FNS02) + 
                        (codein[0] * `FNS01);
endmodule
