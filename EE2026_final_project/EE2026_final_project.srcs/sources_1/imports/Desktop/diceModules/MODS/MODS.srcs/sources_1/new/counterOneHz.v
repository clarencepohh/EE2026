`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 11:37:30
// Design Name: 
// Module Name: counterOneHz
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


module counterOneHz(
    input CLOCK,
    input reset,
    output reg [2:0] COUNTER = 0
    );
    
    always @ (posedge CLOCK) begin
    
        if(reset == 0) begin
        
            COUNTER <= (COUNTER == 4) ? 4 : COUNTER + 1;
        
        end
        
        else begin
        
            COUNTER <= 0;
        
        end
       
    end
endmodule
