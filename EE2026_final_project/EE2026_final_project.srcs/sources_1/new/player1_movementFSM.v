`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 22:10:56
// Design Name: 
// Module Name: player1_movementFSM
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

`define TOKENGRID1  (x >= 43 && x <= 46) && (y >= 54 && y <= 57)
`define TOKENGRID1LEFTX   43
`define TOKENGRID1RIGHTX  46
`define TOKENGRID1TOPY    54
`define TOKENGRID1BOTTOMY 57

`define TOKENGRID2  (x >= 43 && x <= 46) && (y >= 50 && y <= 53)
`define TOKENGRID2LEFTX   43
`define TOKENGRID2RIGHTX  46
`define TOKENGRID2TOPY    50
`define TOKENGRID2BOTTOMY 53

`define TOKENGRID3  (x >= 43 && x <= 46) && (y >= 46 && y <= 49)
`define TOKENGRID3LEFTX   43
`define TOKENGRID3RIGHTX  46
`define TOKENGRID3TOPY    46
`define TOKENGRID3BOTTOMY 49
 
`define TOKENGRID4  (x >= 43 && x <= 46) && (y >= 42 && y <= 45)
`define TOKENGRID4LEFTX   43
`define TOKENGRID4RIGHTX  46
`define TOKENGRID4TOPY    42
`define TOKENGRID4BOTTOMY 45
 
`define TOKENGRID5  (x >= 43 && x <= 46) && (y >= 38 && y <= 41)
`define TOKENGRID5LEFTX   43
`define TOKENGRID5RIGHTX  46
`define TOKENGRID5TOPY    38
`define TOKENGRID5BOTTOMY 41
 
`define TOKENGRID6  (x >= 43 && x <= 46) && (y >= 34 && y <= 37)
`define TOKENGRID6LEFTX   43
`define TOKENGRID6RIGHTX  46
`define TOKENGRID6TOPY    34
`define TOKENGRID6BOTTOMY 37
 
`define TOKENGRID7  (x >= 39 && x <= 42) && (y >= 34 && y <= 37)
`define TOKENGRID7LEFTX   39
`define TOKENGRID7RIGHTX  42
`define TOKENGRID7TOPY    34
`define TOKENGRID7BOTTOMY 37
 
`define TOKENGRID8  (x >= 35 && x <= 38) && (y >= 34 && y <= 37)
`define TOKENGRID8LEFTX   35
`define TOKENGRID8RIGHTX  38
`define TOKENGRID8TOPY    34
`define TOKENGRID8BOTTOMY 37
 
`define TOKENGRID9  (x >= 31 && x <= 34) && (y >= 34 && y <= 37)
`define TOKENGRID9LEFTX   31
`define TOKENGRID9RIGHTX  34
`define TOKENGRID9TOPY    34
`define TOKENGRID9BOTTOMY 37
 
`define TOKENGRID10 (x >= 27 && x <= 30) && (y >= 34 && y <= 37)
`define TOKENGRID10LEFTX   27
`define TOKENGRID10RIGHTX  30
`define TOKENGRID10TOPY    34
`define TOKENGRID10BOTTOMY 37
 
`define TOKENGRID11 (x >= 23 && x <= 26) && (y >= 34 && y <= 37)
`define TOKENGRID11LEFTX   23
`define TOKENGRID11RIGHTX  26
`define TOKENGRID11TOPY    34
`define TOKENGRID11BOTTOMY 37
 
`define TOKENGRID12 (x >= 19 && x <= 22) && (y >= 34 && y <= 37)
`define TOKENGRID12LEFTX   19
`define TOKENGRID12RIGHTX  22
`define TOKENGRID12TOPY    34
`define TOKENGRID12BOTTOMY 37
 
`define TOKENGRID13 (x >= 19 && x <= 22) && (y >= 30 && y <= 33)
`define TOKENGRID13LEFTX   19
`define TOKENGRID13RIGHTX  22
`define TOKENGRID13TOPY    30
`define TOKENGRID13BOTTOMY 33
 
`define TOKENGRID14 (x >= 19 && x <= 22) && (y >= 26 && y <= 29)
`define TOKENGRID14LEFTX   19
`define TOKENGRID14RIGHTX  22
`define TOKENGRID14TOPY    26
`define TOKENGRID14BOTTOMY 29
 
`define TOKENGRID15 (x >= 23 && x <= 26) && (y >= 26 && y <= 29)
`define TOKENGRID15LEFTX   23
`define TOKENGRID15RIGHTX  26
`define TOKENGRID15TOPY    26
`define TOKENGRID15BOTTOMY 29
 
`define TOKENGRID16 (x >= 27 && x <= 30) && (y >= 26 && y <= 29)
`define TOKENGRID16LEFTX   27
`define TOKENGRID16RIGHTX  30
`define TOKENGRID16TOPY    26
`define TOKENGRID16BOTTOMY 29
 
`define TOKENGRID17 (x >= 31 && x <= 34) && (y >= 26 && y <= 29)
`define TOKENGRID17LEFTX   31
`define TOKENGRID17RIGHTX  34
`define TOKENGRID17TOPY    26
`define TOKENGRID17BOTTOMY 29
 
`define TOKENGRID18 (x >= 35 && x <= 38) && (y >= 26 && y <= 29)
`define TOKENGRID18LEFTX   35
`define TOKENGRID18RIGHTX  38
`define TOKENGRID18TOPY    26
`define TOKENGRID18BOTTOMY 29
 
`define TOKENGRID19 (x >= 39 && x <= 42) && (y >= 26 && y <= 29)
`define TOKENGRID19LEFTX   39
`define TOKENGRID19RIGHTX  42
`define TOKENGRID19TOPY    26
`define TOKENGRID19BOTTOMY 29
 
`define TOKENGRID20 (x >= 43 && x <= 46) && (y >= 26 && y <= 29)
`define TOKENGRID20LEFTX   43
`define TOKENGRID20RIGHTX  46
`define TOKENGRID20TOPY    26
`define TOKENGRID20BOTTOMY 29
 
`define TOKENGRID21 (x >= 43 && x <= 46) && (y >= 22 && y <= 25)
`define TOKENGRID21LEFTX   43
`define TOKENGRID21RIGHTX  46
`define TOKENGRID21TOPY    22
`define TOKENGRID21BOTTOMY 25
 
