`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 15:19:44
// Design Name: 
// Module Name: Simu_TNS_31
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
module Simu_TNS_31(

    );
    
    reg [`BLEN11_C - 1 : 0] datain;
    wire [`BLEN11_C - 1 : 0] dataout;
    wire [30:0] tsv;
    reg clock;
    
    TNS_encoder_31 encoder01(
    datain,    
    clock,
    tsv
    ); 
    
    TNS_dec_31 dec01(
    tsv,
    dataout
    );
    
    static int i, j, k;
    static int err_count, if_err;
    static int rbit[0:9];
    
    initial begin
        for (i = 0; i < $size(rbit); i++) begin
            rbit[i] = 0;
        end
        
        clock = 0;
        err_count = 0;
        if_err = 0;
        for (i = 0; i < 100000; i++) begin
            datain = {$random} % (`TNS11_B);
            //datain = 356;
            
            #1;
            clock = 1;
            if_err = 0;
            
            #1;
            clock = 0;
            
            if (dataout != datain) begin
                if_err = 1;
            end
            
            for(j = 0; j < $size(rbit); j++) begin
                if( (tsv[3*j] == 0) && (tsv[3*j + 1] == 0) && (tsv[3*j + 2] == 1) && (rbit[j] == 0) ) begin
                    if_err = 1;
                end
                if( (tsv[3*j] == 1) && (tsv[3*j + 1] == 1) && (tsv[3*j + 2] == 0) && (rbit[j] == 1) ) begin
                    if_err = 1;
                end
            end
            
            if(if_err == 1) begin
                err_count = err_count + 1;
                $display("%d-ERROR:in:%d; out:%d; tsv:%b; err_count:%d", i, datain, dataout, tsv, err_count);
            end
            else begin
                $display("%d-PASS:in:%d; out:%d; tsv:%b; err_count:%d", i, datain, dataout, tsv, err_count);
            end
            
            #1;
            for(j = 0; j < $size(rbit); j++) begin
                rbit[j] = tsv[3*j + 2];
            end

        end
        
        $display("finished! %d errors.", err_count);
        $finish();
 
        
        
    
    end
endmodule

