`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 11/24/2019 11:18:08 PM
// Module Name: tb_shift_register_from_sign_extension
// Project Name: CPU_Design 
//////////////////////////////////////////////////////////////////////////////////
module tb_shift_register_from_sign_extension();
    
    //Two Dimensional Vectors
    logic [31:0] test_vector [0:3];
    logic [31:0] answer_vector [0:3];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = 32'h00000000;
    assign test_vector[1] = 32'h00000003;
    assign test_vector[2] = 32'h3fffffff;
    assign test_vector[3] = 32'hffffffff;
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'h00000000;
    assign answer_vector[1] = 32'h0000000c;
    assign answer_vector[2] = 32'hfffffffc;
    assign answer_vector[3] = 32'hfffffffc;  
    
    //I/O Variable Delcarations
    logic [31:0] dataIn;
    logic [31:0] dataOut;     
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation of module to test
    shift_register_from_sign_extension u0(.shiftData(dataOut), .inpData(dataIn));
	
    //Test Bench
    initial begin
        for(i=0; i<4; i++) begin
            dataIn = test_vector[i];
            #10; //5 ns delay for inputs/outputs to settle
            if(dataOut != answer_vector[i]) errCount++;
        end
        
        //Test Bench Results
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!\n");
		end else begin
			$display("Simulation complete - %d mismatches!!!\n", errCount);
		end
        $finish;
    end
    
endmodule
