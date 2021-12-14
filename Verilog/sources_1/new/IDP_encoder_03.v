`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 16:54:54
// Design Name: 
// Module Name: IDP_encoder_03
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
module IDP_encoder_03(  //***********
    input wire[`IBLEN03 - 1 : 0] datain,    //******************
    input wire clock,
    output reg[2:0] codeout    //********************
    );
    
    //
    wire [2:0] code_wire;
    
    // get remaining value


    wire [`FRLEN02 - 1 : 0] r02;
    wire [`FRLEN01 - 1 : 0] r01;
    


    assign r02 = (code_wire[02] == 0) ? (datain) : (datain - `FNS03);
    assign r01 = (code_wire[01] == 0) ? (r02) : (r02 - `FNS02);
    
    //get code
    assign code_wire[2] = (datain >= `FNS04) ? (1) : (0);

    assign code_wire[1] = (r02 < `FNS02) ? (0) : ( (r02 >= `FNS03) ? (1) : (code_wire[2]) );
    assign code_wire[0] = r01;
    
    
    //sync
    always @(posedge clock) begin
        codeout <= code_wire;
    end
    
endmodule