`define TOKENGRID22 (x >= 43 && x <= 46) && (y >= 18 && y <= 21)
`define TOKENGRID22LEFTX   43
`define TOKENGRID22RIGHTX  46
`define TOKENGRID22TOPY    18
`define TOKENGRID22BOTTOMY 21
 
`define TOKENGRID23 (x >= 43 && x <= 46) && (y >= 14 && y <= 17)
`define TOKENGRID23LEFTX   43
`define TOKENGRID23RIGHTX  46
`define TOKENGRID23TOPY    14
`define TOKENGRID23BOTTOMY 17
 
`define TOKENGRID24 (x >= 43 && x <= 46) && (y >= 10 && y <= 13)
`define TOKENGRID24LEFTX   43
`define TOKENGRID24RIGHTX  46
`define TOKENGRID24TOPY    10
`define TOKENGRID24BOTTOMY 13
 
`define TOKENGRID25 (x >= 43 && x <= 46) && (y >=  6 && y <=  9)
`define TOKENGRID25LEFTX   43
`define TOKENGRID25RIGHTX  46
`define TOKENGRID25TOPY     6
`define TOKENGRID25BOTTOMY  9
 
`define TOKENGRID26 (x >= 43 && x <= 46) && (y >=  2 && y <=  5)
`define TOKENGRID26LEFTX   43
`define TOKENGRID26RIGHTX  46
`define TOKENGRID26TOPY     2
`define TOKENGRID26BOTTOMY  5
 
`define TOKENGRID27 (x >= 47 && x <= 50) && (y >=  2 && y <=  5)
`define TOKENGRID27LEFTX   47
`define TOKENGRID27RIGHTX  50
`define TOKENGRID27TOPY     2
`define TOKENGRID27BOTTOMY  5
 
`define TOKENGRID28 (x >= 51 && x <= 54) && (y >=  2 && y <=  5)
`define TOKENGRID28LEFTX   51
`define TOKENGRID28RIGHTX  54
`define TOKENGRID28TOPY     2
`define TOKENGRID28BOTTOMY  5
 
`define TOKENGRID29 (x >= 51 && x <= 54) && (y >=  6 && y <=  9)
`define TOKENGRID29LEFTX   51
`define TOKENGRID29RIGHTX  54
`define TOKENGRID29TOPY     6
`define TOKENGRID29BOTTOMY  9
 
`define TOKENGRID30 (x >= 51 && x <= 54) && (y >= 10 && y <= 13)
`define TOKENGRID30LEFTX   51
`define TOKENGRID30RIGHTX  54
`define TOKENGRID30TOPY    10
`define TOKENGRID30BOTTOMY 13
 
`define TOKENGRID31 (x >= 51 && x <= 54) && (y >= 14 && y <= 17)
`define TOKENGRID31LEFTX   51
`define TOKENGRID31RIGHTX  54
`define TOKENGRID31TOPY    14
`define TOKENGRID31BOTTOMY 17
 
`define TOKENGRID32 (x >= 51 && x <= 54) && (y >= 18 && y <= 21)
`define TOKENGRID32LEFTX   51
`define TOKENGRID32RIGHTX  54
`define TOKENGRID32TOPY    18
`define TOKENGRID32BOTTOMY 21
 
`define TOKENGRID33 (x >= 51 && x <= 54) && (y >= 22 && y <= 25)
`define TOKENGRID33LEFTX   51
`define TOKENGRID33RIGHTX  54
`define TOKENGRID33TOPY    22
`define TOKENGRID33BOTTOMY 25
 
`define TOKENGRID34 (x >= 51 && x <= 54) && (y >= 26 && y <= 29)
`define TOKENGRID34LEFTX   51
`define TOKENGRID34RIGHTX  54
`define TOKENGRID34TOPY    26
`define TOKENGRID34BOTTOMY 29
 
`define TOKENGRID35 (x >= 55 && x <= 58) && (y >= 26 && y <= 29)
`define TOKENGRID35LEFTX   55
`define TOKENGRID35RIGHTX  58
`define TOKENGRID35TOPY    26
`define TOKENGRID35BOTTOMY 29
 
`define TOKENGRID36 (x >= 59 && x <= 62) && (y >= 26 && y <= 29)
`define TOKENGRID36LEFTX   59
`define TOKENGRID36RIGHTX  62
`define TOKENGRID36TOPY    26
`define TOKENGRID36BOTTOMY 29
 
`define TOKENGRID37 (x >= 63 && x <= 66) && (y >= 26 && y <= 29)
`define TOKENGRID37LEFTX   63
`define TOKENGRID37RIGHTX  66
`define TOKENGRID37TOPY    26
`define TOKENGRID37BOTTOMY 29
 
`define TOKENGRID38 (x >= 67 && x <= 70) && (y >= 26 && y <= 29)
`define TOKENGRID38LEFTX   67
`define TOKENGRID38RIGHTX  70
`define TOKENGRID38TOPY    26
`define TOKENGRID38BOTTOMY 29
 
`define TOKENGRID39 (x >= 71 && x <= 74) && (y >= 26 && y <= 29)
`define TOKENGRID39LEFTX   71
`define TOKENGRID39RIGHTX  74
`define TOKENGRID39TOPY    26
`define TOKENGRID39BOTTOMY 29
 
`define TOKENGRID40 (x >= 75 && x <= 78) && (y >= 26 && y <= 29)
`define TOKENGRID40LEFTX   75
`define TOKENGRID40RIGHTX  78
`define TOKENGRID40TOPY    26
`define TOKENGRID40BOTTOMY 29
 
`define TOKENGRID41 (x >= 75 && x <= 78) && (y >= 30 && y <= 33)
`define TOKENGRID41LEFTX   75
`define TOKENGRID41RIGHTX  78
`define TOKENGRID41TOPY    30
`define TOKENGRID41BOTTOMY 33
 
