`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 11:36:54
// Design Name: 
// Module Name: boxChooser
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


module boxChooser(
    input clock,
    input [3:0]turnActive,
    input sw,
    input btnL, btnR, btnC, btnD,
    output reg skipTurnSelected,
    output reg [2:0]player_idx,
    output reg [2:0]idx,
    output reg [1:0]confirm,
    output reg [3:0]powerUps = 4'b1111,
    output reg skipFlag = 0
    );
    
    initial idx = 1;
    initial skipTurnSelected = 0;
     
    wire debounceL;
    reg noCheckL;
    wire debounceR;
    reg noCheckR;
    wire debounceC;
    reg noCheckC;
    wire debounceD;
    reg noCheckD;
    
    debouncer debouncerL(clock, btnL, debounceL);
    debouncer debouncerR(clock, btnR, debounceR);
    debouncer debouncerC(clock, btnC, debounceC);
    debouncer debouncerD(clock, btnD, debounceD);
    
    always @ (posedge clock) begin
        if (sw && turnActive) begin
            if (!skipTurnSelected) begin
                if (debounceD && !noCheckD) begin
                    noCheckD <= 1;
                    confirm <= 0;
                    if (confirm == 2) begin
                        if (idx == 2) begin
                            powerUps <= powerUps & 4'b1011;
                        end
                        if (idx == 1) begin
                            powerUps <= powerUps & 4'b1101;
                        end
                    end
                end
                if (!debounceD) begin
                    noCheckD <= 0;
                    skipFlag <= 1;
                end
                if (debounceL && !noCheckL) begin
                    noCheckL <= 1;
                    idx <= (idx == 2) ? 2 : idx + 1;
                    if (confirm == 2) begin
                        idx <= idx;
                    end
                end
                if (!debounceL) begin
                    noCheckL <= 0;
                end
                if (debounceR && !noCheckR) begin
                    noCheckR <= 1;
                    idx <= (idx == 0) ? 0 : idx - 1;
                    if (confirm == 2) begin
                        idx <= idx;
                    end
                end
                if (!debounceR) begin
                    noCheckR <= 0;  
                end
                if (debounceC && !noCheckC) begin
                    noCheckC <= 1;
                    confirm <= confirm + 1;
                    if (confirm == 1 && ((idx == 0 && ((powerUps & 3'b001) != 3'b001)) || (idx == 1 && ((powerUps & 3'b010) != 3'b010)) || (idx == 2 && ((powerUps & 3'b100) != 3'b100)))) begin
                       confirm <= 1;
                    end
                    if (idx == 0 && ((powerUps & 3'b001) == 3'b001)) begin
                        skipTurnSelected <= 1;
                    end
                    if (confirm == 2) begin
                        confirm <= 2;
                    end
                end
                if (!debounceC) begin
                    noCheckC <= 0;
                end
            end
            if (skipTurnSelected) begin
                if (debounceD && !noCheckD) begin
                    noCheckD <= 1;
                    confirm <= 0;
                    skipTurnSelected <= 0;
                    if (confirm == 2) begin
                        powerUps = powerUps & 4'b1110;
                    end
                end
                if (!debounceD) begin
                    noCheckD <= 0;
                end
                if (debounceL && !noCheckL) begin
                    noCheckL <= 1;
                    player_idx <= (player_idx == 0) ? 0 : player_idx - 1;
                end
                if (!debounceL) begin
                    noCheckL <= 0;
                end
                if (debounceR && !noCheckR) begin
                    noCheckR <= 1;
                    player_idx <= (player_idx == 3) ? 3 : player_idx + 1;
                end
                if (!debounceR) begin
                    noCheckR <= 0;  
                end
                if (debounceC && !noCheckC) begin
                    noCheckC <= 1;
                    confirm <= confirm + 1;
                    if (confirm == 1) begin
                        if ((player_idx == 0) && ((turnActive & 4'b1000) == 4'b1000)) begin // whether he choose himself
                            confirm <= 1;
                        end
                        if ((player_idx == 1) && ((turnActive & 4'b0100) == 4'b0100)) begin // whether he choose himself
                            confirm <= 1;
                        end
                        if ((player_idx == 2) && ((turnActive & 4'b0010) == 4'b0010)) begin // whether he choose himself
                            confirm <= 1;
                        end
                        if ((player_idx == 3) && ((turnActive & 4'b0001) == 4'b1000)) begin // whether he choose himself
                            confirm <= 1;
                        end
                    end
                    if (confirm == 2) begin
                        confirm <= 2;
                    end
                    if (!debounceC) begin
                        noCheckC <= 0;
                    end
                end
            end
        end
    end
endmodule
