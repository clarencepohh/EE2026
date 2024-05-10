`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2024 13:57:30
// Design Name: 
// Module Name: main
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
`define ANODE_OFF   1
`define SEGMENT_OFF 1

module main (input CLOCK, btnc, btnl, btnr, btnu, btnd, 
             input sw0, sw1, sw2, sw3, sw4, sw7, sw8, sw12, sw13, sw14, sw15, 
             output [3:0] JXADC, 
             output [3:0] AN, output [6:0] SEG, 
             output [7:0] JC, 
             output [15:0] LD);

    wire clk6p25mhz, clk25mhz, clk2hz;
    wire frame_begin, sending_pixels, sample_pixel;
    // flag for audio play
    wire soundHappyFlag, soundSadFlag;
    
    wire gameStartFlag, p1ReadyFlag, p2ReadyFlag, p3ReadyFlag, p4ReadyFlag;
    wire p1_diceScreen, p2_diceScreen, p3_diceScreen, p4_diceScreen;
    wire p1Killed, p2Killed, p3Killed, p4Killed, endP1Revive, endP2Revive, endP3Revive, endP4Revive;
    wire [3:0] p1_turn, p2_turn, p3_turn, p4_turn;
    wire p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected;
    wire p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected;
    wire p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected;
    wire p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected;
    wire [15:0] oled_output, oled_gameGrid, p1_oled_dice, p2_oled_dice, p3_oled_dice, p4_oled_dice, oled_dice, oled_powerup;
    wire [15:0] oled_powerup1, oled_powerup2, oled_powerup3, oled_powerup4;
    wire [15:0] startScreenOled, winScreenOled, gameOverOled;
    wire [12:0] pixel_index;
    wire [7:0] x;
    wire [6:0] y;
    wire [6:0] powerup_seg1, powerup_seg2, powerup_seg3, powerup_seg4; 
    wire [3:0] powerup_an1, powerup_an2, powerup_an3, powerup_an4;
    wire [2:0] playerTurn, playerAffected;
    wire p1skipFlag, p2skipFlag, p3skipFlag, p4skipFlag; 
    wire p1winFlag, p2winFlag, p3winFlag, p4winFlag;
    
    reg sound1Playing = 0, sound2Playing = 0;
    
    // clock modules
    flexible_clock clk6p25mhz_module(CLOCK, 7, clk6p25mhz);
    flexible_clock clk25mhz_module (CLOCK, 1, clk25mhz);
    flexible_clock clk2hz_module(CLOCK, 24999999, clk2hz);
    
    // game display and logic modules
    pixel_index_to_cartesian (pixel_index, x, y);
    game_grid (CLOCK, clk6p25mhz, pixel_index, 
               playerAffected, endP1Revive, endP2Revive, endP3Revive, endP4Revive,
               sw0, sw1, sw2, sw3, sw4, sw7, sw12, sw13, sw14, sw15, btnc, btnl, btnu, btnr, btnd,
               x, y, LD, oled_gameGrid, gameStartFlag, p1Killed, p2Killed, p3Killed, p4Killed,
               p1_turn, p2_turn, p3_turn, p4_turn,
               p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected,
               p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected,
               p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected,
               p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected,
               p1winFlag, p2winFlag, p3winFlag, p4winFlag);
               
    // powerup modules
    powerUpMenu p1_powerup (clk25mhz, p1_turn, p1Killed, pixel_index, sw7, btnl, btnr, btnc, btnd,
                            playerAffected, oled_powerup1, endP1Revive, powerup_an1, powerup_seg1,
                            p1_skipSelected, p1_doubleDiceSelected, p1_doubleJumpSelected, p1skipFlag);
                            
    powerUpMenu p2_powerup (clk25mhz, p2_turn, p2Killed, pixel_index, sw7, btnl, btnr, btnc, btnd,
                            playerAffected, oled_powerup2, endP2Revive, powerup_an2, powerup_seg2,  
                            p2_skipSelected, p2_doubleDiceSelected, p2_doubleJumpSelected, p2skipFlag);
                                                    
    powerUpMenu p3_powerup (clk25mhz, p3_turn, p3Killed, pixel_index, sw7, btnl, btnr, btnc, btnd,
                            playerAffected, oled_powerup3, endP3Revive, powerup_an3, powerup_seg3,
                            p3_skipSelected, p3_doubleDiceSelected, p3_doubleJumpSelected, p3skipFlag); 
                            
    powerUpMenu p4_powerup (clk25mhz, p4_turn, p4Killed, pixel_index, sw7, btnl, btnr, btnc, btnd,
                            playerAffected, oled_powerup4, endP4Revive, powerup_an4, powerup_seg4,
                            p4_skipSelected, p4_doubleDiceSelected, p4_doubleJumpSelected, p4skipFlag);
    
    // oled modules
    Oled_Display oled_unit_A (.clk(clk6p25mhz), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels), 
                              .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_output), 
                              .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
                              .pmoden(JC[7]));
                              
    startScreen (CLOCK, pixel_index, p1ReadyFlag, p2ReadyFlag, p3ReadyFlag, p4ReadyFlag, startScreenOled);
    winScreen (CLOCK, pixel_index, winScreenOled);
    gameOverScreen (CLOCK, pixel_index, gameOverOled);
                         
    assign oled_powerup = (p1_turn) ? oled_powerup1 : 
                          (p2_turn) ? oled_powerup2 :
                          (p3_turn) ? oled_powerup3 :
                          (p4_turn) ? oled_powerup4 :
                          16'b1111111111111111;
    
    assign AN = (p1_turn) ? powerup_an1 : 
                (p2_turn) ? powerup_an2 :
                (p3_turn) ? powerup_an3 :
                (p4_turn) ? powerup_an4 :
                 4'b1111;
    
    assign SEG = (p1_turn) ? powerup_seg1 : 
                 (p2_turn) ? powerup_seg2 :
                 (p3_turn) ? powerup_seg3 :
                 (p4_turn) ? powerup_seg4 :
                  7'b1111111;
                      
    assign oled_output = (p1winFlag | p2winFlag | p3winFlag | p4winFlag) ? winScreenOled :
                         (sw7)           ? oled_powerup  :
                         (gameStartFlag) ? oled_gameGrid :
                          startScreenOled;
       
    assign p1ReadyFlag = sw1;
    assign p2ReadyFlag = sw2;
    assign p3ReadyFlag = sw3;
    assign p4ReadyFlag = sw4;
    
    // audio module 
    assign soundHappyFlag = p1_doubleDiceSelected | p1_doubleJumpSelected | p2_doubleDiceSelected | p2_doubleJumpSelected | 
                            p3_doubleDiceSelected | p3_doubleJumpSelected | p4_doubleDiceSelected | p4_doubleJumpSelected ;
    assign soundSadFlag   = p1_skipSelected | p2_skipSelected | p3_skipSelected | p4_skipSelected;
    
    reg [11:0] audio_out = 0;
        
    reg generate_signal = 1;
    
    wire clk_526; //1
    wire clk_590; //2
    wire clk_660; //3
    wire clk_780; //4
    wire clk_883; //5
    wire clk_1050; //6
    wire clk_1490; //7
  
    wire clk_25Hz;
    wire clk_50MHz;
    wire clk_20kHz;

    wire [5:0] SOUND_COUNT;
    
    reg [11:0] audio1 = 0; 
    reg [11:0] audio2 = 0; 
    reg [11:0] audio3 = 0; 
    reg [11:0] audio4 = 0; 
    reg [11:0] audio5 = 0; 
    reg [11:0] audio6 = 0; 
    reg [11:0] audio7 = 0; 
        
    flexible_clock (CLOCK, 1, clk_50MHz);
    flexible_clock (CLOCK, 2499, clk_20kHz);
    flexible_clock (CLOCK, 1999999, clk_25Hz);
    
    flexible_clock (CLOCK, 95056, clk_526);
    flexible_clock (CLOCK, 84744, clk_590);
    flexible_clock (CLOCK, 75756, clk_660);
    flexible_clock (CLOCK, 64101, clk_780);
    flexible_clock (CLOCK, 56624, clk_883);
    flexible_clock (CLOCK, 47618, clk_1050);
    flexible_clock (CLOCK, 33556, clk_1490);
    
    soundCounter (clk_25Hz, SOUND_COUNT);
        
    always @ (posedge CLOCK) begin
    
        case(SOUND_COUNT)
        1: audio_out <= audio1;
        2: audio_out <= 0;
        
        3: audio_out <= audio2;
        4: audio_out <= 0;
        
        5: audio_out <= audio3;
        6: audio_out <= 0;
        
        7: audio_out <= audio4;
        8: audio_out <= 0;
        
        9: audio_out <= audio5;
        10: audio_out <= 0;
        
        11: audio_out <= audio6;  
        12: audio_out <= 0;
        
        13: audio_out <= audio7;   
        14: audio_out <= 0;
           
        endcase              
    end
        
    always @ (posedge clk_526) begin 
        if (generate_signal) begin
            audio1 <= (audio1 == 0) ? 12'b010000000000 : 0;              
        end
    end
    
    always @ (posedge clk_590) begin 
        if (generate_signal) begin
            audio2 <= (audio2 == 0) ? 12'b010000000000 : 0;
        end
    end
    
    always @ (posedge clk_660) begin 
        if (generate_signal) begin
            audio3 <= (audio3 == 0) ? 12'b010000000000 : 0;
        end
    end
    
    always @ (posedge clk_780) begin 
        if (generate_signal) begin
            audio4 <= (audio4 == 0) ? 12'b010000000000 : 0;
        end
    end
    
    always @ (posedge clk_883) begin 
        if (generate_signal) begin
            audio5 <= (audio5 == 0) ? 12'b010000000000 : 0;
        end
    end
    
    always @ (posedge clk_1050) begin 
        if (generate_signal) begin
            audio6 <= (audio6 == 0) ? 12'b010000000000 : 0;
        end
    end
    
    always @ (posedge clk_1490) begin 
        if (generate_signal) begin
            audio7 <= (audio7 == 0) ? 12'b010000000000 : 0;
        end
    end
     
    Audio_Output(clk_50MHz, clk_20kHz, audio_out, 12'b0, 1'b0, JXADC[1], JXADC[2], JXADC[3], JXADC[0],);

endmodule