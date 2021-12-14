`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 14:40:00
// Design Name: 
// Module Name: Gen_vcd
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
module Gen_vcd();
    reg clock;
    reg [123:0] gen_data;
    wire [131:0] data_a_temp, data_b_temp, data_c_temp;
    reg [131:0] data_a, data_b, data_c;
    wire [107:0] cw_a, cw_b, cw_c;
    wire [11:0] ucw_b;
    wire [24:0] ucw_a; 

    integer i, j;

    encoder_3c1s_12x12 encoder_13x13( .datain(data_a_temp[98:0]),.clock(clock), .codeout(cw_a) );
    encoder_3c1s_12x12 encoder_12x13( .datain(data_b_temp[98:0]),.clock(clock), .codeout(cw_b) );
    encoder_3c1s_12x12 encoder_12x12( .datain(data_c_temp[98:0]),.clock(clock), .codeout(cw_c) );
    
    assign data_a_temp[123:0] = gen_data;
    assign data_a_temp[131:124] = 0;

    assign data_b_temp[110:0] = gen_data[110:0];
    assign data_b_temp[123:111] = 0;
    assign data_b_temp[131:124] = 0;

    assign data_c_temp[98:0] = gen_data[98:0];
    assign data_c_temp[123:99] = 0;
    assign data_c_temp[131:124] = 0;

    assign ucw_b = data_b[110:99];
    assign ucw_a = data_a[123:99];
    

    always @(posedge clock) begin
        data_a <=data_a_temp;
        data_b <= data_b_temp;
        data_c <= data_c_temp;
    end

    initial begin
        clock = 0;
        gen_data = 0;

        #5;
        clock = 1;

        #5;
        for (i = 0; i < 20000; i++) begin
            #5;
            clock = 0;

            for(j=0; j<124; j++) begin
                gen_data[j] <= {$random} % 2;
            end

            #5;
            clock = 1;
        end
    end

    


endmodule