`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 11:37:30
// Design Name: 
// Module Name: counterFiveHz
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


module counterFiveHz(
    input CLOCK,
    input activate_dice_slower,
    output reg [2:0] COUNTER = 1
    );
    
    always @ (posedge CLOCK) begin
    
        if(activate_dice_slower == 1) begin
        
            COUNTER <= (COUNTER == 6) ? 1 : COUNTER + 1; 
        
        end
        
        else begin
        
            COUNTER <= 1;
        
        end    
    end
    
endmodule
