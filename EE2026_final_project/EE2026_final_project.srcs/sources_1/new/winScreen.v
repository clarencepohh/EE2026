`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 21:54:03
// Design Name: 
// Module Name: winScreen
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


module winScreen (input CLOCK, input [12:0] pixel_index,
                  output reg [15:0] winScreenOled = 16'h07E0);

    wire clk25mhz; 

    flexible_clock(CLOCK, 1, clk25mhz);
    
    always @ (posedge clk25mhz) 
    begin
    
        if (((pixel_index >=    0)  &&  (pixel_index <= 2623)) || ((pixel_index >= 2625)  &&  (pixel_index <= 2627)) ||   pixel_index == 2629   ||   pixel_index == 2633   || 
            ((pixel_index >= 2635)  &&  (pixel_index <= 2636)) ||   pixel_index == 2638   || ((pixel_index >= 2640)  &&  (pixel_index <= 2641)) ||   pixel_index == 2643   || 
              pixel_index == 2648   || ((pixel_index >= 2652)  &&  (pixel_index <= 2654)) || ((pixel_index >= 2656)  &&  (pixel_index <= 2719)) || ((pixel_index >= 2721)  && 
             (pixel_index <= 2723)) || ((pixel_index >= 2725)  &&  (pixel_index <= 2726)) || ((pixel_index >= 2728)  &&  (pixel_index <= 2729)) ||   pixel_index == 2732   || 
              pixel_index == 2734   ||   pixel_index == 2737   ||   pixel_index == 2739   || ((pixel_index >= 2741)  &&  (pixel_index <= 2744)) || ((pixel_index >= 2746)  && 
             (pixel_index <= 2747)) || ((pixel_index >= 2749)  &&  (pixel_index <= 2750)) || ((pixel_index >= 2752)  &&  (pixel_index <= 2815)) ||   pixel_index == 2817   || 
              pixel_index == 2819   || ((pixel_index >= 2821)  &&  (pixel_index <= 2822)) || ((pixel_index >= 2824)  &&  (pixel_index <= 2825)) ||   pixel_index == 2827   || 
              pixel_index == 2830   ||   pixel_index == 2832   ||   pixel_index == 2835   || ((pixel_index >= 2839)  &&  (pixel_index <= 2840)) || ((pixel_index >= 2844)  && 
             (pixel_index <= 2846)) || ((pixel_index >= 2848)  &&  (pixel_index <= 2911)) ||   pixel_index == 2914   || ((pixel_index >= 2917)  &&  (pixel_index <= 2918)) || 
            ((pixel_index >= 2920)  &&  (pixel_index <= 2921)) || ((pixel_index >= 2923)  &&  (pixel_index <= 2924)) ||   pixel_index == 2926   || ((pixel_index >= 2928)  && 
             (pixel_index <= 2929)) ||   pixel_index == 2931   || ((pixel_index >= 2933)  &&  (pixel_index <= 2936)) ||   pixel_index == 2938   || ((pixel_index >= 2940)  && 
             (pixel_index <= 3007)) || ((pixel_index >= 3009)  &&  (pixel_index <= 3011)) ||   pixel_index == 3013   ||   pixel_index == 3017   || ((pixel_index >= 3019)  && 
             (pixel_index <= 3020)) ||   pixel_index == 3022   || ((pixel_index >= 3024)  &&  (pixel_index <= 3025)) ||   pixel_index == 3027   ||   pixel_index == 3032   || 
            ((pixel_index >= 3034)  &&  (pixel_index <= 3035)) || ((pixel_index >= 3037)  &&  (pixel_index <= 3038)) || ((pixel_index >= 3040)  &&  (pixel_index <= 3490)) || 
            ((pixel_index >= 3494)  &&  (pixel_index <= 3509)) || ((pixel_index >= 3513)  &&  (pixel_index <= 3584)) || ((pixel_index >= 3587)  &&  (pixel_index <= 3589)) || 
            ((pixel_index >= 3606)  &&  (pixel_index <= 3608)) || ((pixel_index >= 3611)  &&  (pixel_index <= 3680)) || ((pixel_index >= 3683)  &&  (pixel_index <= 3685)) || 
            ((pixel_index >= 3702)  &&  (pixel_index <= 3704)) || ((pixel_index >= 3707)  &&  (pixel_index <= 3775)) || ((pixel_index >= 3777)  &&  (pixel_index <= 3781)) || 
            ((pixel_index >= 3798)  &&  (pixel_index <= 3802)) || ((pixel_index >= 3804)  &&  (pixel_index <= 3871)) || ((pixel_index >= 3873)  &&  (pixel_index <= 3877)) || 
            ((pixel_index >= 3894)  &&  (pixel_index <= 3898)) || ((pixel_index >= 3900)  &&  (pixel_index <= 3967)) || ((pixel_index >= 3969)  &&  (pixel_index <= 3973)) || 
            ((pixel_index >= 3990)  &&  (pixel_index <= 3994)) || ((pixel_index >= 3996)  &&  (pixel_index <= 4063)) || ((pixel_index >= 4065)  &&  (pixel_index <= 4069)) || 
            ((pixel_index >= 4086)  &&  (pixel_index <= 4090)) || ((pixel_index >= 4092)  &&  (pixel_index <= 4160)) || ((pixel_index >= 4163)  &&  (pixel_index <= 4165)) || 
            ((pixel_index >= 4182)  &&  (pixel_index <= 4184)) || ((pixel_index >= 4187)  &&  (pixel_index <= 4256)) || ((pixel_index >= 4259)  &&  (pixel_index <= 4261)) || 
            ((pixel_index >= 4278)  &&  (pixel_index <= 4280)) || ((pixel_index >= 4283)  &&  (pixel_index <= 4354)) ||   pixel_index == 4357   ||   pixel_index == 4374   || 
            ((pixel_index >= 4377)  &&  (pixel_index <= 4452)) || ((pixel_index >= 4454)  &&  (pixel_index <= 4455)) || ((pixel_index >= 4468)  &&  (pixel_index <= 4469)) || 
            ((pixel_index >= 4471)  &&  (pixel_index <= 4548)) || ((pixel_index >= 4550)  &&  (pixel_index <= 4551)) || ((pixel_index >= 4564)  &&  (pixel_index <= 4565)) || 
            ((pixel_index >= 4567)  &&  (pixel_index <= 4644)) || ((pixel_index >= 4646)  &&  (pixel_index <= 4647)) || ((pixel_index >= 4660)  &&  (pixel_index <= 4661)) || 
            ((pixel_index >= 4663)  &&  (pixel_index <= 4740)) || ((pixel_index >= 4742)  &&  (pixel_index <= 4743)) || ((pixel_index >= 4756)  &&  (pixel_index <= 4757)) || 
            ((pixel_index >= 4759)  &&  (pixel_index <= 4837)) || ((pixel_index >= 4840)  &&  (pixel_index <= 4841)) || ((pixel_index >= 4850)  &&  (pixel_index <= 4851)) || 
            ((pixel_index >= 4854)  &&  (pixel_index <= 4932)) || ((pixel_index >= 4934)  &&  (pixel_index <= 4938)) || ((pixel_index >= 4945)  &&  (pixel_index <= 4949)) || 
            ((pixel_index >= 4951)  &&  (pixel_index <= 5028)) || ((pixel_index >= 5030)  &&  (pixel_index <= 5034)) || ((pixel_index >= 5041)  &&  (pixel_index <= 5045)) || 
            ((pixel_index >= 5047)  &&  (pixel_index <= 5122)) || ((pixel_index >= 5125)  &&  (pixel_index <= 5132)) || ((pixel_index >= 5135)  &&  (pixel_index <= 5142)) || 
            ((pixel_index >= 5145)  &&  (pixel_index <= 5215)) || ((pixel_index >= 5219)  &&  (pixel_index <= 5228)) || ((pixel_index >= 5231)  &&  (pixel_index <= 5240)) || 
            ((pixel_index >= 5244)  &&  (pixel_index <= 5311)) || ((pixel_index >= 5315)  &&  (pixel_index <= 5324)) || ((pixel_index >= 5327)  &&  (pixel_index <= 5336)) || 
            ((pixel_index >= 5340)  &&  (pixel_index <= 5420)) || ((pixel_index >= 5423)  &&  (pixel_index <= 5514)) || ((pixel_index >= 5521)  &&  (pixel_index <= 5610)) || 
            ((pixel_index >= 5617)  &&  (pixel_index <= 5705)) ||  (pixel_index >= 5714)  &&  (pixel_index <= 6143)) 
                
            winScreenOled = 16'b1010010100010100;
        
        else if (((pixel_index >= 3491)  &&  (pixel_index <= 3493))  || ((pixel_index >= 3510)  &&  (pixel_index <= 3512)) || ((pixel_index >= 3585)  &&  (pixel_index <= 3586)) || 
                 ((pixel_index >= 3592)  &&  (pixel_index <= 3594))  || ((pixel_index >= 3597)  &&  (pixel_index <= 3598)) || ((pixel_index >= 3604)  &&  (pixel_index <= 3605)) || 
                 ((pixel_index >= 3681)  &&  (pixel_index <= 3682))  || ((pixel_index >= 3688)  &&  (pixel_index <= 3690)) || ((pixel_index >= 3693)  &&  (pixel_index <= 3694)) || 
                 ((pixel_index >= 3700)  &&  (pixel_index <= 3701))  ||   pixel_index == 3776   || ((pixel_index >= 3782)  &&  (pixel_index <= 3788)) ||   pixel_index == 3872   || 
                 ((pixel_index >= 3878)  &&  (pixel_index <= 3882))  || ((pixel_index >= 3887)  &&  (pixel_index <= 3888)) ||   pixel_index == 3968   || ((pixel_index >= 3974)  && 
                  (pixel_index <= 3978)) || ((pixel_index >= 3983)   &&  (pixel_index <= 3984)) ||   pixel_index == 4064   || ((pixel_index >= 4070)  &&  (pixel_index <= 4073)) || 
                 ((pixel_index >= 4075)  &&   (pixel_index <= 4076)) ||   pixel_index == 4081   || ((pixel_index >= 4161)  &&  (pixel_index <= 4162)) || ((pixel_index >= 4168)  && 
                  (pixel_index <= 4169)) || ((pixel_index >= 4171)   &&  (pixel_index <= 4172)) || ((pixel_index >= 4185)  &&  (pixel_index <= 4186)) || ((pixel_index >= 4257)  && 
                  (pixel_index <= 4258)) || ((pixel_index >= 4264)   &&  (pixel_index <= 4265)) || ((pixel_index >= 4267)  &&  (pixel_index <= 4268)) || ((pixel_index >= 4281)  && 
                  (pixel_index <= 4282)) || ((pixel_index >= 4355)   &&  (pixel_index <= 4356)) || ((pixel_index >= 4360)  &&  (pixel_index <= 4362)) || ((pixel_index >= 4365)  && 
                  (pixel_index <= 4366)) || ((pixel_index >= 4372)   &&  (pixel_index <= 4373)) || ((pixel_index >= 4375)  &&  (pixel_index <= 4376)) ||   pixel_index == 4453   || 
                 ((pixel_index >= 4456)  &&  (pixel_index <= 4460))  || ((pixel_index >= 4463)  &&  (pixel_index <= 4464)) || ((pixel_index >= 4466)  &&  (pixel_index <= 4467)) || 
                   pixel_index == 4470   ||   pixel_index == 4549    || ((pixel_index >= 4552)  &&  (pixel_index <= 4556)) ||   pixel_index == 4559   ||   pixel_index == 4566   || 
                   pixel_index == 4645   || ((pixel_index >= 4650)   &&  (pixel_index <= 4657)) ||   pixel_index == 4662   ||   pixel_index == 4741   || ((pixel_index >= 4746)  && 
                  (pixel_index <= 4753)) ||   pixel_index == 4758    || ((pixel_index >= 4845)  &&  (pixel_index <= 4848)) ||   pixel_index == 4933   || ((pixel_index >= 4943)  && 
                  (pixel_index <= 4944)) ||   pixel_index == 4950    ||   pixel_index == 5029   || ((pixel_index >= 5039)  &&  (pixel_index <= 5040)) ||   pixel_index == 5046   || 
                 ((pixel_index >= 5123)  &&  (pixel_index <= 5124))  || ((pixel_index >= 5143)  &&  (pixel_index <= 5144)) || ((pixel_index >= 5216)  &&  (pixel_index <= 5218)) || 
                 ((pixel_index >= 5241)  &&  (pixel_index <= 5242))  || ((pixel_index >= 5312)  &&  (pixel_index <= 5314)) || ((pixel_index >= 5337)  &&  (pixel_index <= 5338)) || 
                 ((pixel_index >= 5421)  &&  (pixel_index <= 5422))  || ((pixel_index >= 5517)  &&  (pixel_index <= 5520)) || ((pixel_index >= 5613)  &&  (pixel_index <= 5616)) || 
                  (pixel_index >= 5706)  &&  (pixel_index <= 5713)) 
                 
            winScreenOled = 16'b1010010100000000;
        
        else if (((pixel_index >= 3590)  &&  (pixel_index <= 3591)) || ((pixel_index >= 3686)  &&  (pixel_index <= 3687)) || ((pixel_index >= 3883)  &&  (pixel_index <= 3884)) || 
                 ((pixel_index >= 3979)  &&  (pixel_index <= 3980)) ||   pixel_index == 4074   || ((pixel_index >= 4077)  &&  (pixel_index <= 4078)) || ((pixel_index >= 4166)  && 
                  (pixel_index <= 4167)) ||   pixel_index == 4170   ||   pixel_index == 4177   || ((pixel_index >= 4262)  &&  (pixel_index <= 4263)) ||   pixel_index == 4266   || 
                   pixel_index == 4273   || ((pixel_index >= 4358)  &&  (pixel_index <= 4359)) || ((pixel_index >= 4363)  &&  (pixel_index <= 4364)) || ((pixel_index >= 4367)  && 
                  (pixel_index <= 4368)) || ((pixel_index >= 4461)  &&  (pixel_index <= 4462)) || ((pixel_index >= 4557)  &&  (pixel_index <= 4558)) || ((pixel_index >= 4648)  && 
                  (pixel_index <= 4649)) || ((pixel_index >= 4744)  &&  (pixel_index <= 4745)) || ((pixel_index >= 4838)  &&  (pixel_index <= 4839)) || ((pixel_index >= 4842)  && 
                  (pixel_index <= 4844)) || ((pixel_index >= 4852)  &&  (pixel_index <= 4853)) || ((pixel_index >= 4939)  &&  (pixel_index <= 4942)) || ((pixel_index >= 5035)  && 
                  (pixel_index <= 5038)) || ((pixel_index >= 5515)  &&  (pixel_index <= 5516)) ||  (pixel_index >= 5611)  &&  (pixel_index <= 5612)) 
                  
            winScreenOled = 16'b1010001010000000;
                  
        else if (((pixel_index >= 3595)  &&  (pixel_index <= 3596)) || ((pixel_index >= 3599)  &&  (pixel_index <= 3603)) || ((pixel_index >= 3609)  &&  (pixel_index <= 3610)) || 
                 ((pixel_index >= 3691)  &&  (pixel_index <= 3692)) || ((pixel_index >= 3695)  &&  (pixel_index <= 3699)) || ((pixel_index >= 3705)  &&  (pixel_index <= 3706)) || 
                 ((pixel_index >= 3789)  &&  (pixel_index <= 3792)) || ((pixel_index >= 3794)  &&  (pixel_index <= 3797)) ||   pixel_index == 3803   || ((pixel_index >= 3885)  && 
                  (pixel_index <= 3886)) || ((pixel_index >= 3890)  &&  (pixel_index <= 3893)) || ((pixel_index >= 3981)  &&  (pixel_index <= 3982)) || ((pixel_index >= 3986)  && 
                  (pixel_index <= 3989)) || ((pixel_index >= 4079)  &&  (pixel_index <= 4080)) || ((pixel_index >= 4082)  &&  (pixel_index <= 4085)) ||   pixel_index == 4091   || 
                 ((pixel_index >= 4173)  &&  (pixel_index <= 4176)) || ((pixel_index >= 4178)  &&  (pixel_index <= 4181)) || ((pixel_index >= 4269)  &&  (pixel_index <= 4272)) || 
                 ((pixel_index >= 4274)  &&  (pixel_index <= 4277)) || ((pixel_index >= 4369)  &&  (pixel_index <= 4371)) ||   pixel_index == 4465   || ((pixel_index >= 4658)  && 
                  (pixel_index <= 4659)) || ((pixel_index >= 4754)  &&  (pixel_index <= 4755)) ||   pixel_index == 4849   || ((pixel_index >= 5133)  &&  (pixel_index <= 5134)) || 
                 ((pixel_index >= 5229)  &&  (pixel_index <= 5230)) ||   pixel_index == 5243   || ((pixel_index >= 5325)  &&  (pixel_index <= 5326)) ||   pixel_index == 5339) 
        
            winScreenOled = 16'b1111010100001010;
        
        else if (pixel_index == 3793 || pixel_index == 3889 || pixel_index == 3899 || pixel_index == 3985 || pixel_index == 3995) 
        
            winScreenOled = 16'b1111010100010100;
        
        else if ((pixel_index >= 4560) && (pixel_index <= 4563)) 
        
            winScreenOled = 16'b1111010100000000;
            
        else winScreenOled = 0;
    end
endmodule
