`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 11/20/2019 12:18:37 PM
// Module Name: register_files
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module register_files(
    output [31:0] read_Data_One,
    output [31:0] read_Data_Two,
    input [31:0] write_Data,
    input [4:0] read_Reg_One_Addr,
    input [4:0] read_Reg_Two_Addr,
    input [4:0] write_Addr,
    input write_Ena,
    input rst,  
    input clk
    );
    //Internal Register File
    logic [31:0] q_regfile [0:31];
    
    //Synchronous Logic
    always @(posedge clk or posedge rst) begin
        if(rst) begin
           for(integer i=0; i<64; i++) begin
                q_regfile[i] = 32'd0;
            end 
        end
        else if(write_Ena == 1 && write_Addr!=5'd0) q_regfile[write_Addr] = write_Data;
    end
    
    //Two Read Ports
    assign read_Data_One = q_regfile[read_Reg_One_Addr];
    assign read_Data_Two = q_regfile[read_Reg_Two_Addr];
    
endmodule