`define TOKENGRID42 (x >= 75 && x <= 78) && (y >= 34 && y <= 37)
`define TOKENGRID42LEFTX   75
`define TOKENGRID42RIGHTX  78
`define TOKENGRID42TOPY    34
`define TOKENGRID42BOTTOMY 37
 
`define TOKENGRID43 (x >= 71 && x <= 74) && (y >= 34 && y <= 37)
`define TOKENGRID43LEFTX   71
`define TOKENGRID43RIGHTX  74
`define TOKENGRID43TOPY    34
`define TOKENGRID43BOTTOMY 37
 
`define TOKENGRID44 (x >= 67 && x <= 70) && (y >= 34 && y <= 37)
`define TOKENGRID44LEFTX   67
`define TOKENGRID44RIGHTX  70
`define TOKENGRID44TOPY    34
`define TOKENGRID44BOTTOMY 37
 
`define TOKENGRID45 (x >= 63 && x <= 66) && (y >= 34 && y <= 37)
`define TOKENGRID45LEFTX   63
`define TOKENGRID45RIGHTX  66
`define TOKENGRID45TOPY    34
`define TOKENGRID45BOTTOMY 37
 
`define TOKENGRID46 (x >= 59 && x <= 62) && (y >= 34 && y <= 37)
`define TOKENGRID46LEFTX   59
`define TOKENGRID46RIGHTX  62
`define TOKENGRID46TOPY    34
`define TOKENGRID46BOTTOMY 37
 
`define TOKENGRID47 (x >= 55 && x <= 58) && (y >= 34 && y <= 37)
`define TOKENGRID47LEFTX   55
`define TOKENGRID47RIGHTX  58
`define TOKENGRID47TOPY    34
`define TOKENGRID47BOTTOMY 37
 
`define TOKENGRID48 (x >= 51 && x <= 54) && (y >= 34 && y <= 37)
`define TOKENGRID48LEFTX   51
`define TOKENGRID48RIGHTX  54
`define TOKENGRID48TOPY    34
`define TOKENGRID48BOTTOMY 37
 
`define TOKENGRID49 (x >= 51 && x <= 54) && (y >= 38 && y <= 41)
`define TOKENGRID49LEFTX   51
`define TOKENGRID49RIGHTX  54
`define TOKENGRID49TOPY    38
`define TOKENGRID49BOTTOMY 41
 
`define TOKENGRID50 (x >= 51 && x <= 54) && (y >= 42 && y <= 45)
`define TOKENGRID50LEFTX   51
`define TOKENGRID50RIGHTX  54
`define TOKENGRID50TOPY    42
`define TOKENGRID50BOTTOMY 45
 
`define TOKENGRID51 (x >= 51 && x <= 54) && (y >= 46 && y <= 49)
`define TOKENGRID51LEFTX   51
`define TOKENGRID51RIGHTX  54
`define TOKENGRID51TOPY    46
`define TOKENGRID51BOTTOMY 49
 
`define TOKENGRID52 (x >= 51 && x <= 54) && (y >= 50 && y <= 53)
`define TOKENGRID52LEFTX   51
`define TOKENGRID52RIGHTX  54
`define TOKENGRID52TOPY    50
`define TOKENGRID52BOTTOMY 53
 
`define TOKENGRID53 (x >= 51 && x <= 54) && (y >= 54 && y <= 57)
`define TOKENGRID53LEFTX   51
`define TOKENGRID53RIGHTX  54
`define TOKENGRID53TOPY    54
`define TOKENGRID53BOTTOMY 57
 
`define TOKENGRID54 (x >= 51 && x <= 54) && (y >= 58 && y <= 61)
`define TOKENGRID54LEFTX   51
`define TOKENGRID54RIGHTX  54
`define TOKENGRID54TOPY    58
`define TOKENGRID54BOTTOMY 61
 
`define TOKENGRID55 (x >= 47 && x <= 50) && (y >= 58 && y <= 61)
`define TOKENGRID55LEFTX   47
`define TOKENGRID55RIGHTX  50
`define TOKENGRID55TOPY    58
`define TOKENGRID55BOTTOMY 61
 
`define TOKENGRID56 (x >= 43 && x <= 46) && (y >= 58 && y <= 61)
`define TOKENGRID56LEFTX   43
`define TOKENGRID56RIGHTX  46
`define TOKENGRID56TOPY    58
`define TOKENGRID56BOTTOMY 61
 
`define TOKENGRID57 (x >= 47 && x <= 50) && (y >= 54 && y <= 57)
`define TOKENGRID57LEFTX   47
`define TOKENGRID57RIGHTX  50
`define TOKENGRID57TOPY    54
`define TOKENGRID57BOTTOMY 57
 
`define TOKENGRID58 (x >= 47 && x <= 50) && (y >= 50 && y <= 53)
`define TOKENGRID58LEFTX   47
`define TOKENGRID58RIGHTX  50
`define TOKENGRID58TOPY    50
`define TOKENGRID58BOTTOMY 53
 
`define TOKENGRID59 (x >= 47 && x <= 50) && (y >= 46 && y <= 49)
`define TOKENGRID59LEFTX   47
`define TOKENGRID59RIGHTX  50
`define TOKENGRID59TOPY    46
`define TOKENGRID59BOTTOMY 49
 
`define TOKENGRID60 (x >= 47 && x <= 50) && (y >= 42 && y <= 45)
`define TOKENGRID60LEFTX   47
`define TOKENGRID60RIGHTX  50
`define TOKENGRID60TOPY    42
`define TOKENGRID60BOTTOMY 45
 
`define TOKENGRID61 (x >= 47 && x <= 50) && (y >= 38 && y <= 41)
`define TOKENGRID61LEFTX   47
`define TOKENGRID61RIGHTX  50
`define TOKENGRID61TOPY    38
`define TOKENGRID61BOTTOMY 41
 
`define TOKENGRID62 (x >= 47 && x <= 50) && (y >= 34 && y <= 37)
`define TOKENGRID62LEFTX   47
`define TOKENGRID62RIGHTX  50
`define TOKENGRID62TOPY    34
`define TOKENGRID62BOTTOMY 37
 
`define TOKENGRID63 (x >= 23 && x <= 26) && (y >= 30 && y <= 33)
`define TOKENGRID63LEFTX   23
`define TOKENGRID63RIGHTX  26
`define TOKENGRID63TOPY    30
`define TOKENGRID63BOTTOMY 33

