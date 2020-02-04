`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 10/24/2019 
// Module Name: tb_mux_2x1
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_mux_2x1();
    //Test Vector Instantiations
    logic [31:0] dataInp1;
    logic [31:0] dataInp2;
    logic [31:0] dataOut;
    logic sel;
    //Test Vector Assignments
    assign dataInp1 = 32'hFFFFFFFF;
    assign dataInp2 = 32'h11111111;
    //Variable for data check
    integer errCount = 0; 
    //Instantiation of module to test
    mux_2x1 #(.BIT_SIZE(32)) u0(.dataOut(dataOut), .dataA(dataInp1), .dataB(dataInp2), .dataSel(sel));
    //TestBench 
    initial begin
        sel = 1'b0;
        #500; //5 ns delay for inputs/outputs to settle
        if(dataOut != dataInp1) errCount++;
        sel = 1'b1;
        #500; //5 ns delay for inputs/outputs to settle
        if(dataOut!= dataInp2) errCount++; 
        
        //Test Bench Results
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!\n");
		end else begin
			$display("Simulation complete - %d mismatches!!!\n", errCount);
		end
    end
endmodule