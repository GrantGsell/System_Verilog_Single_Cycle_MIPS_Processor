`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/06/2019 01:00:35 PM
// Module Name: divider
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module divider(
    output logic [31:0] result,
    input reg [31:0] divisor,
    input reg [31:0] dividend
    );
    logic signDivisor,signDividend;
    logic [63:0] remainder;
    logic [5:0] count = 6'd0;
    
    always @* begin
        //Check the signs for the divisor and dividend
        signDivisor = divisor[31];
        signDividend = dividend[31];
        
        //If either value is negative (bit 31 is 1) perform twos complement
        if(signDivisor == 1'b1) divisor[31:0] = ~divisor[31:0] + 1'b1;
        if(signDividend == 1'b1) dividend[31:0] = ~dividend[31:0] + 1'b1;
                        
        count = 6'd0;
        //Initalize the lowere half of the remainder to the dividend and the upper bits to zero
        remainder = {32'b0, dividend};
        
        //Shift Remainder left one bit
        remainder = remainder <<< 1;
        
        while(count < 6'd32) begin
            remainder[63:32] = remainder[63:32] - divisor;
            if(remainder[63] == 1'b0) begin
                remainder = remainder <<< 1;
                remainder[0] = 1'b1;
            end
            else if(remainder[63] == 1'b1) begin
                remainder[63:32] = remainder[63:32] + divisor;
                remainder = remainder <<< 1'b1;
                remainder[0] = 1'b0;
            end
            count++;
        end
        remainder[63:32] = remainder[63:32] >>> 1;
        //Adjust output based on sign of input bits
        if(signDivisor == signDividend) result = remainder[31:0];
        else result = ~remainder[31:0] +1'b1;
    end
endmodule
