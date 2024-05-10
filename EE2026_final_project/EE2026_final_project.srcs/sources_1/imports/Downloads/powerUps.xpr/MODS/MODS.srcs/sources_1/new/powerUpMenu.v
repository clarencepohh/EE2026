`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 21:18:49
// Design Name: 
// Module Name: powerUpMenu
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


module powerUpMenu(
    input clock, 
    input [3:0]turnActive,
    input playerKilled,
    input [12:0]pixel_index,
    input sw,
    input btnL, btnR, btnC, btnD,
    output reg [2:0]enemySelected,
    output reg [15:0]oled_data,
    output reg endPlayerTurn = 0,
    output [3:0] an,
    output [6:0] seg,
    output reg skipSelected = 0,
    output reg doubleDiceSelected = 0,
    output reg doubleJumpSelected = 0,
    output skipFlag
    );

    wire [1:0]confirm;
    wire [3:0]powerUps;
    wire [2:0]box_idx;
    
    wire [15:0]powerUpOled;
    wire [15:0]msgOled;
    wire [15:0]boxOled;
    wire [15:0]reviveOled;
    
    wire [2:0]enemyToSelected;
    wire skipTurnSelected;
    wire endTurn;
    reg [3:0]player_powerUp = 4'b1111;
    
    powerUpIcons(clock, pixel_index, player_powerUp, confirm, skipTurnSelected, powerUpOled);
    selectPowerUp(clock, turnActive, sw, btnL, btnR, btnC, btnD, pixel_index, skipTurnSelected, confirm, box_idx, powerUps, enemyToSelected, boxOled, skipFlag);
    message(clock, pixel_index, confirm, box_idx, powerUps, msgOled);
    
    reviveMenu (clock, playerKilled, pixel_index, btnL, btnR, btnC, btnD, powerUps, reviveOled, endTurn, an, seg);
    
    always @ (posedge clock) begin
    
        case (box_idx) 
        0: begin
            if (confirm == 2) begin
                skipSelected = 1;
                doubleDiceSelected = 0;
                doubleJumpSelected = 0;
            end
        end
        
        1: begin
            if (confirm == 2) begin
                skipSelected = 0;
                doubleDiceSelected = 1;
                doubleJumpSelected = 0;
            end
        end
        
        2: begin
            if (confirm == 2) begin
                skipSelected = 0;
                doubleDiceSelected = 0;
                doubleJumpSelected = 1;
            end
        end
        
        default: begin
            skipSelected = 0;
            doubleDiceSelected = 0;
            doubleJumpSelected = 0;
        end
        endcase
    
        if (sw && !playerKilled) begin
            oled_data = msgOled | powerUpOled | boxOled;
        end
        if (playerKilled) begin
            oled_data = reviveOled;
        end 
    end
    
    always @ (powerUps) begin
         player_powerUp = powerUps;
    end
    
    always @ (endTurn) begin
         endPlayerTurn = endTurn;
    end
    
endmodule
