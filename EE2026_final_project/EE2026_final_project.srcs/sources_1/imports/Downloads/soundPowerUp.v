`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2024 20:23:16
// Design Name: 
// Module Name: soundPowerUp
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
module soundPowerUp(
    input CLOCK,
    output [3:0] JXADC);

    reg [11:0] audio_out = 0;
    
    reg generate_signal = 1;
    
    wire clk_526; //1
    wire clk_590; //2
    wire clk_660; //3
    wire clk_780; //4
    wire clk_883; //5
    wire clk_1050; //6
    wire clk_1490; //7
  
        
    wire clk_4Hz;
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
    flexible_clock (CLOCK, 49999999, clk_4Hz);
    
    flexible_clock (CLOCK, 95056, clk_526);
    flexible_clock (CLOCK, 84744, clk_590);
    flexible_clock (CLOCK, 75756, clk_660);
    flexible_clock (CLOCK, 64101, clk_780);
    flexible_clock (CLOCK, 56624, clk_883);
    flexible_clock (CLOCK, 47618, clk_1050);
    flexible_clock (CLOCK, 33556, clk_1490);
    
    soundCounter (clk_4Hz, SOUND_COUNT);
   
    
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
         
     Audio_Output(clk_50MHz, clk_20kHz,audio_out, , 1'b0, JXADC[1], JXADC[2], JXADC[3], JXADC[0],);

endmodule
