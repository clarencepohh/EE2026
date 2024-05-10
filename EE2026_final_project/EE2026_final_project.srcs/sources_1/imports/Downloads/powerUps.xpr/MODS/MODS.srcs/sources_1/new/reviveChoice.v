`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 23:00:17
// Design Name: 
// Module Name: reviveChoice
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


module reviveChoice(
    input clock,
    input playerKilled,
    input btnL, btnR, btnC, btnD,
    output [3:0]an,
    output [6:0]seg,
    output reg toReviveChoice,
    output reg [1:0]confirm = 0,
    output reg [3:0]myPowerUp = 4'b1111,
    output reg endPlayerTurn = 0
    );
    
    wire debounceL;
    reg noCheckL;
    wire debounceR;
    reg noCheckR;
    wire debounceC;
    reg noCheckC;
    wire debounceD;
    reg noCheckD;
    
    reg yesNoChoice;
    
    debouncer debouncerL(clock, btnL, debounceL);
    debouncer debouncerR(clock, btnR, debounceR);
    debouncer debouncerC(clock, btnC, debounceC);
    debouncer debouncerD(clock, btnD, debounceD);
    
    segementChoiceDisplay(clock, playerKilled, yesNoChoice, an, seg);
    
    always @ (posedge clock) begin
        if ((myPowerUp & 4'b1000) != 4'b1000) begin
            endPlayerTurn <= 1;
        end
        if (playerKilled && ((myPowerUp & 4'b1000) == 4'b1000)) begin
            if (debounceD && !noCheckD) begin
                noCheckD <= 1;
                confirm <= 0;
                if (confirm == 2) begin
                    if (toReviveChoice) begin
                        myPowerUp <= myPowerUp & 4'b0111;
                    end
                    endPlayerTurn <= 1;
                end
            end
            if (!debounceD) begin
                noCheckD <= 0;
            end
            if (debounceL && !noCheckL) begin
                noCheckL <= 1;
                yesNoChoice <= (yesNoChoice == 1) ? 0 : yesNoChoice + 1;
            end
            if (!debounceL) begin
                noCheckL <= 0;
            end
            if (debounceR && !noCheckR) begin
                noCheckR <= 1;
                yesNoChoice <= (yesNoChoice == 0) ? 1 : yesNoChoice - 1;
            end
            if (!debounceR) begin
                noCheckR <= 0;  
            end
            if (debounceC && !noCheckC) begin
                noCheckC <= 1;
                confirm <= confirm + 1;
                if (confirm == 0) begin
                    toReviveChoice <= yesNoChoice;
                end
                if (confirm == 1 && !yesNoChoice) begin
                    confirm <= 0;
                end
                if (confirm == 1 && !toReviveChoice)begin
                    endPlayerTurn <= 1;
                end
                if (confirm == 2) begin
                    confirm <= 2;
                end
            end 
            if (!debounceC) begin
                noCheckC <= 0;
            end
        end
    end
    
endmodule
