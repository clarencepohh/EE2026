`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 22:06:37
// Design Name: 
// Module Name: gameOverScreen
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


module gameOverScreen (input CLOCK, 
                       input [12:0] pixel_index, 
                       output reg [15:0] gameOverOled = 16'h07E0);

    wire clk25mhz;

    flexible_clock(CLOCK, 1, clk25mhz);
        
    always @ (posedge clk25mhz) 
    begin

    if (((pixel_index >=    0)  &&  (pixel_index <= 2430)) || ((pixel_index >= 2433)  &&  (pixel_index <= 2435)) || ((pixel_index >= 2438)  &&  (pixel_index <= 2439)) || 
        ((pixel_index >= 2441)  &&  (pixel_index <= 2443)) ||   pixel_index == 2445   || ((pixel_index >= 2450)  &&  (pixel_index <= 2453)) || ((pixel_index >= 2456)  && 
         (pixel_index <= 2457)) || ((pixel_index >= 2459)  &&  (pixel_index <= 2461)) ||   pixel_index == 2463   ||   pixel_index == 2468   || ((pixel_index >= 2472)  && 
         (pixel_index <= 2525)) || ((pixel_index >= 2527)  &&  (pixel_index <= 2530)) || ((pixel_index >= 2532)  &&  (pixel_index <= 2533)) ||   pixel_index == 2535   ||
          pixel_index == 2538   ||   pixel_index == 2541   || ((pixel_index >= 2543)  &&  (pixel_index <= 2548)) || ((pixel_index >= 2550)  &&  (pixel_index <= 2551)) ||
          pixel_index == 2553   || ((pixel_index >= 2555)  &&  (pixel_index <= 2557)) ||   pixel_index == 2559   || ((pixel_index >= 2561)  &&  (pixel_index <= 2564)) || 
        ((pixel_index >= 2566)  &&  (pixel_index <= 2567)) || ((pixel_index >= 2569)  &&  (pixel_index <= 2621)) ||   pixel_index == 2623   ||   pixel_index == 2626   || 
          pixel_index == 2631   ||   pixel_index == 2633   ||   pixel_index == 2635   ||   pixel_index == 2637   || ((pixel_index >= 2641)  &&  (pixel_index <= 2644)) || 
        ((pixel_index >= 2646)  &&  (pixel_index <= 2647)) || ((pixel_index >= 2649)  &&  (pixel_index <= 2650)) ||   pixel_index == 2652   || ((pixel_index >= 2654)  && 
         (pixel_index <= 2655)) || ((pixel_index >= 2659)  &&  (pixel_index <= 2660)) || ((pixel_index >= 2664)  &&  (pixel_index <= 2717)) || ((pixel_index >= 2719)  && 
         (pixel_index <= 2720)) ||   pixel_index == 2722   || ((pixel_index >= 2724)  &&  (pixel_index <= 2725)) ||   pixel_index == 2727   || ((pixel_index >= 2729)  && 
         (pixel_index <= 2731)) ||   pixel_index == 2733   || ((pixel_index >= 2735)  &&  (pixel_index <= 2740)) || ((pixel_index >= 2742)  &&  (pixel_index <= 2743)) || 
        ((pixel_index >= 2745)  &&  (pixel_index <= 2746)) ||   pixel_index == 2748   || ((pixel_index >= 2750)  &&  (pixel_index <= 2751)) || ((pixel_index >= 2753)  && 
         (pixel_index <= 2756)) ||   pixel_index == 2758   || ((pixel_index >= 2760)  &&  (pixel_index <= 2814)) || ((pixel_index >= 2817)  &&  (pixel_index <= 2818)) || 
        ((pixel_index >= 2820)  &&  (pixel_index <= 2821)) ||   pixel_index == 2823   || ((pixel_index >= 2825)  &&  (pixel_index <= 2827)) ||   pixel_index == 2829   || 
        ((pixel_index >= 2834)  &&  (pixel_index <= 2837)) || ((pixel_index >= 2840)  &&  (pixel_index <= 2843)) || ((pixel_index >= 2845)  &&  (pixel_index <= 2847)) || 
          pixel_index == 2852   || ((pixel_index >= 2854)  &&  (pixel_index <= 2855)) || ((pixel_index >= 2857)  &&  (pixel_index <= 3307)) || ((pixel_index >= 3320)  && 
         (pixel_index <= 3403)) || ((pixel_index >= 3416)  &&  (pixel_index <= 3497)) || ((pixel_index >= 3512)  &&  (pixel_index <= 3593)) || ((pixel_index >= 3608)  && 
         (pixel_index <= 3687)) || ((pixel_index >= 3706)  &&  (pixel_index <= 3783)) || ((pixel_index >= 3802)  &&  (pixel_index <= 3879)) || ((pixel_index >= 3898)  && 
         (pixel_index <= 3975)) || ((pixel_index >= 3994)  &&  (pixel_index <= 4071)) || ((pixel_index >= 4092)  &&  (pixel_index <= 4167)) || ((pixel_index >= 4188)  && 
         (pixel_index <= 4263)) || ((pixel_index >= 4284)  &&  (pixel_index <= 4361)) || ((pixel_index >= 4376)  &&  (pixel_index <= 4377)) || ((pixel_index >= 4380)  && 
         (pixel_index <= 4457)) || ((pixel_index >= 4472)  &&  (pixel_index <= 4473)) || ((pixel_index >= 4476)  &&  (pixel_index <= 4551)) || ((pixel_index >= 4568)  && 
         (pixel_index <= 4647)) || ((pixel_index >= 4664)  &&  (pixel_index <= 4745)) || ((pixel_index >= 4758)  &&  (pixel_index <= 4841)) ||  (pixel_index >= 4854)  && 
         (pixel_index <= 6143)) 
        
        gameOverOled = 16'b0101010100010100;
    
    else if (((pixel_index >= 3500) && (pixel_index <= 3507)) || (pixel_index >= 3596) && (pixel_index <= 3603)) 
    
        gameOverOled = 16'b1111010100010100;
    
    else if (((pixel_index >= 3508) && (pixel_index <= 3509)) || ((pixel_index >= 3604) && (pixel_index <= 3605)) || ((pixel_index >= 3690) && (pixel_index <= 3703)) || 
             ((pixel_index >= 3786) && (pixel_index <= 3799)) || ((pixel_index >= 3884) && (pixel_index <= 3885)) || ((pixel_index >= 3890) && (pixel_index <= 3895)) || 
             ((pixel_index >= 3980) && (pixel_index <= 3981)) || ((pixel_index >= 3986) && (pixel_index <= 3991)) || ((pixel_index >= 4076) && (pixel_index <= 4077)) || 
             ((pixel_index >= 4082) && (pixel_index <= 4087)) || ((pixel_index >= 4170) && (pixel_index <= 4181)) || ((pixel_index >= 4266) && (pixel_index <= 4277)) || 
             ((pixel_index >= 4368) && (pixel_index <= 4373)) || ((pixel_index >= 4464) && (pixel_index <= 4469)) || ((pixel_index >= 4554) && (pixel_index <= 4561)) || 
             ((pixel_index >= 4564) && (pixel_index <= 4565)) || ((pixel_index >= 4650) && (pixel_index <= 4657)) ||  (pixel_index >= 4660) && (pixel_index <= 4661)) 
        
        gameOverOled = 16'b0101001010001010;
    
    else if (((pixel_index >= 3882) && (pixel_index <= 3883)) || ((pixel_index >= 3886) && (pixel_index <= 3887)) || ((pixel_index >= 3978) && (pixel_index <= 3979)) || 
              (pixel_index >= 3982) && (pixel_index <= 3983)) 
              
        gameOverOled = 16'b1010000000000000;
    
    else if (((pixel_index >= 4090) && (pixel_index <= 4091)) || ((pixel_index >= 4184) && (pixel_index <= 4187)) || ((pixel_index >= 4280) && (pixel_index <= 4283)) || 
             ((pixel_index >= 4378) && (pixel_index <= 4379)) ||  (pixel_index >= 4474) && (pixel_index <= 4475)) 
             
        gameOverOled = 16'b1111010100000000;
    
    else 
        gameOverOled = 0; 
    end
endmodule
