
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
// Description: TNS-CAC encoders for Mosaic-3C1S array. Each encoder has a 12-bit output (1 encoding group contains 4 3x3 sub-arrays).
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "TNS.v"
module encoder_3c1s_18x18(datain, clock, codeout);
    input wire [219:0] datain;
    input wire clock;
    output wire [239:0] codeout;

    TNS_encoder_12 ecoder01( .datain(datain[10:0]), .clock(clock), .codeout(codeout[11:0]) );
    TNS_encoder_12 ecoder02( .datain(datain[21:11]), .clock(clock), .codeout(codeout[23:12]) );
    TNS_encoder_12 ecoder03( .datain(datain[32:22]), .clock(clock), .codeout(codeout[35:24]) );
    TNS_encoder_12 ecoder04( .datain(datain[43:33]), .clock(clock), .codeout(codeout[47:36]) );
    TNS_encoder_12 ecoder05( .datain(datain[54:44]), .clock(clock), .codeout(codeout[59:48]) );
    TNS_encoder_12 ecoder06( .datain(datain[65:55]), .clock(clock), .codeout(codeout[71:60]) );
    TNS_encoder_12 ecoder07( .datain(datain[76:66]), .clock(clock), .codeout(codeout[83:72]) );
    TNS_encoder_12 ecoder08( .datain(datain[87:77]), .clock(clock), .codeout(codeout[95:84]) );
    TNS_encoder_12 ecoder09( .datain(datain[98:88]), .clock(clock), .codeout(codeout[107:96]) );
    TNS_encoder_12 ecoder10( .datain(datain[109:99]), .clock(clock), .codeout(codeout[119:108]) );
    TNS_encoder_12 ecoder11( .datain(datain[120:110]), .clock(clock), .codeout(codeout[131:120]) );
    TNS_encoder_12 ecoder12( .datain(datain[131:121]), .clock(clock), .codeout(codeout[143:132]) );
    TNS_encoder_12 ecoder13( .datain(datain[142:132]), .clock(clock), .codeout(codeout[155:144]) );
    TNS_encoder_12 ecoder14( .datain(datain[153:143]), .clock(clock), .codeout(codeout[167:156]) );
    TNS_encoder_12 ecoder15( .datain(datain[164:154]), .clock(clock), .codeout(codeout[179:168]) );
    TNS_encoder_12 ecoder16( .datain(datain[175:165]), .clock(clock), .codeout(codeout[191:180]) );
    TNS_encoder_12 ecoder17( .datain(datain[186:176]), .clock(clock), .codeout(codeout[203:192]) );
    TNS_encoder_12 ecoder18( .datain(datain[197:187]), .clock(clock), .codeout(codeout[215:204]) );
    TNS_encoder_12 ecoder19( .datain(datain[208:198]), .clock(clock), .codeout(codeout[227:216]) );
    TNS_encoder_12 ecoder20( .datain(datain[219:209]), .clock(clock), .codeout(codeout[239:228]) );

endmodule
