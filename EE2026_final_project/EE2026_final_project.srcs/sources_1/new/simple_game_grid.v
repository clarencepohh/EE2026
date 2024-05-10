`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2024 14:40:51
// Design Name: 
// Module Name: simple_game_grid
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

`define GRID1  (x > 43 && x <= 45) && (y > 54 && y <= 56)
`define GRID2  (x > 43 && x <= 45) && (y > 50 && y <= 52)
`define GRID3  (x > 43 && x <= 45) && (y > 46 && y <= 48)
`define GRID4  (x > 43 && x <= 45) && (y > 42 && y <= 44)
`define GRID5  (x > 43 && x <= 45) && (y > 38 && y <= 40)
`define GRID6  (x > 43 && x <= 45) && (y > 34 && y <= 36)
`define GRID7  (x > 39 && x <= 41) && (y > 34 && y <= 36)
`define GRID8  (x > 35 && x <= 37) && (y > 34 && y <= 36)
`define GRID9  (x > 31 && x <= 33) && (y > 34 && y <= 36)
`define GRID10 (x > 27 && x <= 29) && (y > 34 && y <= 36)
`define GRID11 (x > 23 && x <= 25) && (y > 34 && y <= 36)
`define GRID12 (x > 19 && x <= 21) && (y > 34 && y <= 36)
`define GRID13 (x > 19 && x <= 21) && (y > 30 && y <= 32)
`define GRID14 (x > 19 && x <= 21) && (y > 26 && y <= 28)
`define GRID15 (x > 23 && x <= 25) && (y > 26 && y <= 28)
`define GRID16 (x > 27 && x <= 29) && (y > 26 && y <= 28)
`define GRID17 (x > 31 && x <= 33) && (y > 26 && y <= 28)
`define GRID18 (x > 35 && x <= 37) && (y > 26 && y <= 28)
`define GRID19 (x > 39 && x <= 41) && (y > 26 && y <= 28)
`define GRID20 (x > 43 && x <= 45) && (y > 26 && y <= 28)
`define GRID21 (x > 43 && x <= 45) && (y > 22 && y <= 24)
`define GRID22 (x > 43 && x <= 45) && (y > 18 && y <= 20)
`define GRID23 (x > 43 && x <= 45) && (y > 14 && y <= 16)
`define GRID24 (x > 43 && x <= 45) && (y > 10 && y <= 12)
`define GRID25 (x > 43 && x <= 45) && (y >  6 && y <=  8)
`define GRID26 (x > 43 && x <= 45) && (y >  2 && y <=  4)
`define GRID27 (x > 47 && x <= 49) && (y >  2 && y <=  4)
`define GRID28 (x > 51 && x <= 53) && (y >  2 && y <=  4)
`define GRID29 (x > 51 && x <= 53) && (y >  6 && y <=  8)
`define GRID30 (x > 51 && x <= 53) && (y > 10 && y <= 12)
`define GRID31 (x > 51 && x <= 53) && (y > 14 && y <= 16)
`define GRID32 (x > 51 && x <= 53) && (y > 18 && y <= 20)
`define GRID33 (x > 51 && x <= 53) && (y > 22 && y <= 24)
`define GRID34 (x > 51 && x <= 53) && (y > 26 && y <= 28)
`define GRID35 (x > 55 && x <= 57) && (y > 26 && y <= 28)
`define GRID36 (x > 59 && x <= 61) && (y > 26 && y <= 28)
`define GRID37 (x > 63 && x <= 65) && (y > 26 && y <= 28)
`define GRID38 (x > 67 && x <= 69) && (y > 26 && y <= 28)
`define GRID39 (x > 71 && x <= 73) && (y > 26 && y <= 28)
`define GRID40 (x > 75 && x <= 77) && (y > 26 && y <= 28)
`define GRID41 (x > 75 && x <= 77) && (y > 30 && y <= 32)
`define GRID42 (x > 75 && x <= 77) && (y > 34 && y <= 36)
`define GRID43 (x > 71 && x <= 73) && (y > 34 && y <= 36)
`define GRID44 (x > 67 && x <= 69) && (y > 34 && y <= 36)
`define GRID45 (x > 63 && x <= 65) && (y > 34 && y <= 36)
`define GRID46 (x > 59 && x <= 61) && (y > 34 && y <= 36)
`define GRID47 (x > 55 && x <= 57) && (y > 34 && y <= 36)
`define GRID48 (x > 51 && x <= 53) && (y > 34 && y <= 36)
`define GRID49 (x > 51 && x <= 53) && (y > 38 && y <= 40)
`define GRID50 (x > 51 && x <= 53) && (y > 42 && y <= 44)
`define GRID51 (x > 51 && x <= 53) && (y > 46 && y <= 48)
`define GRID52 (x > 51 && x <= 53) && (y > 50 && y <= 52)
`define GRID53 (x > 51 && x <= 53) && (y > 54 && y <= 56)
`define GRID54 (x > 51 && x <= 53) && (y > 58 && y <= 60)
`define GRID55 (x > 47 && x <= 49) && (y > 58 && y <= 60)
`define GRID56 (x > 43 && x <= 45) && (y > 58 && y <= 60)

`define GREENHOME  (x > 19 && x <= 41) && (y >  2 && y <= 24)
`define REDHOME    (x > 19 && x <= 41) && (y > 38 && y <= 60)
`define BLUEHOME   (x > 55 && x <= 77) && (y > 38 && y <= 60)
`define YELLOWHOME (x > 55 && x <= 77) && (y >  2 && y <= 24)

`define GREENCOLUMN  (x > 22 && x <= 46) && (y > 29 && y <= 33)
`define REDCOLUMN    (x > 46 && x <= 50) && (y > 33 && y <= 57)
`define BLUECOLUMN   (x > 50 && x <= 74) && (y > 29 && y <= 33)
`define YELLOWCOLUMN (x > 46 && x <= 50) && (y >  5 && y <= 29)

`define LEFTOUTERGRID   (x >=  0 && x <= 18)
`define RIGHTTOUTERGRID (x >= 79 && x <= 95)
`define TOPOUTERGRID    (y >=  0 && y <=  1)
`define BOTTOMOUTERGRID (y >= 62)

`define LEFTBOARDBORDER   (x == 19) && (y >  1 && y <= 61)
`define RIGHTBOARDBORDER  (x == 78) && (y >  1 && y <= 61)
`define TOPBOARDBORDER    (x > 18 && x <= 78) && (y == 2)
`define BOTTOMBOARDBORDER (x > 18 && x <= 78) && (y == 61)
`define GREENHOMEBORDER   (x == 42) && (y >  1 && y <= 25) || (x > 18 && x <= 42) && (y == 25) // vert || horizontal
`define REDHOMEBORDER     (x == 42) && (y > 37 && y <= 61) || (x > 18 && x <= 42) && (y == 38)
`define BLUEHOMEBORDER    (x == 55) && (y > 37 && y <= 61) || (x > 54 && x <= 78) && (y == 38) 
`define YELLOWHOMEBORDER  (x == 55) && (y >  1 && y <= 25) || (x > 54 && x <= 78) && (y == 25)

`define TOPHALFGRIDLINES    (x >= 43 && x <= 54) && (y >=  5 && y <=  6) || (x >= 43 && x <= 54) && (y >=  9 && y <= 10) || (x >= 43 && x <= 54) && (y >= 13 && y <= 14) || (x >= 43 && x <= 54) && (y >= 17 && y <= 18) || (x >= 43 && x <= 54) && (y >= 21 && y <= 22) || (x >= 43 && x <= 54) && (y == 25)
`define BOTTOMHALFGRIDLINES (x >= 43 && x <= 54) && (y >= 41 && y <= 42) || (x >= 43 && x <= 54) && (y >= 45 && y <= 46) || (x >= 43 && x <= 54) && (y >= 49 && y <= 50) || (x >= 43 && x <= 54) && (y >= 53 && y <= 54) || (x >= 43 && x <= 54) && (y >= 57 && y <= 58) || (x >= 43 && x <= 54) && (y == 38)
`define HORIZONTALGRIDLINES (x >= 19 && x <= 78) && (y == 26) || (x >= 19 && x <= 78) && (y >= 29 && y <= 30) || (x >= 19 && x <= 78) && (y >= 33 && y <= 34) || (x >= 19 && x <= 78) && (y == 37)
`define LEFTHALFGRIDLINES   (x >= 22 && x <= 23) && (y >= 26 && y <= 37) || (x >= 26 && x <= 27) && (y >= 26 && y <= 37) || (x >= 30 && x <= 31) && (y >= 26 && y <= 37) || (x >= 34 && x <= 35) && (y >= 26 && y <= 37) || (x >= 38 && x <= 39) && (y >= 26 && y <= 37) || (x == 42) && (y >= 26 && y <= 37)
`define RIGHTHALFGRIDLINES  (x >= 58 && x <= 59) && (y >= 26 && y <= 37) || (x >= 62 && x <= 63) && (y >= 26 && y <= 37) || (x >= 66 && x <= 67) && (y >= 26 && y <= 37) || (x >= 70 && x <= 71) && (y >= 26 && y <= 37) || (x >= 74 && x <= 75) && (y >= 26 && y <= 37) || (x == 55) && (y >= 26 && y <= 37)
`define VERTICALGRIDLINES   (x == 43) && (y >= 2 && y <= 61) || (x >= 46 && x <= 47) && (y >= 2 && y <= 61) || (x >= 50 && x <= 51) && (y >= 2 && y <= 61) || (x == 54) && (y >= 2 && y <= 61)

`define WHITE  16'b1111111111111111
`define BLACK  16'b0000000000000000
`define ORANGE 16'b1111110001100000
`define GREEN  16'b0000111111100000
`define RED    16'b1111100000000000
`define BLUE   16'b0000000010011111
`define YELLOW 16'b1111111111000000
`define BEIGE  16'b1111010101001010

module game_grid (input CLOCK, clk6p25mhz, [12:0] pixel_index,
                  input [2:0] playerAffected,
                  input endP1Revive, endP2Revive, endP3Revive, endP4Revive,
                  input sw0, sw1, sw2, sw3, sw4, sw7, sw12, sw13, sw14, sw15, btnc, btnl, btnu, btnr, btnd,
                  input [7:0] x, [6:0] y,
                  output [15:0] LD,
                  output [15:0] oled_output, 
                  output reg gameStartFlag = 0,
                  output p1Killed, p2Killed, p3Killed, p4Killed,
                  output [3:0] p1_turn, p2_turn, p3_turn, p4_turn,
                  input p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected,
                        p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected,
                        p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected,
                        p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected,
                  output p1winFlag, p2winFlag, p3winFlag, p4winFlag);
                    // skip to gameState, doubleDice to FSM, doubleJump to FSM
    wire clk4hz;
    wire gameStart;
    wire p1_rolledDice, p2_rolledDice, p3_rolledDice, p4_rolledDice;
    wire p1_forceEnd, p2_forceEnd, p3_forceEnd, p4_forceEnd;
    wire p1killedByp2, p1killedByp3, p1killedByp4;
    wire p2killedByp1, p2killedByp3, p2killedByp4;
    wire p3killedByp1, p3killedByp2, p3killedByp4;
    wire p4killedByp1, p4killedByp2, p4killedByp3;
    wire player1_winMoveFlag, player2_winMoveFlag, player3_winMoveFlag, player4_winMoveFlag;
    wire player1_lefthome, player2_lefthome, player3_lefthome, player4_lefthome;
    wire inWinningColumn1, inWinningColumn2, inWinningColumn3, inWinningColumn4;
    wire [3:0] p1_diceroll, p2_diceroll, p3_diceroll, p4_diceroll;
    wire [3:0] requiredStepsP1, requiredStepsP2, requiredStepsP3, requiredStepsP4;
    wire [7:0] player1_leftX, player1_rightX, player2_leftX, player2_rightX, player3_leftX, player3_rightX, player4_leftX, player4_rightX;
    wire [6:0] player1_topY, player1_bottomY, player2_topY, player2_bottomY, player3_topY, player3_bottomY, player4_topY, player4_bottomY;
    wire [15:0] p1_oled_dice, p2_oled_dice, p3_oled_dice, p4_oled_dice;
    wire p1_diceScreen, p2_diceScreen, p3_diceScreen, p4_diceScreen;
    wire is1Moving, is2Moving, is3Moving, is4Moving;
    wire moveFlag1, moveFlag2, moveFlag3, moveFlag4;
    
    
    reg [15:0] oled_gameGrid;
    
    assign p1Killed = p1killedByp2 | p1killedByp3 | p1killedByp4;
    assign p2Killed = p2killedByp1 | p2killedByp3 | p2killedByp4;
    assign p3Killed = p3killedByp1 | p3killedByp2 | p3killedByp4;
    assign p4Killed = p4killedByp1 | p4killedByp2 | p4killedByp3;
    
    // clock driver for player movement modules 
    flexible_clock clk2hz_module (CLOCK, 12499999, clk4hz);
        
    // player movement module - Player 1: RED.   
    player1_movementFSM player1 (moveFlag1, clk4hz, p1_doubleDiceSelected, p1_doubleJumpSelected,
                                 player1_winMoveFlag, player1_lefthome, p1_rolledDice, p1_forceEnd, p1_diceroll, 
                                 player2_leftX, player3_leftX, player4_leftX, player2_rightX, player3_rightX, player4_rightX, 
                                 player2_topY, player3_topY, player4_topY, player2_bottomY, player3_bottomY, player4_bottomY, 
                                 p1killedByp2, p1killedByp3, p1killedByp4, p2killedByp1, p3killedByp1, p4killedByp1,
                                 p1winFlag, is1Moving, inWinningColumn1, requiredStepsP1, 
                                 player1_leftX, player1_rightX, player1_topY, player1_bottomY); 
                                 
    // player movement module - Player 2: GREEN. 
    player2_movementFSM player2 (moveFlag2, clk4hz, p2_doubleDiceSelected, p2_doubleJumpSelected,
                                 player2_winMoveFlag, player2_lefthome, p2_rolledDice, p2_forceEnd, p2_diceroll, 
                                 player1_leftX, player3_leftX, player4_leftX, player1_rightX, player3_rightX, player4_rightX, 
                                 player1_topY, player3_topY, player4_topY, player1_bottomY, player3_bottomY, player4_bottomY,
                                 p2killedByp1, p2killedByp3, p2killedByp4, p1killedByp2, p3killedByp2, p4killedByp2,
                                 p2winFlag, is2Moving, inWinningColumn2, requiredStepsP2, 
                                 player2_leftX, player2_rightX, player2_topY, player2_bottomY); 
                                 
    // player movement module - Player 3: YELLOW. 
    player3_movementFSM player3 (moveFlag3, clk4hz, p3_doubleDiceSelected, p3_doubleJumpSelected,
                                 player3_winMoveFlag, player3_lefthome, p3_rolledDice, p3_forceEnd, p3_diceroll, 
                                 player1_leftX, player2_leftX, player4_leftX, player1_rightX, player2_rightX, player4_rightX, 
                                 player1_topY, player2_topY, player4_topY, player1_bottomY, player2_bottomY, player4_bottomY,
                                 p3killedByp1, p3killedByp2, p3killedByp4, p1killedByp3, p2killedByp3, p4killedByp3,
                                 p3winFlag, is3Moving, inWinningColumn3, requiredStepsP3, 
                                 player3_leftX, player3_rightX, player3_topY, player3_bottomY); 
                                 
    // player movement module - Player 4: BLUE. 
    player4_movementFSM player4 (moveFlag4, clk4hz, p4_doubleDiceSelected, p4_doubleJumpSelected,
                                 player4_winMoveFlag, player4_lefthome, p4_rolledDice, p4_forceEnd, p4_diceroll, 
                                 player1_leftX, player2_leftX, player3_leftX, player1_rightX, player2_rightX, player3_rightX, 
                                 player1_topY, player2_topY, player3_topY, player1_bottomY, player2_bottomY, player3_bottomY,
                                 p4killedByp1, p4killedByp2, p4killedByp3, p1killedByp4, p2killedByp4, p3killedByp4,
                                 p4winFlag, is4Moving, inWinningColumn4, requiredStepsP4, 
                                 player4_leftX, player4_rightX, player4_topY, player4_bottomY); 
    
    // module that keeps track of current game state
    gameState (CLOCK, gameStart, sw0, sw12, sw13, sw14, sw15, btnc, btnl, btnu, btnr, btnd,
               is1Moving, is2Moving, is3Moving, is4Moving,
               inWinningColumn1, inWinningColumn2, inWinningColumn3, inWinningColumn4,
               p1winFlag, p2winFlag, p3winFlag, p4winFlag,
               p1killedByp2, p1killedByp3, p1killedByp4,
               p2killedByp1, p2killedByp3, p2killedByp4,
               p3killedByp1, p3killedByp2, p3killedByp4, 
               p4killedByp1, p4killedByp2, p4killedByp3,
               p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected,
               p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected,
               p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected,
               p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected,
               requiredStepsP1, requiredStepsP2, requiredStepsP3, requiredStepsP4, pixel_index,
               LD[0], LD[1], LD[2], LD[3], LD[4], LD[5], LD[6], LD[7], LD[8],
               p1_rolledDice, p2_rolledDice, p3_rolledDice, p4_rolledDice,
               p1_forceEnd, p2_forceEnd, p3_forceEnd, p4_forceEnd,
               player1_winMoveFlag, player2_winMoveFlag, player3_winMoveFlag, player4_winMoveFlag,
               player1_lefthome, player2_lefthome, player3_lefthome, player4_lefthome,
               p1_diceScreen, p2_diceScreen, p3_diceScreen, p4_diceScreen,
               p1_diceroll, p2_diceroll, p3_diceroll, p4_diceroll,
               p1_oled_dice, p2_oled_dice, p3_oled_dice, p4_oled_dice,
               moveFlag1, moveFlag2, moveFlag3, moveFlag4,
               p1_turn, p2_turn, p3_turn, p4_turn);
    
    // main oled driver for active game board
    always @ (posedge clk6p25mhz) 
    begin
    
        if (gameStart) begin    
            gameStartFlag <= 1;
        end 
    
        if ( /* red*/  `GRID2  || `GRID3  || `GRID4  || `GRID5  || `GRID6  || `GRID7  || `GRID8  || `GRID9  || `GRID10 ||
            `GRID11 || `GRID12 || `GRID13 || `GRID14 || /*green*/  `GRID16 || `GRID17 || `GRID18 || `GRID19 || `GRID20 ||
            `GRID21 || `GRID22 || `GRID23 || `GRID24 || `GRID25 || `GRID26 || `GRID27 || `GRID28 || /*yellow*/ `GRID30 ||
            `GRID31 || `GRID32 || `GRID33 || `GRID34 || `GRID35 || `GRID36 || `GRID37 || `GRID38 || `GRID39 || `GRID40 ||
            `GRID41 || `GRID42 || /*blue*/   `GRID44 || `GRID45 || `GRID46 || `GRID47 || `GRID48 || `GRID49 || `GRID50 ||
            `GRID51 || `GRID52 || `GRID53 || `GRID54 || `GRID55 || `GRID56 ) begin
            
            oled_gameGrid <= `WHITE;
        
        end else if (`LEFTBOARDBORDER   || `RIGHTBOARDBORDER    || `TOPBOARDBORDER      || `BOTTOMBOARDBORDER || 
                     `GREENHOMEBORDER   || `REDHOMEBORDER       || `BLUEHOMEBORDER      || `YELLOWHOMEBORDER  || 
                     `TOPHALFGRIDLINES  || `BOTTOMHALFGRIDLINES || `HORIZONTALGRIDLINES || 
                     `LEFTHALFGRIDLINES || `RIGHTHALFGRIDLINES  || `VERTICALGRIDLINES   ) begin
                             
            oled_gameGrid <= `BLACK;    
                
        end else if (`LEFTOUTERGRID || `RIGHTTOUTERGRID || `TOPOUTERGRID || `BOTTOMOUTERGRID) begin
            oled_gameGrid <= `BEIGE;
            
        end else if (`GREENCOLUMN || `GREENHOME || `GRID15) begin
            oled_gameGrid <= `GREEN;
            
        end else if (`REDCOLUMN || `REDHOME || `GRID1) begin 
            oled_gameGrid <= `RED;
            
        end else if (`BLUECOLUMN || `BLUEHOME || `GRID43) begin
            oled_gameGrid <= `BLUE;
            
        end else if (`YELLOWCOLUMN || `YELLOWHOME || `GRID29) begin
            oled_gameGrid <= `YELLOW;
        
        end else begin
            oled_gameGrid <= `ORANGE;
        end  
        
        // Player 1 (RED) token printer  
        if (x >= player1_leftX && x <= player1_rightX && y >= player1_topY && y <= player1_bottomY) begin
            if (x > player1_leftX && x < player1_rightX && y > player1_topY && y < player1_bottomY) begin 
                oled_gameGrid <= `RED;
            end else begin 
                oled_gameGrid <= `WHITE;
            end 
        end         
        
        // Player 2 (GREEN) token printer
        if (x >= player2_leftX && x <= player2_rightX && y >= player2_topY && y <= player2_bottomY) begin
            if (x > player2_leftX && x < player2_rightX && y > player2_topY && y < player2_bottomY) begin 
                oled_gameGrid <= `GREEN;
            end else begin 
                oled_gameGrid <= `WHITE;
            end 
        end 
        
        // Player 3 (YELLOW) token printer
        if (x >= player3_leftX && x <= player3_rightX && y >= player3_topY && y <= player3_bottomY) begin
            if (x > player3_leftX && x < player3_rightX && y > player3_topY && y < player3_bottomY) begin 
                oled_gameGrid <= `YELLOW;
            end else begin 
                oled_gameGrid <= `WHITE;
            end 
        end         
                
        // Player 4 (BLUE) token printer
        if (x >= player4_leftX && x <= player4_rightX && y >= player4_topY && y <= player4_bottomY) begin
            if (x > player4_leftX && x < player4_rightX && y > player4_topY && y < player4_bottomY) begin 
                oled_gameGrid <= `BLUE;
            end else begin 
                oled_gameGrid <= `WHITE;
            end 
        end 
    end    
    
    assign gameStart = sw1 & sw2 & sw3 & sw4;
    
    assign oled_output = (p1_diceScreen) ? p1_oled_dice :  
                         (p2_diceScreen) ? p2_oled_dice : 
                         (p3_diceScreen) ? p3_oled_dice : 
                         (p4_diceScreen) ? p4_oled_dice :
                          oled_gameGrid;
endmodule
