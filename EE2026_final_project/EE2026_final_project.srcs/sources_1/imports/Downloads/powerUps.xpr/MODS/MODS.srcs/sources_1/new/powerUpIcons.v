`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 11:32:04
// Design Name: 
// Module Name: powerUpIcons
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


module powerUpIcons(
    input clock,
    input [12:0]pixel_index,
    input [3:0]player_powerUp,
    input [1:0]confirm,
    input skipTurnSelected,
    output reg [15:0]oled_data
    );
    
    wire [15:0]doubleJump_oled;
    wire [15:0]doubleDice_oled;
    wire [15:0]skipTurn_oled;
    wire [15:0]choosePlayer_oled;
    
    renderDoubleJump (clock, pixel_index, player_powerUp, doubleJump_oled);
    renderDoubleDice (clock, pixel_index, player_powerUp, doubleDice_oled);
    renderSkipTurn (clock, pixel_index, player_powerUp, skipTurn_oled);
    
    renderPlayerBox (clock, pixel_index, choosePlayer_oled);
    
    always @ (posedge clock) begin
        if (confirm != 2) begin
            if (!skipTurnSelected) begin
                oled_data <= doubleJump_oled | doubleDice_oled | skipTurn_oled;
            end
            if (skipTurnSelected) begin
                oled_data <= choosePlayer_oled;
            end
        end
        else begin
            oled_data <= 0;
        end
    end
endmodule
