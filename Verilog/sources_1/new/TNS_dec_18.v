`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/12 15:04:25
// Design Name: 
// Module Name: TNS_dec_18
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
module TNS_dec_18(
    input wire [17:0] codein,
    output wire [`BLEN06 - 1 : 0] dataout
    );
    
    assign dataout = (codein[17]*`TNS06_A) + (codein[16]*`TNS06_B) + 
                    (codein[15]*`TNS06_C) + (codein[14]*`TNS05_A) + (codein[13]*`TNS05_B) + (codein[12]*`TNS05_C) + (codein[11]*`TNS04_A) +
                    (codein[10]*`TNS04_B) + (codein[9]*`TNS04_C) + (codein[8]*`TNS03_A) + (codein[7]*`TNS03_B) + (codein[6]*`TNS03_C) +
                    (codein[5]*`TNS02_A) + (codein[4]*`TNS02_B) + (codein[3]*`TNS02_C) + (codein[2]*`TNS01_A) + (codein[1]*`TNS01_B) +
                    (codein[0]*`TNS01_C);
endmodule
