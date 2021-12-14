`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/12 15:23:00
// Design Name: 
// Module Name: Simu_TNS_03
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
module Simu_TNS_03(

    );
    
    reg [`BLEN01 - 1 : 0] datain;   //************
    wire [`BLEN01 - 1 : 0] dataout; //************
    wire [2:0] tsv;    //************
    reg clock;
    
    TNS_encoder_03 encoder01(   //************
    datain,    
    clock,
    tsv
    ); 
    
    TNS_dec_03 dec01(   //************
    tsv,
    dataout
    );
    
    static int i, j, k;
    static int err_count, if_err;
    static int rbit;   //****************
    
    initial begin
        //for (i = 0; i < $size(rbit); i++) begin
            rbit = 0;
        //end
        
        clock = 0;
        err_count = 0;
        if_err = 0;
        for (i = 0; i < 10000; i++) begin
            datain = {$random} % (`TNS02_C);    //***************
            //datain = 356;
            
            #1;
            clock = 1;
            if_err = 0;
            
            #1;
            clock = 0;
            
            if (dataout != datain) begin
                if_err = 1;
            end
            
            //for(j = 0; j < $size(rbit); j++) begin
                if( (tsv[0] == 0) && (tsv[1] == 0) && (tsv[2] == 1) && (rbit == 0) ) begin
                    if_err = 1;
                end
                if( (tsv[0] == 1) && (tsv[1] == 1) && (tsv[2] == 0) && (rbit == 1) ) begin
                    if_err = 1;
                end
            //end
            
            if(if_err == 1) begin
                err_count = err_count + 1;
                $display("%d-ERROR:in:%d; out:%d; tsv:%b; err_count:%d", i, datain, dataout, tsv, err_count);
            end
            else begin
                $display("%d-PASS:in:%d; out:%d; tsv:%b; err_count:%d", i, datain, dataout, tsv, err_count);
            end
            
            #1;
            //for(j = 0; j < $size(rbit); j++) begin
                rbit = tsv[2];
            //end

        end
        
        $display("finished! %d errors.", err_count);
        $finish();
        
   end
endmodule
