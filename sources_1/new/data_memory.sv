`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 11/20/2019 03:59:14 PM
// Module Name: data_memory
// Project Name: CPU_Design
////////////////////////////////////////////////////////////////////////////////// 
module data_memory(
    output [31:0] read_data,
    input [31:0] write_data,
    input [31:0] addr_From_Alu_Result,
    input write_memory,
    input read_memory,
    input clk,
    input rst
    );
    logic [31:0] ram_mem [63:0];
    logic [5:0] addr;
    assign addr = addr_From_Alu_Result[7:2];
    assign read_data = (read_memory) ? ram_mem[addr] : 32'b0;
    //Synchronous Logic
    always @(posedge clk or posedge rst) begin
        if(write_memory &&(~rst)) ram_mem[addr] <= write_data;
        if(rst) begin
            for(integer i=0; i<64; i++) begin
                ram_mem[i] = 32'd0;
            end
        end
    end
endmodule
