`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2024 20:58:15
// Design Name: 
// Module Name: gameState
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


module gameState(input CLOCK, input gameStart, 
                 input diceOverride, sw12, sw13, sw14, sw15, btnc, btnl, btnu, btnr, btnd, 
                 input isMoving1, isMoving2, isMoving3, isMoving4,
                 input inColumn1, inColumn2, inColumn3, inColumn4,
                 input p1winFlag, p2winFlag, p3winFlag, p4winFlag,
                 input p1killedByp2, p1killedByp3, p1killedByp4,
                 input p2killedByp1, p2killedByp3, p2killedByp4, 
                 input p3killedByp1, p3killedByp2, p3killedByp4, 
                 input p4killedByp1, p4killedByp2, p4killedByp3, 
                 input p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected,
                 input p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected,
                 input p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected,
                 input p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected,
                 input [3:0] requiredStepsP1, requiredStepsP2, requiredStepsP3, requiredStepsP4,
                 input [12:0] pixel_index, 
                 output LD0, 
                 output reg LD1 = 0, LD2 = 0, LD3 = 0, LD4 = 0, LD5 = 0, LD6 = 0, LD7 = 0, LD8 = 0, 
                 output reg p1_rolledDice = 0, p2_rolledDice = 0, p3_rolledDice = 0, p4_rolledDice = 0,
                 output reg p1_forceEnd = 0, p2_forceEnd = 0, p3_forceEnd = 0, p4_forceEnd = 0,
                 output reg player1_winMoveFlag = 0, player2_winMoveFlag = 0, player3_winMoveFlag = 0, player4_winMoveFlag = 0,
                 output reg player1_lefthome = 0, player2_lefthome = 0, player3_lefthome = 0, player4_lefthome = 0,
                 output reg p1_diceScreen = 0, p2_diceScreen = 0, p3_diceScreen = 0, p4_diceScreen = 0,
                 output [3:0] p1_diceroll, p2_diceroll, p3_diceroll, p4_diceroll,
                 output [15:0] p1_oled_dice, p2_oled_dice, p3_oled_dice, p4_oled_dice,
                 output moveFlag1, moveFlag2, moveFlag3, moveFlag4,
                 output reg [3:0] p1_turn = 0, p2_turn = 0, p3_turn = 0, p4_turn = 0);

    // state variables
    parameter START   = 4'b0000;
    parameter P1_DICE = 4'b0001;
    parameter P1_MOVE = 4'b0010;
    parameter P2_DICE = 4'b0011;
    parameter P2_MOVE = 4'b0100;
    parameter P3_DICE = 4'b0101;
    parameter P3_MOVE = 4'b0110;
    parameter P4_DICE = 4'b0111;
    parameter P4_MOVE = 4'b1000;
    parameter P1_WIN  = 4'b1001;
    parameter P2_WIN  = 4'b1010;
    parameter P3_WIN  = 4'b1011;
    parameter P4_WIN  = 4'b1100;
    parameter IDLE    = 4'b1111; 
    
    wire clk1hz, clk2hz;
    wire [2:0] delayCount;
    wire animation1Done, animation2Done, animation3Done, animation4Done;
    wire [2:0] p1_diceOutput, p2_diceOutput, p3_diceOutput, p4_diceOutput;
    
    reg gameStarted = 0;
    reg p1_doubleDiceDone = 0;
    reg p2_doubleDiceDone = 0;
    reg p3_doubleDiceDone = 0;
    reg p4_doubleDiceDone = 0;
    reg p1_doubleJumpDone = 0;
    reg p2_doubleJumpDone = 0;
    reg p3_doubleJumpDone = 0;
    reg p4_doubleJumpDone = 0;
    reg p1_skipDone = 0;
    reg p2_skipDone = 0;
    reg p3_skipDone = 0;
    reg p4_skipDone = 0;
    reg delayReset = 1;
    reg p1DiceStartFlag = 0, p2DiceStartFlag = 0, p3DiceStartFlag = 0, p4DiceStartFlag = 0;
    reg [3:0] state = IDLE;
    
    flexible_clock clk2hz_module(CLOCK, 24999999, clk2hz);
    flexible_clock clk1hz_module(CLOCK, 49999999, clk1hz);
    counter1s gameStateDelayCounter (clk1hz, delayReset, delayCount);
    
    diceModule p1_dice (CLOCK, p1DiceStartFlag, p1_diceScreen, pixel_index, p1_oled_dice, p1_diceOutput, animation1Done);
    diceModule p2_dice (CLOCK, p2DiceStartFlag, p2_diceScreen, pixel_index, p2_oled_dice, p2_diceOutput, animation2Done);
    diceModule p3_dice (CLOCK, p3DiceStartFlag, p3_diceScreen, pixel_index, p3_oled_dice, p3_diceOutput, animation3Done);
    diceModule p4_dice (CLOCK, p4DiceStartFlag, p4_diceScreen, pixel_index, p4_oled_dice, p4_diceOutput, animation4Done);
    
    assign moveFlag1 = animation1Done;
    assign moveFlag2 = animation2Done;
    assign moveFlag3 = animation3Done;
    assign moveFlag4 = animation4Done;
    
    assign LD0 = p1_doubleDiceDone;
    
    always @ (posedge clk2hz) begin
        if (gameStart && ~gameStarted) begin // here gameStart is a signal that is tied high only when all players are ready
        
            // assumes that order of play ALWAYS goes RED(1) -> GREEN(2) -> YELLOW(3) -> BLUE(4)
            gameStarted <= 1;
            state <= START;
        end 
        
        if (player1_winMoveFlag) begin
            if (p1winFlag) begin 
                state <= P1_WIN;
            end 
        end
        
        if (player2_winMoveFlag) begin
            if (p2winFlag) begin 
                state <= P2_WIN;
            end
        end
        
        if (player3_winMoveFlag) begin
            if (p3winFlag) begin 
                state <= P3_WIN;
            end 
        end
        
        if (player4_winMoveFlag) begin
            if (p4winFlag) begin 
                state = P4_WIN;
            end 
        end
        
        if (p1killedByp2 | p1killedByp3 | p1killedByp4) begin 
            player1_lefthome <= 0;
        end 
                
        if (p2killedByp1 | p2killedByp3 | p2killedByp4) begin 
            player2_lefthome <= 0;
        end 
        
        if (p3killedByp1 | p3killedByp2 | p3killedByp4) begin 
            player3_lefthome <= 0;
        end 
        
        if (p4killedByp1 | p4killedByp2 | p4killedByp3) begin 
            player4_lefthome <= 0;
        end 
                        
        case (state) 
        
            START: begin
                // set all players start positions to their homes
                // set all initial conditions
                p1_rolledDice <= 0; p2_rolledDice <= 0; p3_rolledDice <= 0; p4_rolledDice <= 0;
                p1_forceEnd = 0; p2_forceEnd = 0; p3_forceEnd = 0; p4_forceEnd = 0;
                player1_winMoveFlag = 0; player2_winMoveFlag = 0; player3_winMoveFlag = 0; player4_winMoveFlag = 0;
                player1_lefthome = 0; player2_lefthome = 0; player3_lefthome = 0; player4_lefthome = 0;
                p1_diceScreen = 0; p2_diceScreen = 0; p3_diceScreen = 0; p4_diceScreen = 0;
                p1DiceStartFlag = 0; p2DiceStartFlag = 0; p3DiceStartFlag = 0; p4DiceStartFlag = 0;
                state <= P1_DICE;
            end 
            
            P1_DICE: begin 
                p1_turn = p1_turn | 4'b1000;
                LD1 <= 1;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 1;
                p1_diceScreen <= 1;
                p4_forceEnd <= 0; // reset force end flag for p4
                p4_rolledDice <= 0; // reset die roll flag for p4
                // p1 rolls dice and gets the dice value for their turn
                
                
                if (btnu & ~p1_rolledDice) begin
                    p1DiceStartFlag <= 1;
                    p1_rolledDice <= 1;
                end 
                
                if (animation1Done) begin
                    p1_rolledDice <= 0; // reset die roll flag for p1
                    p1_diceScreen <= 0; // turn off dice screen for oled
                    state <= P1_MOVE; 
                end else begin 
                    // state remains as P1_DICE until p1 rolls the dice and gets a value
                    state <= P1_DICE;
                end 
            end 
        
            P1_MOVE: begin
                p1_turn = p1_turn & 0;
                LD1 <= 0;
                LD2 <= 1;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 0;
                p1DiceStartFlag <= 0;
                // p1 takes dice value and attempts to move
                // check if player has left home (by rolling a 6). If player has not and did not roll a 6, ends turn
                // else move required number of steps.
                
                if (player1_lefthome) begin // here player has left home
                    // check if player 1 is in winning column
                    if (inColumn1 & ~isMoving1) begin // here player is in the winning column
                        // check if dice roll == required steps. if equal, then move and set winMoveFlag
                        if (p1_diceroll == requiredStepsP1) begin // check if required steps are met - from p1 movement module
                            player1_winMoveFlag <= 1; // set winning movement flag 
                        end else begin // required steps not met -> transition state to next player
                            state <= P2_DICE;
                        end 
                    end // here player is not in winning column but has left home
                    // output dice roll value to a wire to pass to player1 (in game_grid)
                    // once isMoving1 is set to 0, exit wait

                end else begin // here player has not left home
                    // check if dice roll is 6. if it is, set player1_lefthome to 1.
                    if (p1_diceroll == 6) begin 
                        player1_lefthome <= 1;
                        p1_forceEnd <= 1;
//                        state <= P2_DICE;
                    end else begin  
                        // else transition state to next state
                        p1_forceEnd <= 1;
                        state <= P2_DICE;
                    end 
                end 
                
                if (delayCount == 1) begin // minimally 1s before moving on
                    if (isMoving1) begin 
                        // state remains unless token stops moving
                        state <= P1_MOVE;
                    end else begin 
                        if (p1_doubleDiceSelected & ~p1_doubleDiceDone) begin
                            p1_doubleDiceDone <= 1;
                            state <= P1_DICE;
                             
                        end else begin
                            state <= P2_DICE;
                        end
                    end  
                end
            end 
            
            P2_DICE: begin 
                p2_turn = p2_turn | 4'b0100;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 1;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 1;
                p2_diceScreen <= 1;
                p1_forceEnd <= 0; // reset force end flag for p1
                p1_rolledDice <= 0; // reset die roll flag for p1
                // p2 rolls dice and gets the dice value for their turn
                if (btnu & ~p2_rolledDice) begin 
                    p2DiceStartFlag <= 1;
                    p2_rolledDice <= 1;
                end 
            
                if (animation2Done) begin
                    p2_rolledDice <= 0; // reset die roll flag for p2
                    p2_diceScreen <= 0; // turn off dice screen for oled
                    state <= P2_MOVE; 
                end else begin 
                    // state remains as P2_DICE until p2 rolls the dice and gets a value
                    state <= P2_DICE;
                end 
            end 
        
            P2_MOVE: begin
                p2_turn = p2_turn & 0;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 1;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 0;
                p2_diceScreen <= 0;
                p2DiceStartFlag <= 0;
                
                // p2 takes dice value and attempts to move
                // check if player has left home (by rolling a 6). If player has not and did not roll a 6, ends turn
                // else move required number of steps.
            
                if (player2_lefthome) begin // here player has left home
                    // check if player 2 is in winning column
                    if (inColumn2 & ~isMoving2) begin // here player is in the winning column
                        // check if dice roll == required steps. if equal, then move and set winMoveFlag
                        if (p2_diceroll == requiredStepsP2) begin // check if required steps are met - from p2 movement module
                            player2_winMoveFlag <= 1; // set winning movement flag 
                        end else begin // required steps not met -> transition state to next player
                            state <= P3_DICE;
                        end 
                    end // here player is not in winning column but has left home 
                    // output dice roll value to a wire to pass to player2 (in game_grid)
                    // once isMoving2 is set to 0, exit wait

                end else begin // here player has not left home 
                    // check if dice roll is 6. if it is, set player2_lefthome to 1.
                    if (p2_diceroll == 6) begin 
                        player2_lefthome <= 1;
                        p2_forceEnd <= 1;
//                        state <= P3_DICE;
                    end else begin 
                        // else transition state to next state
                        p2_forceEnd <= 1;
                        state <= P3_DICE;
                    end 
                end 
                
                if (delayCount == 1) begin // minimally 1s before moving on
                    if (isMoving2) begin 
                        // state remains unless token stops moving
                        state <= P2_MOVE;
                    end else begin 
                        if (p2_doubleDiceSelected & ~p2_doubleDiceDone) begin
                            p2_doubleDiceDone <= 1;
                            state <= P2_DICE; 
                            
                        end else begin
                            state <= P3_DICE;
                        end
                    end
                end
            end
            
            P3_DICE: begin
                p3_turn = p3_turn | 4'b0010;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 1;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 1;
                p3_diceScreen <= 1;
                p2_forceEnd <= 0; // reset force end flag for p2
                p2_rolledDice <= 0; // reset die roll flag for p2
                // p3 rolls dice and gets the dice value for their turn
                if (btnu & ~p3_rolledDice) begin 
                    p3DiceStartFlag <= 1;
                    p3_rolledDice <= 1;
                end 
        
                if (animation3Done) begin  
                    p3_rolledDice <= 0; // reset die roll flag for p3
                    p3_diceScreen <= 0; // turn off dice screen for oled
                    state <= P3_MOVE;
                end else begin 
                    // state remains as P3_DICE until p3 rolls the dice and gets a value
                    state <= P3_DICE;
                end
            end 
            
            P3_MOVE: begin
                p3_turn = p3_turn & 0;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 1;
                LD7 <= 0;
                LD8 <= 0;
                
                delayReset <= 0;
                p3_diceScreen <= 0;
                p3DiceStartFlag <= 0;
                
                // p3 takes dice value and attempts to move
                // check if player has left home (by rolling a 6). If player has not and did not roll a 6, ends turn
                // else move required number of steps.
            
                if (player3_lefthome) begin // here player has left home
                    // check if player 3 is in winning column
                    if (inColumn3 & ~isMoving3) begin // here player is in the winning column
                        // check if dice roll == required steps. if equal, then move and set winMoveFlag
                        if (p3_diceroll == requiredStepsP3) begin // check if required steps are met - from p3 movement module
                            player3_winMoveFlag <= 1; // set winning movement flag
                        end else begin // required steps not met -> transition state to next player
                            state <= P4_DICE;
                        end 
                    end  // here player is not in winning column but has left home 
                    // output dice roll value to a wire to pass to player3 (in game_grid)
                    // once isMoving3 is set to 0, exit wait

                end else begin // here player has not left home
                    // check if dice roll is 6. if it is, set player3_lefthome to 1.
                    if (p3_diceroll == 6) begin 
                        player3_lefthome <= 1;
                        p3_forceEnd <= 1;
//                        state <= P4_DICE;
                    end else begin 
                        // else transition state to next state
                        p3_forceEnd <= 1;
                        state <= P4_DICE;
                    end 
                end 
                
                if (delayCount == 1) begin // minimally 1s before moving on
                    if (isMoving3) begin 
                        // state remains unless token stops moving
                        state <= P3_MOVE;
                    end else begin
                        if (p3_doubleDiceSelected & ~p3_doubleDiceDone) begin
                            p3_doubleDiceDone <= 1;
                            state <= P3_DICE; 
                        
                        end else begin
                            state <= P4_DICE;
                        end
                    end 
                end
            end
            
            P4_DICE: begin 
                p4_turn = p4_turn | 4'b0001;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 1;
                LD8 <= 0;
                
                delayReset <= 1;
                p4_diceScreen <= 1;
                p3_forceEnd <= 0; // reset force end flag for p3
                p3_rolledDice <= 0; // reset die roll flag for p3      
                // p4 rolls dice and gets the dice value for their turn
                if (btnu & ~p4_rolledDice) begin 
                    p4DiceStartFlag <= 1;
                    p4_rolledDice <= 1;
                end 
        
                if (animation4Done) begin
                    p4_rolledDice <= 0; // reset die roll flag for p4
                    p4_diceScreen <= 0; // turn off dice screen for oled
                    state <= P4_MOVE;
                end else begin 
                    // state remains as P4_DICE until p4 rolls the dice and gets a value
                    state <= P4_DICE;
                end 
            end 
            
            P4_MOVE: begin
                p4_turn = p4_turn & 0;
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 0;
                LD6 <= 0;
                LD7 <= 0;
                LD8 <= 1;
                
                delayReset <= 0;
                p4_diceScreen <= 0;
                p4DiceStartFlag <= 0;
                // p4 takes dice value and attempts to move
                // check if player has left home (by rolling a 6). If player has not and did not roll a 6, ends turn
                // else move required number of steps.
            
                if (player4_lefthome) begin // here player has left home
                    // check if player 4 is in winning column
                    if (inColumn4 & ~isMoving4) begin // here player is in the winning column
                        // check if dice roll == required steps. if equal, then move and set winMoveFlag
                        if (p4_diceroll == requiredStepsP4) begin // check if required steps are met - from p4 movement module
                            player4_winMoveFlag <= 1; // set winning movement flag
                        end else begin // required steps not met -> transition state to next player
                            state <= P1_DICE;
                        end 
                    end // here player is not in winning column but has left home 
                    // output dice roll value to a wire to pass to player4 (in game_grid)
                    // once isMoving4 is set to 0, exit wait

                end else begin // here player has not left home
                    // check if dice roll is 6. if it is, set player4_lefthome to 1.
                    if (p4_diceroll == 6) begin 
                        player4_lefthome <= 1;
                        p4_forceEnd <= 1;
//                        state <= P1_DICE;
                    end else begin 
                        // else transition state to next state
                        p4_forceEnd <= 1;
                        state <= P1_DICE;
                    end  
                end 
                
                if (delayCount == 1) begin // minimally 1s before moving on
                    if (isMoving4) begin 
                        // state remains unless token stops moving
                        state <= P4_MOVE;
                    end else begin 
                        if (p4_doubleDiceSelected & ~p4_doubleDiceDone) begin
                            p4_doubleDiceDone <= 1;
                            state <= P4_DICE; 
                        end else begin
                            state <= P1_DICE;
                        end
                    end 
                end
            end
            
            P1_WIN: begin 
                LD1 <= 1;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 1;
                LD6 <= 1;
                LD7 <= 1;
                LD8 <= 1;
                state <= P1_WIN;
            end 
            
            P2_WIN: begin 
                LD1 <= 0;
                LD2 <= 1;
                LD3 <= 0;
                LD4 <= 0;
                LD5 <= 1;
                LD6 <= 1;
                LD7 <= 1;
                LD8 <= 1;
                state <= P2_WIN;
            end 
            
            P3_WIN: begin 
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 1;
                LD4 <= 0;
                LD5 <= 1;
                LD6 <= 1;
                LD7 <= 1;
                LD8 <= 1;
                state <= P3_WIN;
            end 
            
            P4_WIN: begin 
                LD1 <= 0;
                LD2 <= 0;
                LD3 <= 0;
                LD4 <= 1;
                LD5 <= 1;
                LD6 <= 1;
                LD7 <= 1;
                LD8 <= 1;
                state <= P4_WIN;
            end 
            
        endcase 
    end 
    
    assign p1_diceroll = (diceOverride) ? {sw15, sw14, sw13, sw12} : p1_diceOutput; // assign dice roll values from dice module 1 or override
    assign p2_diceroll = (diceOverride) ? {sw15, sw14, sw13, sw12} : p2_diceOutput; // assign dice roll values from dice module 2 or override
    assign p3_diceroll = (diceOverride) ? {sw15, sw14, sw13, sw12} : p3_diceOutput; // assign dice roll values from dice module 3 or override
    assign p4_diceroll = (diceOverride) ? {sw15, sw14, sw13, sw12} : p4_diceOutput; // assign dice roll values from dice module 4 or override
    
endmodule