`define TOKENGRID64 (x >= 27 && x <= 30) && (y >= 30 && y <= 33)
`define TOKENGRID64LEFTX   27
`define TOKENGRID64RIGHTX  30
`define TOKENGRID64TOPY    30
`define TOKENGRID64BOTTOMY 33

`define TOKENGRID65 (x >= 31 && x <= 34) && (y >= 30 && y <= 33)
`define TOKENGRID65LEFTX   31
`define TOKENGRID65RIGHTX  34
`define TOKENGRID65TOPY    30
`define TOKENGRID65BOTTOMY 33

`define TOKENGRID66 (x >= 35 && x <= 38) && (y >= 30 && y <= 33)
`define TOKENGRID66LEFTX   35
`define TOKENGRID66RIGHTX  38
`define TOKENGRID66TOPY    30
`define TOKENGRID66BOTTOMY 33

`define TOKENGRID67 (x >= 39 && x <= 42) && (y >= 30 && y <= 33)
`define TOKENGRID67LEFTX   39
`define TOKENGRID67RIGHTX  42
`define TOKENGRID67TOPY    30
`define TOKENGRID67BOTTOMY 33

`define TOKENGRID68 (x >= 43 && x <= 46) && (y >= 30 && y <= 33)
`define TOKENGRID68LEFTX   43
`define TOKENGRID68RIGHTX  46
`define TOKENGRID68TOPY    30
`define TOKENGRID68BOTTOMY 33

`define TOKENGRID69 (x >= 47 && x <= 50) && (y >=  6 && y <=  9)
`define TOKENGRID69LEFTX   47
`define TOKENGRID69RIGHTX  50
`define TOKENGRID69TOPY     6
`define TOKENGRID69BOTTOMY  9

`define TOKENGRID70 (x >= 47 && x <= 50) && (y >= 10 && y <= 13)
`define TOKENGRID70LEFTX   47
`define TOKENGRID70RIGHTX  50
`define TOKENGRID70TOPY    10
`define TOKENGRID70BOTTOMY 13

`define TOKENGRID71 (x >= 47 && x <= 50) && (y >= 14 && y <= 17)
`define TOKENGRID71LEFTX   47
`define TOKENGRID71RIGHTX  50
`define TOKENGRID71TOPY    14
`define TOKENGRID71BOTTOMY 17

`define TOKENGRID72 (x >= 47 && x <= 50) && (y >= 18 && y <= 21)
`define TOKENGRID72LEFTX   47
`define TOKENGRID72RIGHTX  50
`define TOKENGRID72TOPY    18
`define TOKENGRID72BOTTOMY 21

`define TOKENGRID73 (x >= 47 && x <= 50) && (y >= 22 && y <= 25)
`define TOKENGRID73LEFTX   47
`define TOKENGRID73RIGHTX  50
`define TOKENGRID73TOPY    22
`define TOKENGRID73BOTTOMY 25

`define TOKENGRID74 (x >= 47 && x <= 50) && (y >= 26 && y <= 29)
`define TOKENGRID74LEFTX   47
`define TOKENGRID74RIGHTX  50
`define TOKENGRID74TOPY    26
`define TOKENGRID74BOTTOMY 29

`define TOKENGRID75 (x >= 71 && x <= 74) && (y >= 30 && y <= 33)
`define TOKENGRID75LEFTX   71
`define TOKENGRID75RIGHTX  74
`define TOKENGRID75TOPY    30
`define TOKENGRID75BOTTOMY 33

`define TOKENGRID76 (x >= 67 && x <= 70) && (y >= 30 && y <= 33)
`define TOKENGRID76LEFTX   67
`define TOKENGRID76RIGHTX  70
`define TOKENGRID76TOPY    30
`define TOKENGRID76BOTTOMY 33

`define TOKENGRID77 (x >= 63 && x <= 66) && (y >= 30 && y <= 33)
`define TOKENGRID77LEFTX   63
`define TOKENGRID77RIGHTX  66
`define TOKENGRID77TOPY    30
`define TOKENGRID77BOTTOMY 33

`define TOKENGRID78 (x >= 59 && x <= 62) && (y >= 30 && y <= 33)
`define TOKENGRID78LEFTX   59
`define TOKENGRID78RIGHTX  62
`define TOKENGRID78TOPY    30
`define TOKENGRID78BOTTOMY 33

`define TOKENGRID79 (x >= 55 && x <= 58) && (y >= 30 && y <= 33)
`define TOKENGRID79LEFTX   55
`define TOKENGRID79RIGHTX  58
`define TOKENGRID79TOPY    30
`define TOKENGRID79BOTTOMY 33

`define TOKENGRID80 (x >= 51 && x <= 54) && (y >= 30 && y <= 33)
`define TOKENGRID80LEFTX   51
`define TOKENGRID80RIGHTX  54
`define TOKENGRID80TOPY    30
`define TOKENGRID80BOTTOMY 33

`define TOKENGRIDWIN (x >= 47 && x <= 50) && (y >= 30 && y <= 33)
`define TOKENGRIDWINLEFTX   47
`define TOKENGRIDWINRIGHTX  50
`define TOKENGRIDWINTOPY    30
`define TOKENGRIDWINBOTTOMY 33

`define TOKENREDHOME (x >= 29 && x <= 32) && (y >= 49 && y <= 52)
`define TOKENREDLEFTX   29
`define TOKENREDRIGHTX  32
`define TOKENREDTOPY    49
`define TOKENREDBOTTOMY 52

`define TOKENGREENHOME (x >= 29 && x <= 32) && (y >= 13 && y <= 16)
`define TOKENGREENLEFTX   29
`define TOKENGREENRIGHTX  32
`define TOKENGREENTOPY    13
`define TOKENGREENBOTTOMY 16

`define TOKENYELLOWHOME (x >= 65 && x <= 68) && (y >= 13 && y <= 16)
`define TOKENYELLOWLEFTX   65
`define TOKENYELLOWRIGHTX  68
`define TOKENYELLOWTOPY    13
`define TOKENYELLOWBOTTOMY 16

`define TOKENBLUEHOME (x >= 65 && x <= 68) && (y >= 49 && y <= 52)
`define TOKENBLUELEFTX   65
`define TOKENBLUERIGHTX  68
`define TOKENBLUETOPY    49
`define TOKENBLUEBOTTOMY 52

