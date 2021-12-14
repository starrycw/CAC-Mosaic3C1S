`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 14:30:00
// Design Name: 
// Module Name: encoder_3c1s_12x12
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

`include "TNS.v"
module encoder_3c1s_12x12(datain, clock, codeout);
    input wire [98:0] datain;
    input wire clock;
    output wire [107:0] codeout;

    TNS_encoder_12 ecoder01( .datain(datain[10:0]), .clock(clock), .codeout(codeout[11:0]) );
    TNS_encoder_12 ecoder02( .datain(datain[21:11]), .clock(clock), .codeout(codeout[23:12]) );
    TNS_encoder_12 ecoder03( .datain(datain[32:22]), .clock(clock), .codeout(codeout[35:24]) );
    TNS_encoder_12 ecoder04( .datain(datain[43:33]), .clock(clock), .codeout(codeout[47:36]) );
    TNS_encoder_12 ecoder05( .datain(datain[54:44]), .clock(clock), .codeout(codeout[59:48]) );
    TNS_encoder_12 ecoder06( .datain(datain[65:55]), .clock(clock), .codeout(codeout[71:60]) );
    TNS_encoder_12 ecoder07( .datain(datain[76:66]), .clock(clock), .codeout(codeout[83:72]) );
    TNS_encoder_12 ecoder08( .datain(datain[87:77]), .clock(clock), .codeout(codeout[95:84]) );
    TNS_encoder_12 ecoder09( .datain(datain[98:88]), .clock(clock), .codeout(codeout[107:96]) );

endmodule
