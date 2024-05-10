`timescale 1ns / 1ps

module reviveMenu (
    input clock,
    input playerKilled,
    input [12:0]pixel_index, 
    input btnL, btnR, btnC, btnD,
    output reg [3:0]powerUp, 
    output reg [15:0]oled_data,
    output reg endPlayerTurn,
    output [3:0]an,
    output [6:0]seg
    );
    
    wire playerChoice;
    wire [3:0]myPowerUp;
    wire [1:0]confirmRevive;
    wire [15:0]reviveMessage_oled;
    wire [15:0]reviveIcon_oled;
    wire endTurn;
    
    reviveChoice(clock, playerKilled, btnL, btnR, btnC, btnD, an, seg, playerChoice, confirmRevive, myPowerUp, endTurn);
    printReviveMessage(clock, pixel_index, playerChoice, confirmRevive, reviveMessage_oled);
    renderReviveIcon(clock, pixel_index, confirmRevive, reviveIcon_oled);

    always @ (posedge clock) begin
        if (playerKilled && ((powerUp & 4'b1000) == 4'b1000)) begin
            oled_data = reviveMessage_oled | reviveIcon_oled;
        end
    end
    
    always @ (endTurn) begin
        endPlayerTurn = endTurn;
    end
    
    always @ (myPowerUp) begin
        powerUp = myPowerUp;
    end
    
endmodule