// NOTE: This module is for player 1, who is RED.
module player1_movementFSM(input moveFlag1,
                           input clk4hz,
                           input p1_doubleDiceSelected, p1_doubleJumpSelected,
                           input winMoveFlag, player1_lefthome, p1_rolledDice, p1_forceEnd, 
                           input [3:0] p1_diceroll,
                           input [7:0] player2_leftX, player3_leftX, player4_leftX, player2_rightX, player3_rightX, player4_rightX, 
                           input [6:0] player2_topY, player3_topY, player4_topY, player2_bottomY, player3_bottomY, player4_bottomY,
                           input p1killedByp2, p1killedByp3, p1killedByp4,
                           output reg p2killed = 0, p3killed = 0, p4killed = 0, 
                           output reg p1Win = 0,
                           output reg isMoving = 0, output reg inWinningColumn = 0,
                           output reg [3:0] requiredSteps = 7,
                           output reg [7:0] player_leftX = `TOKENREDLEFTX, player_rightX = `TOKENREDRIGHTX,
                           output reg [6:0] player_topY = `TOKENREDTOPY, player_bottomY = `TOKENREDBOTTOMY);
                           
    // state variables 
    parameter IDLE     = 2'b00;
    parameter GET_DICE = 2'b01;
    parameter MOVING   = 2'b10;
    parameter TURN_END = 2'b11;
    
    reg doubleDiceActivated = 0;
    reg doubleDiceCheck = 0;
    reg doubleJumpActivated = 0;
    reg doubleJumpCheck = 0;
    reg leftHomeCheck = 0;
    reg startedMovingThisTurn = 0;
    reg [1:0] state = IDLE;
    reg [5:0] player1pos_counter = 0;
    reg [3:0] diceroll_value = 0;
    
    always @ (posedge clk4hz) 
    begin   
    
        if (player1_lefthome & ~leftHomeCheck) begin 
            player1pos_counter <= 1;
            leftHomeCheck <= 1;
            diceroll_value <= 0;
        end 
        
        if (p1killedByp2 | p1killedByp3 | p1killedByp4) begin 
            player1pos_counter = 0;
            leftHomeCheck = 0;
        end 
        
        case (state) 
            
            IDLE: begin 
                isMoving <= 0;
                diceroll_value <= 0;
                startedMovingThisTurn <= 0;
                p2killed <= 0;
                p3killed <= 0;
                p4killed <= 0; 
                
                if (p1_rolledDice) begin 
                    state <= GET_DICE;
                end else begin 
                    state <= IDLE;
                end 
            end 
            
            GET_DICE: begin 
                if (p1_forceEnd) begin 
                    diceroll_value <= 0;
                    state <= TURN_END;
                end else if (p1_doubleDiceSelected && ~doubleDiceCheck) begin
                    doubleDiceActivated <= 1;
                    doubleDiceCheck <= 1;
                end else if (p1_doubleJumpSelected && ~doubleJumpCheck) begin
                    doubleJumpActivated <= 1;
                    doubleJumpCheck <= 1;
                end else if (moveFlag1) begin 
                    if (doubleJumpActivated) begin
                        diceroll_value <= p1_diceroll * 2;
                    end else begin
                        diceroll_value <= p1_diceroll;
                    end
                    state <= MOVING;
                end else begin
                    state <= GET_DICE;
                end
            end 
            
            MOVING: begin 
                if (p1_forceEnd | ~player1_lefthome) begin 
                    state <= TURN_END; 
                end else if (inWinningColumn) begin 
                    if (1) begin
                        if (winMoveFlag & ~startedMovingThisTurn) begin 
                            if (diceroll_value > 0) begin 
                                isMoving <= 1;
                                diceroll_value <= diceroll_value - 1;
                                startedMovingThisTurn <= 1;
                                    
                                if (player1pos_counter < 63) begin 
                                    player1pos_counter <= player1pos_counter + 1;
                                end 
                                    
                                state <= MOVING; 
                            end else begin  
                                
                                state <= TURN_END;
                            end 
                        end else if (startedMovingThisTurn) begin 
                            if (diceroll_value > 0) begin 
                                isMoving <= 1;
                                diceroll_value <= diceroll_value - 1;
                                startedMovingThisTurn <= 1;
                                    
                                if (player1pos_counter < 63) begin 
                                    player1pos_counter <= player1pos_counter + 1;
                                end 
                                    
                                state <= MOVING;
                            end else begin 
                                isMoving <= 0;
                                state <= TURN_END;
                            end 
                        end else begin ;
                            state <= MOVING;
                        end 
                    end 
                end else begin 
                    if (diceroll_value > 0) begin 
                        isMoving <= 1;
                        diceroll_value <= diceroll_value - 1;
                        startedMovingThisTurn <= 1;
                            
                        if (player1pos_counter < 63) begin 
                            player1pos_counter <= player1pos_counter + 1;
                        end 
                            
                        state <= MOVING; 
                    end else begin  
                        isMoving <= 0;
                        state <= TURN_END;
                    end 
                end 
            end 
            
            TURN_END: begin 
                startedMovingThisTurn <= 0;
                doubleJumpActivated <= 0;
                
                // check win state
                if (player1pos_counter == 62) begin
                    p1Win <= 1;
                end else begin  
                    p1Win <= 0;
                end
                
                // check for collision
                if ( player_leftX == player2_leftX  &&    player_topY == player2_topY &&
                    player_rightX == player2_rightX && player_bottomY == player2_bottomY) begin 
                    // player 1 is on player 2's spot, set kill flag for player 2
                    p2killed <= 1;
                end else if ( player_leftX == player3_leftX  &&    player_topY == player3_topY &&
                             player_rightX == player3_rightX && player_bottomY == player3_bottomY) begin 
                    // player 1 is on player 3's spot, set kill flag for player 3
                    p3killed <= 1;
                end else if (player_leftX == player4_leftX  &&    player_topY == player4_topY &&
                            player_rightX == player4_rightX && player_bottomY == player4_bottomY) begin 
                    // player 1 is on player 4's spot, set kill flag for player 4
                    p4killed <= 1;
                end else begin
                    p2killed <= 0;
                    p3killed <= 0;
                    p4killed <= 0;
                end 
                
                // this needs to loop back to GET_DICE state
                if (doubleDiceActivated) begin
                    doubleDiceActivated <= 0;
                    state <= GET_DICE;
                end else begin
                    state <= IDLE;
                end
            end 
            
            default: begin 
                state <= IDLE;
            end 
        
        endcase 
        
        // position definition for token RED.
        case (player1pos_counter)
            0: begin // HOME POSITION, GRID 82 FOR RED PLAYER 
                player_leftX   <= `TOKENREDLEFTX;
                player_rightX  <= `TOKENREDRIGHTX;
                player_topY    <= `TOKENREDTOPY;
                player_bottomY <= `TOKENREDBOTTOMY;
            end
        
            1: begin 
                player_leftX   <= `TOKENGRID1LEFTX;
                player_rightX  <= `TOKENGRID1RIGHTX;
                player_topY    <= `TOKENGRID1TOPY;
                player_bottomY <= `TOKENGRID1BOTTOMY;
            end
            
            2: begin 
                player_leftX   <= `TOKENGRID2LEFTX;
                player_rightX  <= `TOKENGRID2RIGHTX;
                player_topY    <= `TOKENGRID2TOPY;
                player_bottomY <= `TOKENGRID2BOTTOMY;
            end
        
            3: begin 
                player_leftX   <= `TOKENGRID3LEFTX;
                player_rightX  <= `TOKENGRID3RIGHTX;
                player_topY    <= `TOKENGRID3TOPY;
                player_bottomY <= `TOKENGRID3BOTTOMY;
            end
            
            4: begin 
                player_leftX   <= `TOKENGRID4LEFTX;
                player_rightX  <= `TOKENGRID4RIGHTX;
                player_topY    <= `TOKENGRID4TOPY;
                player_bottomY <= `TOKENGRID4BOTTOMY;
            end
        
            5: begin 
                player_leftX   <= `TOKENGRID5LEFTX;
                player_rightX  <= `TOKENGRID5RIGHTX;
                player_topY    <= `TOKENGRID5TOPY;
                player_bottomY <= `TOKENGRID5BOTTOMY;
            end
            
            6: begin 
                player_leftX   <= `TOKENGRID6LEFTX;
                player_rightX  <= `TOKENGRID6RIGHTX;
                player_topY    <= `TOKENGRID6TOPY;
                player_bottomY <= `TOKENGRID6BOTTOMY;
            end
        
            7: begin 
                player_leftX   <= `TOKENGRID7LEFTX;
                player_rightX  <= `TOKENGRID7RIGHTX;
                player_topY    <= `TOKENGRID7TOPY;
                player_bottomY <= `TOKENGRID7BOTTOMY;
            end
            
            8: begin 
                player_leftX   <= `TOKENGRID8LEFTX;
                player_rightX  <= `TOKENGRID8RIGHTX;
                player_topY    <= `TOKENGRID8TOPY;
                player_bottomY <= `TOKENGRID8BOTTOMY;
            end
        
            9: begin 
                player_leftX   <= `TOKENGRID9LEFTX;
                player_rightX  <= `TOKENGRID9RIGHTX;
                player_topY    <= `TOKENGRID9TOPY;
                player_bottomY <= `TOKENGRID9BOTTOMY;
            end
            
            10: begin 
                player_leftX   <= `TOKENGRID10LEFTX;
                player_rightX  <= `TOKENGRID10RIGHTX;
                player_topY    <= `TOKENGRID10TOPY;
                player_bottomY <= `TOKENGRID10BOTTOMY;
            end
        
            11: begin 
                player_leftX   <= `TOKENGRID11LEFTX;
                player_rightX  <= `TOKENGRID11RIGHTX;
                player_topY    <= `TOKENGRID11TOPY;
                player_bottomY <= `TOKENGRID11BOTTOMY;
            end
            
            12: begin 
                player_leftX   <= `TOKENGRID12LEFTX;
                player_rightX  <= `TOKENGRID12RIGHTX;
                player_topY    <= `TOKENGRID12TOPY;
                player_bottomY <= `TOKENGRID12BOTTOMY;
            end
        
            13: begin 
                player_leftX   <= `TOKENGRID13LEFTX;
                player_rightX  <= `TOKENGRID13RIGHTX;
                player_topY    <= `TOKENGRID13TOPY;
                player_bottomY <= `TOKENGRID13BOTTOMY;
            end
            
            14: begin 
                player_leftX   <= `TOKENGRID14LEFTX;
                player_rightX  <= `TOKENGRID14RIGHTX;
                player_topY    <= `TOKENGRID14TOPY;
                player_bottomY <= `TOKENGRID14BOTTOMY;
            end
        
            15: begin 
                player_leftX   <= `TOKENGRID15LEFTX;
                player_rightX  <= `TOKENGRID15RIGHTX;
                player_topY    <= `TOKENGRID15TOPY;
                player_bottomY <= `TOKENGRID15BOTTOMY;
            end
            
            16: begin 
                player_leftX   <= `TOKENGRID16LEFTX;
                player_rightX  <= `TOKENGRID16RIGHTX;
                player_topY    <= `TOKENGRID16TOPY;
                player_bottomY <= `TOKENGRID16BOTTOMY;
            end
        
            17: begin 
                player_leftX   <= `TOKENGRID17LEFTX;
                player_rightX  <= `TOKENGRID17RIGHTX;
                player_topY    <= `TOKENGRID17TOPY;
                player_bottomY <= `TOKENGRID17BOTTOMY;
            end
            
            18: begin 
                player_leftX   <= `TOKENGRID18LEFTX;
                player_rightX  <= `TOKENGRID18RIGHTX;
                player_topY    <= `TOKENGRID18TOPY;
                player_bottomY <= `TOKENGRID18BOTTOMY;
            end
        
            19: begin 
                player_leftX   <= `TOKENGRID19LEFTX;
                player_rightX  <= `TOKENGRID19RIGHTX;
                player_topY    <= `TOKENGRID19TOPY;
                player_bottomY <= `TOKENGRID19BOTTOMY;
            end
            
            20: begin 
                player_leftX   <= `TOKENGRID20LEFTX;
                player_rightX  <= `TOKENGRID20RIGHTX;
                player_topY    <= `TOKENGRID20TOPY;
                player_bottomY <= `TOKENGRID20BOTTOMY;
            end
        
            21: begin 
                player_leftX   <= `TOKENGRID21LEFTX;
                player_rightX  <= `TOKENGRID21RIGHTX;
                player_topY    <= `TOKENGRID21TOPY;
                player_bottomY <= `TOKENGRID21BOTTOMY;
            end
            
            22: begin 
                player_leftX   <= `TOKENGRID22LEFTX;
                player_rightX  <= `TOKENGRID22RIGHTX;
                player_topY    <= `TOKENGRID22TOPY;
                player_bottomY <= `TOKENGRID22BOTTOMY;
            end
        
            23: begin 
                player_leftX   <= `TOKENGRID23LEFTX;
                player_rightX  <= `TOKENGRID23RIGHTX;
                player_topY    <= `TOKENGRID23TOPY;
                player_bottomY <= `TOKENGRID23BOTTOMY;
            end
            
            24: begin 
                player_leftX   <= `TOKENGRID24LEFTX;
                player_rightX  <= `TOKENGRID24RIGHTX;
                player_topY    <= `TOKENGRID24TOPY;
                player_bottomY <= `TOKENGRID24BOTTOMY;
            end
        
            25: begin 
                player_leftX   <= `TOKENGRID25LEFTX;
                player_rightX  <= `TOKENGRID25RIGHTX;
                player_topY    <= `TOKENGRID25TOPY;
                player_bottomY <= `TOKENGRID25BOTTOMY;
            end
            
            26: begin 
                player_leftX   <= `TOKENGRID26LEFTX;
                player_rightX  <= `TOKENGRID26RIGHTX;
                player_topY    <= `TOKENGRID26TOPY;
                player_bottomY <= `TOKENGRID26BOTTOMY;
            end
        
            27: begin 
                player_leftX   <= `TOKENGRID27LEFTX;
                player_rightX  <= `TOKENGRID27RIGHTX;
                player_topY    <= `TOKENGRID27TOPY;
                player_bottomY <= `TOKENGRID27BOTTOMY;
            end
            
            28: begin 
                player_leftX   <= `TOKENGRID28LEFTX;
                player_rightX  <= `TOKENGRID28RIGHTX;
                player_topY    <= `TOKENGRID28TOPY;
                player_bottomY <= `TOKENGRID28BOTTOMY;
            end
        
            29: begin 
                player_leftX   <= `TOKENGRID29LEFTX;
                player_rightX  <= `TOKENGRID29RIGHTX;
                player_topY    <= `TOKENGRID29TOPY;
                player_bottomY <= `TOKENGRID29BOTTOMY;
            end
            
            30: begin 
                player_leftX   <= `TOKENGRID30LEFTX;
                player_rightX  <= `TOKENGRID30RIGHTX;
                player_topY    <= `TOKENGRID30TOPY;
                player_bottomY <= `TOKENGRID30BOTTOMY;
            end
        
            31: begin 
                player_leftX   <= `TOKENGRID31LEFTX;
                player_rightX  <= `TOKENGRID31RIGHTX;
                player_topY    <= `TOKENGRID31TOPY;
                player_bottomY <= `TOKENGRID31BOTTOMY;
            end
            
            32: begin 
                player_leftX   <= `TOKENGRID32LEFTX;
                player_rightX  <= `TOKENGRID32RIGHTX;
                player_topY    <= `TOKENGRID32TOPY;
                player_bottomY <= `TOKENGRID32BOTTOMY;
            end
        
            33: begin 
                player_leftX   <= `TOKENGRID33LEFTX;
                player_rightX  <= `TOKENGRID33RIGHTX;
                player_topY    <= `TOKENGRID33TOPY;
                player_bottomY <= `TOKENGRID33BOTTOMY;
            end
            
            34: begin 
                player_leftX   <= `TOKENGRID34LEFTX;
                player_rightX  <= `TOKENGRID34RIGHTX;
                player_topY    <= `TOKENGRID34TOPY;
                player_bottomY <= `TOKENGRID34BOTTOMY;
            end
        
            35: begin 
                player_leftX   <= `TOKENGRID35LEFTX;
                player_rightX  <= `TOKENGRID35RIGHTX;
                player_topY    <= `TOKENGRID35TOPY;
                player_bottomY <= `TOKENGRID35BOTTOMY;
            end
            
            36: begin 
                player_leftX   <= `TOKENGRID36LEFTX;
                player_rightX  <= `TOKENGRID36RIGHTX;
                player_topY    <= `TOKENGRID36TOPY;
                player_bottomY <= `TOKENGRID36BOTTOMY;
            end
        
            37: begin 
                player_leftX   <= `TOKENGRID37LEFTX;
                player_rightX  <= `TOKENGRID37RIGHTX;
                player_topY    <= `TOKENGRID37TOPY;
                player_bottomY <= `TOKENGRID37BOTTOMY;
            end
            
            38: begin 
                player_leftX   <= `TOKENGRID38LEFTX;
                player_rightX  <= `TOKENGRID38RIGHTX;
                player_topY    <= `TOKENGRID38TOPY;
                player_bottomY <= `TOKENGRID38BOTTOMY;
            end
        
            39: begin 
                player_leftX   <= `TOKENGRID39LEFTX;
                player_rightX  <= `TOKENGRID39RIGHTX;
                player_topY    <= `TOKENGRID39TOPY;
                player_bottomY <= `TOKENGRID39BOTTOMY;
            end
            
            40: begin 
                player_leftX   <= `TOKENGRID40LEFTX;
                player_rightX  <= `TOKENGRID40RIGHTX;
                player_topY    <= `TOKENGRID40TOPY;
                player_bottomY <= `TOKENGRID40BOTTOMY;
            end
        
            41: begin 
                player_leftX   <= `TOKENGRID41LEFTX;
                player_rightX  <= `TOKENGRID41RIGHTX;
                player_topY    <= `TOKENGRID41TOPY;
                player_bottomY <= `TOKENGRID41BOTTOMY;
            end 
            
            42: begin 
                player_leftX   <= `TOKENGRID42LEFTX;
                player_rightX  <= `TOKENGRID42RIGHTX;
                player_topY    <= `TOKENGRID42TOPY;
                player_bottomY <= `TOKENGRID42BOTTOMY;
            end
        
            43: begin 
                player_leftX   <= `TOKENGRID43LEFTX;
                player_rightX  <= `TOKENGRID43RIGHTX;
                player_topY    <= `TOKENGRID43TOPY;
                player_bottomY <= `TOKENGRID43BOTTOMY;
            end
            
            44: begin 
                player_leftX   <= `TOKENGRID44LEFTX;
                player_rightX  <= `TOKENGRID44RIGHTX;
                player_topY    <= `TOKENGRID44TOPY;
                player_bottomY <= `TOKENGRID44BOTTOMY;
            end
        
            45: begin 
                player_leftX   <= `TOKENGRID45LEFTX;
                player_rightX  <= `TOKENGRID45RIGHTX;
                player_topY    <= `TOKENGRID45TOPY;
                player_bottomY <= `TOKENGRID45BOTTOMY;
            end
            
            46: begin 
                player_leftX   <= `TOKENGRID46LEFTX;
                player_rightX  <= `TOKENGRID46RIGHTX;
                player_topY    <= `TOKENGRID46TOPY;
                player_bottomY <= `TOKENGRID46BOTTOMY;
            end
        
            47: begin 
                player_leftX   <= `TOKENGRID47LEFTX;
                player_rightX  <= `TOKENGRID47RIGHTX;
                player_topY    <= `TOKENGRID47TOPY;
                player_bottomY <= `TOKENGRID47BOTTOMY;
            end
            
            48: begin 
                player_leftX   <= `TOKENGRID48LEFTX;
                player_rightX  <= `TOKENGRID48RIGHTX;
                player_topY    <= `TOKENGRID48TOPY;
                player_bottomY <= `TOKENGRID48BOTTOMY;
            end
        
            49: begin 
                player_leftX   <= `TOKENGRID49LEFTX;
                player_rightX  <= `TOKENGRID49RIGHTX;
                player_topY    <= `TOKENGRID49TOPY;
                player_bottomY <= `TOKENGRID49BOTTOMY;
            end
            
            50: begin 
                player_leftX   <= `TOKENGRID50LEFTX;
                player_rightX  <= `TOKENGRID50RIGHTX;
                player_topY    <= `TOKENGRID50TOPY;
                player_bottomY <= `TOKENGRID50BOTTOMY;
            end
        
            51: begin 
                player_leftX   <= `TOKENGRID51LEFTX;
                player_rightX  <= `TOKENGRID51RIGHTX;
                player_topY    <= `TOKENGRID51TOPY;
                player_bottomY <= `TOKENGRID51BOTTOMY;
            end 
            
            52: begin 
                player_leftX   <= `TOKENGRID52LEFTX;
                player_rightX  <= `TOKENGRID52RIGHTX;
                player_topY    <= `TOKENGRID52TOPY;
                player_bottomY <= `TOKENGRID52BOTTOMY;
            end
        
            53: begin 
                player_leftX   <= `TOKENGRID53LEFTX;
                player_rightX  <= `TOKENGRID53RIGHTX;
                player_topY    <= `TOKENGRID53TOPY;
                player_bottomY <= `TOKENGRID53BOTTOMY;
            end
            
            54: begin 
                player_leftX   <= `TOKENGRID54LEFTX;
                player_rightX  <= `TOKENGRID54RIGHTX;
                player_topY    <= `TOKENGRID54TOPY;
                player_bottomY <= `TOKENGRID54BOTTOMY;
            end
        
            55: begin 
                player_leftX   <= `TOKENGRID55LEFTX;
                player_rightX  <= `TOKENGRID55RIGHTX;
                player_topY    <= `TOKENGRID55TOPY;
                player_bottomY <= `TOKENGRID55BOTTOMY;
            end
            
            56: begin 
                player_leftX   <= `TOKENGRID57LEFTX;
                player_rightX  <= `TOKENGRID57RIGHTX;
                player_topY    <= `TOKENGRID57TOPY;
                player_bottomY <= `TOKENGRID57BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 6;
            end
            
            57: begin 
                player_leftX   <= `TOKENGRID58LEFTX;
                player_rightX  <= `TOKENGRID58RIGHTX;
                player_topY    <= `TOKENGRID58TOPY;
                player_bottomY <= `TOKENGRID58BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 5;
            end
        
            58: begin 
                player_leftX   <= `TOKENGRID59LEFTX;
                player_rightX  <= `TOKENGRID59RIGHTX;
                player_topY    <= `TOKENGRID59TOPY;
                player_bottomY <= `TOKENGRID59BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 4;
            end
            
            59: begin 
                player_leftX   <= `TOKENGRID60LEFTX;
                player_rightX  <= `TOKENGRID60RIGHTX;
                player_topY    <= `TOKENGRID60TOPY;
                player_bottomY <= `TOKENGRID60BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 3;
            end
        
            60: begin 
                player_leftX   <= `TOKENGRID61LEFTX;
                player_rightX  <= `TOKENGRID61RIGHTX;
                player_topY    <= `TOKENGRID61TOPY;
                player_bottomY <= `TOKENGRID61BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 2;
            end
            
            61: begin
                player_leftX   <= `TOKENGRID62LEFTX;
                player_rightX  <= `TOKENGRID62RIGHTX;
                player_topY    <= `TOKENGRID62TOPY;
                player_bottomY <= `TOKENGRID62BOTTOMY;
                inWinningColumn <= 1;
                requiredSteps <= 1;
            end
            
            62: begin
                player_leftX   <= `TOKENGRIDWINLEFTX;
                player_rightX  <= `TOKENGRIDWINRIGHTX;
                player_topY    <= `TOKENGRIDWINTOPY;
                player_bottomY <= `TOKENGRIDWINBOTTOMY;
//                p1Win <= 1;
                requiredSteps <= 0;
            end
        endcase 
    end 
endmodule
