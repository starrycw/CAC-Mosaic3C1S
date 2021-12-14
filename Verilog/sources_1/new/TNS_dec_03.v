`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/12 15:04:25
// Design Name: 
// Module Name: TNS_dec_03
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
module TNS_dec_03(
    input wire [2:0] codein,
    output wire [`BLEN01 - 1 : 0] dataout
    );
    
    assign dataout = (codein[2]*`TNS01_A) + (codein[1]*`TNS01_B) +
                    (codein[0]*`TNS01_C);
endmodule
