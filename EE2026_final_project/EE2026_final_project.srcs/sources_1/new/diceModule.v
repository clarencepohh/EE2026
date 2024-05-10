`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 20:17:21
// Design Name: 
// Module Name: diceModule
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
`define ORANGE1 16'b1111010100000000
`define PURPLE  16'b0101000000001010
`define WHITE1  16'b1111011110011110
`define BLACK   16'b0000000000000000

module diceModule (input CLOCK, diceStartFlag, player_diceScreenEnable, 
                   input [12:0] pixel_index,
                   output reg [15:0] oled_output,
                   output [2:0] dice_output,
                   output reg animationDone = 0);

    wire clk_6p25, clk_25, clk_5, clk_1;
    
    wire [2:0] counter_1, counter_5, delayCount;
    
    wire frame_begin, sending_pixels, sample_pixel;
    
    // wire [12:0] pixel_index;
    wire [7:0] x;
    wire [6:0] y;
    
    //reg [2:0] dice_output;
    //reg [15:0] oled_output;
    
    reg diceStarted = 0;
    reg activate_dice_spin = 0;
    reg activate_output = 0;
    reg reset = 1, delayReset = 1;
    
    counterFiveHz (clk_5, activate_dice_spin, counter_5);
    counterOneHz (clk_1, reset, counter_1); 
    counter2s delayCounter (clk_1, delayReset, delayCount); 
    
    pixel_index_to_cartesian (pixel_index, x, y);
    //Oled_Display(clk_6p25,0,frame_begin,sending_pixels,sample_pixel,pixel_index,oled_data,JA[0], JA[1], JA[3], JA[4], JA[5], JA[6], JA[7]);
    
    flexible_clock sixPointFiveMHz (CLOCK,7, clk_6p25);
    flexible_clock twentyFiveMHz (CLOCK, 1, clk_25);
    flexible_clock fiveHz (CLOCK, 9999999, clk_5);
    flexible_clock oneHz (CLOCK, 49999999, clk_1);
    
    LFSR (CLOCK, player_diceScreenEnable, dice_output);
    
    always @ (posedge clk_25) begin
    
        if (diceStartFlag == 0 && reset == 1) begin
            if (((pixel_index >=    0) && (pixel_index <= 2323)) || ((pixel_index >= 2333) && (pixel_index <= 2341)) || ((pixel_index >= 2348) && (pixel_index <= 2353)) || 
                ((pixel_index >= 2357) && (pixel_index <= 2368)) || ((pixel_index >= 2372) && (pixel_index <= 2419)) || ((pixel_index >= 2429) && (pixel_index <= 2437)) || 
                ((pixel_index >= 2444) && (pixel_index <= 2449)) || ((pixel_index >= 2453) && (pixel_index <= 2464)) || ((pixel_index >= 2468) && (pixel_index <= 2515)) || 
                ((pixel_index >= 2525) && (pixel_index <= 2533)) || ((pixel_index >= 2540) && (pixel_index <= 2545)) || ((pixel_index >= 2549) && (pixel_index <= 2560)) || 
                ((pixel_index >= 2564) && (pixel_index <= 2611)) || ((pixel_index >= 2615) && (pixel_index <= 2620)) || ((pixel_index >= 2624) && (pixel_index <= 2626)) || 
                ((pixel_index >= 2630) && (pixel_index <= 2635)) || ((pixel_index >= 2639) && (pixel_index <= 2641)) || ((pixel_index >= 2645) && (pixel_index <= 2656)) || 
                ((pixel_index >= 2660) && (pixel_index <= 2707)) || ((pixel_index >= 2711) && (pixel_index <= 2716)) || ((pixel_index >= 2720) && (pixel_index <= 2722)) || 
                ((pixel_index >= 2726) && (pixel_index <= 2731)) || ((pixel_index >= 2735) && (pixel_index <= 2737)) || ((pixel_index >= 2741) && (pixel_index <= 2752)) || 
                ((pixel_index >= 2756) && (pixel_index <= 2803)) || ((pixel_index >= 2807) && (pixel_index <= 2812)) || ((pixel_index >= 2816) && (pixel_index <= 2818)) || 
                ((pixel_index >= 2822) && (pixel_index <= 2827)) || ((pixel_index >= 2831) && (pixel_index <= 2833)) || ((pixel_index >= 2837) && (pixel_index <= 2848)) || 
                ((pixel_index >= 2852) && (pixel_index <= 2899)) || ((pixel_index >= 2909) && (pixel_index <= 2914)) || ((pixel_index >= 2918) && (pixel_index <= 2923)) || 
                ((pixel_index >= 2927) && (pixel_index <= 2929)) || ((pixel_index >= 2933) && (pixel_index <= 2944)) || ((pixel_index >= 2948) && (pixel_index <= 2995)) || 
                ((pixel_index >= 3005) && (pixel_index <= 3010)) || ((pixel_index >= 3014) && (pixel_index <= 3019)) || ((pixel_index >= 3023) && (pixel_index <= 3025)) || 
                ((pixel_index >= 3029) && (pixel_index <= 3040)) || ((pixel_index >= 3044) && (pixel_index <= 3091)) || ((pixel_index >= 3101) && (pixel_index <= 3106)) || 
                ((pixel_index >= 3110) && (pixel_index <= 3115)) || ((pixel_index >= 3119) && (pixel_index <= 3121)) || ((pixel_index >= 3125) && (pixel_index <= 3136)) || 
                ((pixel_index >= 3140) && (pixel_index <= 3187)) || ((pixel_index >= 3191) && (pixel_index <= 3193)) || ((pixel_index >= 3197) && (pixel_index <= 3202)) || 
                ((pixel_index >= 3206) && (pixel_index <= 3211)) || ((pixel_index >= 3215) && (pixel_index <= 3217)) || ((pixel_index >= 3221) && (pixel_index <= 3232)) || 
                ((pixel_index >= 3236) && (pixel_index <= 3283)) || ((pixel_index >= 3287) && (pixel_index <= 3289)) || ((pixel_index >= 3293) && (pixel_index <= 3298)) || 
                ((pixel_index >= 3302) && (pixel_index <= 3307)) || ((pixel_index >= 3311) && (pixel_index <= 3313)) || ((pixel_index >= 3317) && (pixel_index <= 3328)) || 
                ((pixel_index >= 3332) && (pixel_index <= 3379)) || ((pixel_index >= 3383) && (pixel_index <= 3385)) || ((pixel_index >= 3389) && (pixel_index <= 3394)) || 
                ((pixel_index >= 3398) && (pixel_index <= 3403)) || ((pixel_index >= 3407) && (pixel_index <= 3409)) || ((pixel_index >= 3413) && (pixel_index <= 3424)) || 
                ((pixel_index >= 3428) && (pixel_index <= 3475)) || ((pixel_index >= 3479) && (pixel_index <= 3484)) || ((pixel_index >= 3488) && (pixel_index <= 3493)) || 
                ((pixel_index >= 3500) && (pixel_index <= 3505)) || ((pixel_index >= 3518) && (pixel_index <= 3520)) || ((pixel_index >= 3533) && (pixel_index <= 3571)) || 
                ((pixel_index >= 3575) && (pixel_index <= 3580)) || ((pixel_index >= 3584) && (pixel_index <= 3589)) || ((pixel_index >= 3596) && (pixel_index <= 3601)) || 
                ((pixel_index >= 3614) && (pixel_index <= 3616)) || ((pixel_index >= 3629) && (pixel_index <= 3667)) || ((pixel_index >= 3671) && (pixel_index <= 3676)) || 
                ((pixel_index >= 3680) && (pixel_index <= 3685)) || ((pixel_index >= 3692) && (pixel_index <= 3697)) || ((pixel_index >= 3710) && (pixel_index <= 3712)) || 
                 (pixel_index >= 3725) && (pixel_index <= 6143)) begin  
                 
                oled_output = `PURPLE;
                
            end 
            else if (((pixel_index >= 2324) && (pixel_index <= 2332)) || ((pixel_index >= 2342) && (pixel_index <= 2347)) || ((pixel_index >= 2354) && (pixel_index <= 2356)) || 
                     ((pixel_index >= 2369) && (pixel_index <= 2371)) || ((pixel_index >= 2420) && (pixel_index <= 2428)) || ((pixel_index >= 2438) && (pixel_index <= 2443)) || 
                     ((pixel_index >= 2450) && (pixel_index <= 2452)) || ((pixel_index >= 2465) && (pixel_index <= 2467)) || ((pixel_index >= 2516) && (pixel_index <= 2524)) || 
                     ((pixel_index >= 2534) && (pixel_index <= 2539)) || ((pixel_index >= 2546) && (pixel_index <= 2548)) || ((pixel_index >= 2561) && (pixel_index <= 2563)) || 
                     ((pixel_index >= 2612) && (pixel_index <= 2614)) || ((pixel_index >= 2621) && (pixel_index <= 2623)) || ((pixel_index >= 2627) && (pixel_index <= 2629)) || 
                     ((pixel_index >= 2636) && (pixel_index <= 2638)) || ((pixel_index >= 2642) && (pixel_index <= 2644)) || ((pixel_index >= 2657) && (pixel_index <= 2659)) || 
                     ((pixel_index >= 2708) && (pixel_index <= 2710)) || ((pixel_index >= 2717) && (pixel_index <= 2719)) || ((pixel_index >= 2723) && (pixel_index <= 2725)) || 
                     ((pixel_index >= 2732) && (pixel_index <= 2734)) || ((pixel_index >= 2738) && (pixel_index <= 2740)) || ((pixel_index >= 2753) && (pixel_index <= 2755)) || 
                     ((pixel_index >= 2804) && (pixel_index <= 2806)) || ((pixel_index >= 2813) && (pixel_index <= 2815)) || ((pixel_index >= 2819) && (pixel_index <= 2821)) || 
                     ((pixel_index >= 2828) && (pixel_index <= 2830)) || ((pixel_index >= 2834) && (pixel_index <= 2836)) || ((pixel_index >= 2849) && (pixel_index <= 2851)) || 
                     ((pixel_index >= 2900) && (pixel_index <= 2908)) || ((pixel_index >= 2915) && (pixel_index <= 2917)) || ((pixel_index >= 2924) && (pixel_index <= 2926)) || 
                     ((pixel_index >= 2930) && (pixel_index <= 2932)) || ((pixel_index >= 2945) && (pixel_index <= 2947)) || ((pixel_index >= 2996) && (pixel_index <= 3004)) || 
                     ((pixel_index >= 3011) && (pixel_index <= 3013)) || ((pixel_index >= 3020) && (pixel_index <= 3022)) || ((pixel_index >= 3026) && (pixel_index <= 3028)) || 
                     ((pixel_index >= 3041) && (pixel_index <= 3043)) || ((pixel_index >= 3092) && (pixel_index <= 3100)) || ((pixel_index >= 3107) && (pixel_index <= 3109)) || 
                     ((pixel_index >= 3116) && (pixel_index <= 3118)) || ((pixel_index >= 3122) && (pixel_index <= 3124)) || ((pixel_index >= 3137) && (pixel_index <= 3139)) || 
                     ((pixel_index >= 3188) && (pixel_index <= 3190)) || ((pixel_index >= 3194) && (pixel_index <= 3196)) || ((pixel_index >= 3203) && (pixel_index <= 3205)) || 
                     ((pixel_index >= 3212) && (pixel_index <= 3214)) || ((pixel_index >= 3218) && (pixel_index <= 3220)) || ((pixel_index >= 3233) && (pixel_index <= 3235)) || 
                     ((pixel_index >= 3284) && (pixel_index <= 3286)) || ((pixel_index >= 3290) && (pixel_index <= 3292)) || ((pixel_index >= 3299) && (pixel_index <= 3301)) || 
                     ((pixel_index >= 3308) && (pixel_index <= 3310)) || ((pixel_index >= 3314) && (pixel_index <= 3316)) || ((pixel_index >= 3329) && (pixel_index <= 3331)) || 
                     ((pixel_index >= 3380) && (pixel_index <= 3382)) || ((pixel_index >= 3386) && (pixel_index <= 3388)) || ((pixel_index >= 3395) && (pixel_index <= 3397)) || 
                     ((pixel_index >= 3404) && (pixel_index <= 3406)) || ((pixel_index >= 3410) && (pixel_index <= 3412)) || ((pixel_index >= 3425) && (pixel_index <= 3427)) || 
                     ((pixel_index >= 3476) && (pixel_index <= 3478)) || ((pixel_index >= 3485) && (pixel_index <= 3487)) || ((pixel_index >= 3494) && (pixel_index <= 3499)) || 
                     ((pixel_index >= 3506) && (pixel_index <= 3517)) || ((pixel_index >= 3521) && (pixel_index <= 3532)) || ((pixel_index >= 3572) && (pixel_index <= 3574)) || 
                     ((pixel_index >= 3581) && (pixel_index <= 3583)) || ((pixel_index >= 3590) && (pixel_index <= 3595)) || ((pixel_index >= 3602) && (pixel_index <= 3613)) || 
                     ((pixel_index >= 3617) && (pixel_index <= 3628)) || ((pixel_index >= 3668) && (pixel_index <= 3670)) || ((pixel_index >= 3677) && (pixel_index <= 3679)) || 
                     ((pixel_index >= 3686) && (pixel_index <= 3691)) || ((pixel_index >= 3698) && (pixel_index <= 3709)) ||  (pixel_index >= 3713) && (pixel_index <= 3724)) begin 
                     
                oled_output = `ORANGE1;
                
            end else begin 
                oled_output = `BLACK; 
            end 
        end
        
        if (diceStartFlag) begin 
            diceStarted <= 1;
        end else begin
            diceStarted <= 0;
            animationDone <= 0;
        end
        
        if (diceStarted) begin
            activate_dice_spin <= 1;
            reset <= 0;
        end else begin
            activate_dice_spin <= 0;
            reset <= 1;
        end 
        
        if (animationDone) begin 
            diceStarted <= 0;
        end 
        
        if (activate_dice_spin == 1 && reset == 0) begin
        
            case (counter_5)
            
            1: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin  
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 2830) && (pixel_index <= 2834)) || ((pixel_index >= 2926) && (pixel_index <= 2930)) || ((pixel_index >= 3022) && (pixel_index <= 3026)) ||
                         ((pixel_index >= 3118) && (pixel_index <= 3122)) ||  (pixel_index >= 3214) && (pixel_index <= 3218)) begin 
                         
                    oled_output = `WHITE1;
                     
                end else begin 
                    oled_output = `BLACK;          
                end 
            end
            
            2: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end     
                else if (((pixel_index >= 1957) && (pixel_index <= 1961)) || ((pixel_index >= 2053) && (pixel_index <= 2057)) || ((pixel_index >= 2149) && (pixel_index <= 2153)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2249)) || ((pixel_index >= 2341) && (pixel_index <= 2345)) || ((pixel_index >= 3703) && (pixel_index <= 3707)) || 
                         ((pixel_index >= 3799) && (pixel_index <= 3803)) || ((pixel_index >= 3895) && (pixel_index <= 3899)) || ((pixel_index >= 3991) && (pixel_index <= 3995)) || 
                          (pixel_index >= 4087) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                     
                end else begin  
                    oled_output = `BLACK;    
                end 
            end
            
            3: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin  
                
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2831) && (pixel_index <= 2834)) || ((pixel_index >= 2927) && (pixel_index <= 2930)) || 
                         ((pixel_index >= 3023) && (pixel_index <= 3026)) || ((pixel_index >= 3119) && (pixel_index <= 3122)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || 
                         ((pixel_index >= 3896) && (pixel_index <= 3899)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;     
                end 
            end
            
            4: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin  
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || 
                         ((pixel_index >= 2072) && (pixel_index <= 2075)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || ((pixel_index >= 3781) && (pixel_index <= 3784)) || 
                         ((pixel_index >= 3800) && (pixel_index <= 3803)) || ((pixel_index >= 3877) && (pixel_index <= 3880)) || ((pixel_index >= 3896) && (pixel_index <= 3899)) || 
                         ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || ((pixel_index >= 4069) && (pixel_index <= 4072)) || 
                          (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;     
                end 
            end
            
            5: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || 
                ((pixel_index >= 2072) && (pixel_index <= 2075)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || ((pixel_index >= 2831) && (pixel_index <= 2834)) || 
                ((pixel_index >= 2927) && (pixel_index <= 2930)) || ((pixel_index >= 3023) && (pixel_index <= 3026)) || ((pixel_index >= 3119) && (pixel_index <= 3122)) || 
                ((pixel_index >= 3781) && (pixel_index <= 3784)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || ((pixel_index >= 3877) && (pixel_index <= 3880)) || 
                ((pixel_index >= 3896) && (pixel_index <= 3899)) || ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || 
                ((pixel_index >= 4069) && (pixel_index <= 4072)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;    
                end 
            end
            
            6: begin
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1967) && (pixel_index <= 1970)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || 
                         ((pixel_index >= 2053) && (pixel_index <= 2056)) || ((pixel_index >= 2063) && (pixel_index <= 2066)) || ((pixel_index >= 2072) && (pixel_index <= 2075)) || 
                         ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2159) && (pixel_index <= 2162)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2255) && (pixel_index <= 2258)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || 
                         ((pixel_index >= 3781) && (pixel_index <= 3784)) || ((pixel_index >= 3791) && (pixel_index <= 3794)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || 
                         ((pixel_index >= 3877) && (pixel_index <= 3880)) || ((pixel_index >= 3887) && (pixel_index <= 3890)) || ((pixel_index >= 3896) && (pixel_index <= 3899)) || 
                         ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3983) && (pixel_index <= 3986)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || 
                         ((pixel_index >= 4069) && (pixel_index <= 4072)) || ((pixel_index >= 4079) && (pixel_index <= 4082)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;     
                end 
            end
            
//            default: begin
//                oled_output = `BLACK;       
//            end
            
            endcase
        
        end
       
        if (counter_1 == 4) begin
            activate_dice_spin <= 0;
            activate_output <= 1;
        end else begin
            activate_output <= 0;
        end
            
        if (activate_output == 1 && reset == 0) begin
            
            delayReset <= 0;
            
            if (delayCount == 2) begin  
                delayReset <= 1;
                animationDone <= 1;
                activate_output <= 0;
            end 
            
            case (dice_output)
            1: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 2830) && (pixel_index <= 2834)) || ((pixel_index >= 2926) && (pixel_index <= 2930)) || ((pixel_index >= 3022) && (pixel_index <= 3026)) || 
                         ((pixel_index >= 3118) && (pixel_index <= 3122)) || (pixel_index >= 3214) && (pixel_index <= 3218)) begin 
                         
                    oled_output = `WHITE1;
                end else begin  
                    oled_output = `BLACK;    
                end 
            end
            
            2: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1961)) || ((pixel_index >= 2053) && (pixel_index <= 2057)) || ((pixel_index >= 2149) && (pixel_index <= 2153)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2249)) || ((pixel_index >= 2341) && (pixel_index <= 2345)) || ((pixel_index >= 3703) && (pixel_index <= 3707)) || 
                         ((pixel_index >= 3799) && (pixel_index <= 3803)) || ((pixel_index >= 3895) && (pixel_index <= 3899)) || ((pixel_index >= 3991) && (pixel_index <= 3995)) || 
                          (pixel_index >= 4087) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;    
                end 
            end
            
            3: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2831) && (pixel_index <= 2834)) || ((pixel_index >= 2927) && (pixel_index <= 2930)) || 
                         ((pixel_index >= 3023) && (pixel_index <= 3026)) || ((pixel_index >= 3119) && (pixel_index <= 3122)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || 
                         ((pixel_index >= 3896) && (pixel_index <= 3899)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;     
                end 
            end
            
            4: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || 
                         ((pixel_index >= 2072) && (pixel_index <= 2075)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || ((pixel_index >= 3781) && (pixel_index <= 3784)) || 
                         ((pixel_index >= 3800) && (pixel_index <= 3803)) || ((pixel_index >= 3877) && (pixel_index <= 3880)) || ((pixel_index >= 3896) && (pixel_index <= 3899)) || 
                         ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || ((pixel_index >= 4069) && (pixel_index <= 4072)) || 
                          (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                
                    oled_output = `WHITE1;
                    
                end else begin 
                    oled_output = `BLACK;     
                end 
            end
            
            5: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin 
                    
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || ((pixel_index >= 2053) && (pixel_index <= 2056)) || 
                         ((pixel_index >= 2072) && (pixel_index <= 2075)) || ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || ((pixel_index >= 2831) && (pixel_index <= 2834)) || 
                         ((pixel_index >= 2927) && (pixel_index <= 2930)) || ((pixel_index >= 3023) && (pixel_index <= 3026)) || ((pixel_index >= 3119) && (pixel_index <= 3122)) || 
                         ((pixel_index >= 3781) && (pixel_index <= 3784)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || ((pixel_index >= 3877) && (pixel_index <= 3880)) || 
                         ((pixel_index >= 3896) && (pixel_index <= 3899)) || ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || 
                         ((pixel_index >= 4069) && (pixel_index <= 4072)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                         
                    oled_output = `WHITE1;
                    
                end else begin  
                    oled_output = `BLACK;    
                end 
            end
            
            6: begin
            
                if (((pixel_index >=    0) && (pixel_index <= 1665)) || ((pixel_index >= 1695) && (pixel_index <= 1761)) || ((pixel_index >= 1791) && (pixel_index <= 1857)) || 
                    ((pixel_index >= 1887) && (pixel_index <= 1953)) || ((pixel_index >= 1983) && (pixel_index <= 2049)) || ((pixel_index >= 2079) && (pixel_index <= 2145)) || 
                    ((pixel_index >= 2175) && (pixel_index <= 2241)) || ((pixel_index >= 2271) && (pixel_index <= 2337)) || ((pixel_index >= 2367) && (pixel_index <= 2433)) || 
                    ((pixel_index >= 2463) && (pixel_index <= 2529)) || ((pixel_index >= 2559) && (pixel_index <= 2625)) || ((pixel_index >= 2655) && (pixel_index <= 2721)) || 
                    ((pixel_index >= 2751) && (pixel_index <= 2817)) || ((pixel_index >= 2847) && (pixel_index <= 2913)) || ((pixel_index >= 2943) && (pixel_index <= 3009)) || 
                    ((pixel_index >= 3039) && (pixel_index <= 3105)) || ((pixel_index >= 3135) && (pixel_index <= 3201)) || ((pixel_index >= 3231) && (pixel_index <= 3297)) || 
                    ((pixel_index >= 3327) && (pixel_index <= 3393)) || ((pixel_index >= 3423) && (pixel_index <= 3489)) || ((pixel_index >= 3519) && (pixel_index <= 3585)) || 
                    ((pixel_index >= 3615) && (pixel_index <= 3681)) || ((pixel_index >= 3711) && (pixel_index <= 3777)) || ((pixel_index >= 3807) && (pixel_index <= 3873)) || 
                    ((pixel_index >= 3903) && (pixel_index <= 3969)) || ((pixel_index >= 3999) && (pixel_index <= 4065)) || ((pixel_index >= 4095) && (pixel_index <= 4161)) || 
                    ((pixel_index >= 4191) && (pixel_index <= 4257)) || ((pixel_index >= 4287) && (pixel_index <= 4353)) ||  (pixel_index >= 4383) && (pixel_index <= 6143)) begin
                
                    oled_output = `PURPLE;
                    
                end 
                else if (((pixel_index >= 1957) && (pixel_index <= 1960)) || ((pixel_index >= 1967) && (pixel_index <= 1970)) || ((pixel_index >= 1976) && (pixel_index <= 1979)) || 
                         ((pixel_index >= 2053) && (pixel_index <= 2056)) || ((pixel_index >= 2063) && (pixel_index <= 2066)) || ((pixel_index >= 2072) && (pixel_index <= 2075)) || 
                         ((pixel_index >= 2149) && (pixel_index <= 2152)) || ((pixel_index >= 2159) && (pixel_index <= 2162)) || ((pixel_index >= 2168) && (pixel_index <= 2171)) || 
                         ((pixel_index >= 2245) && (pixel_index <= 2248)) || ((pixel_index >= 2255) && (pixel_index <= 2258)) || ((pixel_index >= 2264) && (pixel_index <= 2267)) || 
                         ((pixel_index >= 3781) && (pixel_index <= 3784)) || ((pixel_index >= 3791) && (pixel_index <= 3794)) || ((pixel_index >= 3800) && (pixel_index <= 3803)) || 
                         ((pixel_index >= 3877) && (pixel_index <= 3880)) || ((pixel_index >= 3887) && (pixel_index <= 3890)) || ((pixel_index >= 3896) && (pixel_index <= 3899)) || 
                         ((pixel_index >= 3973) && (pixel_index <= 3976)) || ((pixel_index >= 3983) && (pixel_index <= 3986)) || ((pixel_index >= 3992) && (pixel_index <= 3995)) || 
                         ((pixel_index >= 4069) && (pixel_index <= 4072)) || ((pixel_index >= 4079) && (pixel_index <= 4082)) ||  (pixel_index >= 4088) && (pixel_index <= 4091)) begin 
                
                    oled_output = `WHITE1;
                    
                end else begin  
                    oled_output = `BLACK;     
                end 
            end
            
//            default: begin
//               oled_output = `BLACK;       
//            end 
           
            endcase 
        end
    end
          
endmodule
