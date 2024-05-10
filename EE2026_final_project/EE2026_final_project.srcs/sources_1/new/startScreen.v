`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 22:00:09
// Design Name: 
// Module Name: startScreen
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


module startScreen (input CLOCK, 
                    input [12:0] pixel_index,
                    input p1ReadyFlag, p2ReadyFlag, p3ReadyFlag, p4ReadyFlag,
                    output reg [15:0] startScreenOled = 16'h07E0);

    wire clk25mhz;

    flexible_clock(CLOCK, 1, clk25mhz);
 
    always @ (posedge clk25mhz)
    begin
    // this segment VV needs to be edited when different boards are used 
    
        if (p1ReadyFlag) begin //player 1 enters here - edit this according to game logic 
            startScreenOled <= 16'b1111100000000000;
        end else if (p2ReadyFlag) begin //player 2 
            startScreenOled <= 16'b1111111111000000;  
        end else if (p3ReadyFlag) begin //player 3 
            startScreenOled <= 16'b0000111111100000;
        end else if (p4ReadyFlag) begin //player 4
            startScreenOled <= 16'b0000000010011111;
        end
        
    // end edit segment ^^ 
        else begin
    
        if (((pixel_index >=    0)  &&  (pixel_index <=   23)) || ((pixel_index >=   96)  &&  (pixel_index <=  119)) || ((pixel_index >=  192)  &&  (pixel_index <=  215)) || 
            ((pixel_index >=  288)  &&  (pixel_index <=  311)) || ((pixel_index >=  384)  &&  (pixel_index <=  391)) || ((pixel_index >=  399)  &&  (pixel_index <=  407)) || 
            ((pixel_index >=  480)  &&  (pixel_index <=  486)) || ((pixel_index >=  491)  &&  (pixel_index <=  494)) || ((pixel_index >=  496)  &&  (pixel_index <=  503)) || 
            ((pixel_index >=  576)  &&  (pixel_index <=  581)) || ((pixel_index >=  586)  &&  (pixel_index <=  587)) || ((pixel_index >=  590)  &&  (pixel_index <=  591)) || 
            ((pixel_index >=  593)  &&  (pixel_index <=  599)) || ((pixel_index >=  672)  &&  (pixel_index <=  677)) || ((pixel_index >=  682)  &&  (pixel_index <=  683)) || 
              pixel_index ==  687   || ((pixel_index >=  689)  &&  (pixel_index <=  695)) || ((pixel_index >=  768)  &&  (pixel_index <=  773)) ||   pixel_index ==  783   || 
            ((pixel_index >=  785)  &&  (pixel_index <=  791)) || ((pixel_index >=  864)  &&  (pixel_index <=  869)) || ((pixel_index >=  878)  &&  (pixel_index <=  879)) || 
            ((pixel_index >=  881)  &&  (pixel_index <=  887)) || ((pixel_index >=  960)  &&  (pixel_index <=  965)) || ((pixel_index >=  974)  &&  (pixel_index <=  975)) || 
            ((pixel_index >=  977)  &&  (pixel_index <=  983)) || ((pixel_index >= 1056)  &&  (pixel_index <= 1061)) || ((pixel_index >= 1069)  &&  (pixel_index <= 1070)) || 
            ((pixel_index >= 1073)  &&  (pixel_index <= 1079)) || ((pixel_index >= 1152)  &&  (pixel_index <= 1159)) || ((pixel_index >= 1167)  &&  (pixel_index <= 1175)) || 
            ((pixel_index >= 1248)  &&  (pixel_index <= 1254)) || ((pixel_index >= 1264)  &&  (pixel_index <= 1271)) || ((pixel_index >= 1344)  &&  (pixel_index <= 1349)) || 
            ((pixel_index >= 1361)  &&  (pixel_index <= 1367)) || ((pixel_index >= 1440)  &&  (pixel_index <= 1445)) ||   pixel_index == 1447   || ((pixel_index >= 1450)  && 
             (pixel_index <= 1452)) ||   pixel_index == 1455   || ((pixel_index >= 1457)  &&  (pixel_index <= 1463)) || ((pixel_index >= 1536)  &&  (pixel_index <= 1542)) || 
            ((pixel_index >= 1552)  &&  (pixel_index <= 1559)) || ((pixel_index >= 1632)  &&  (pixel_index <= 1639)) ||   pixel_index == 1641   ||   pixel_index == 1645   || 
            ((pixel_index >= 1647)  &&  (pixel_index <= 1655)) || ((pixel_index >= 1728)  &&  (pixel_index <= 1735)) ||   pixel_index == 1738   ||   pixel_index == 1741   || 
            ((pixel_index >= 1743)  &&  (pixel_index <= 1751)) || ((pixel_index >= 1824)  &&  (pixel_index <= 1847)) || ((pixel_index >= 1920)  &&  (pixel_index <= 1943)) || 
            ((pixel_index >= 2016)  &&  (pixel_index <= 2039)) || ((pixel_index >= 2112)  &&  (pixel_index <= 2135)) || ((pixel_index >= 2208)  &&  (pixel_index <= 2231)) || 
             (pixel_index >= 2304)  &&  (pixel_index <= 2327)) 
            
            startScreenOled = 16'b1010000000000000;
        
        else if (((pixel_index >=   70)  &&  (pixel_index <=   95)) || ((pixel_index >=  166)  &&  (pixel_index <= 191))  || ((pixel_index >=  262)  && (pixel_index <=  287)) || 
                 ((pixel_index >=  358)  &&  (pixel_index <=  383)) || ((pixel_index >=  454)  &&  (pixel_index <= 479))  || ((pixel_index >=  550)  && (pixel_index <=  559)) || 
                 ((pixel_index >=  563)  &&  (pixel_index <=  575)) || ((pixel_index >=  646)  &&  (pixel_index <= 655))  || ((pixel_index >=  659)  && (pixel_index <=  671)) || 
                 ((pixel_index >=  742)  &&  (pixel_index <=  751)) || ((pixel_index >=  755)  &&  (pixel_index <= 767))  || ((pixel_index >=  838)  && (pixel_index <=  849)) || 
                 ((pixel_index >=  853)  &&  (pixel_index <=  863)) || ((pixel_index >=  934)  &&  (pixel_index <= 945))  || ((pixel_index >=  949)  && (pixel_index <=  959)) || 
                 ((pixel_index >= 1030)  &&  (pixel_index <= 1037)) || ((pixel_index >= 1047)  &&  (pixel_index <= 1055)) || ((pixel_index >= 1126)  && (pixel_index <= 1133)) || 
                 ((pixel_index >= 1143)  &&  (pixel_index <= 1151)) || ((pixel_index >= 1222)  &&  (pixel_index <= 1233)) || ((pixel_index >= 1237)  && (pixel_index <= 1238)) || 
                 ((pixel_index >= 1241)  &&  (pixel_index <= 1247)) || ((pixel_index >= 1318)  &&  (pixel_index <= 1329)) || ((pixel_index >= 1333)  && (pixel_index <= 1334)) || 
                 ((pixel_index >= 1337)  &&  (pixel_index <= 1343)) || ((pixel_index >= 1414)  &&  (pixel_index <= 1423)) ||   pixel_index == 1426   || ((pixel_index >= 1429) && 
                  (pixel_index <= 1439)) || ((pixel_index >= 1510)  &&  (pixel_index <= 1519)) || ((pixel_index >= 1522)  &&  (pixel_index <= 1524)) || ((pixel_index >= 1527) && 
                  (pixel_index <= 1535)) || ((pixel_index >= 1606)  &&  (pixel_index <= 1615)) || ((pixel_index >= 1618)  &&  (pixel_index <= 1620)) || ((pixel_index >= 1623) && 
                  (pixel_index <= 1631)) || ((pixel_index >= 1702)  &&  (pixel_index <= 1727)) || ((pixel_index >= 1798)  &&  (pixel_index <= 1823)) || ((pixel_index >= 1894) && 
                  (pixel_index <= 1919)) || ((pixel_index >= 1990)  &&  (pixel_index <= 2015)) || ((pixel_index >= 2086)  &&  (pixel_index <= 2111)) || ((pixel_index >= 2182) && 
                  (pixel_index <= 2207)) || ((pixel_index >= 2278)  &&  (pixel_index <= 2303)) ||  (pixel_index >= 2374)  &&  (pixel_index <= 2399)) 
                 
            startScreenOled = 16'b1111010100000000;
        
        else if (((pixel_index >=  488)  &&  (pixel_index <=  490)) ||   pixel_index ==  583   ||   pixel_index ==  850   ||   pixel_index ==  871   ||   pixel_index ==  946   || 
                   pixel_index == 967    ||   pixel_index == 1042   ||   pixel_index == 1064   || ((pixel_index >= 1138)  &&  (pixel_index <= 1140)) || ((pixel_index >= 1234)  &&  
                  (pixel_index <= 1236)) || ((pixel_index >= 1256)  &&  (pixel_index <= 1262)) || ((pixel_index >= 1330)  &&  (pixel_index <= 1332)) || ((pixel_index >= 1353)  &&  
                  (pixel_index <= 1357)) || ((pixel_index >= 1424)  &&  (pixel_index <= 1425)) ||   pixel_index == 1449   ||   pixel_index == 1453   ||   pixel_index == 1643   ||   
                   pixel_index == 1737   ||   pixel_index == 1740) 
        
            startScreenOled = 16'b0101000000000000;
        
        else if (((pixel_index >=  560) && (pixel_index <=  562)) || ((pixel_index >=  656) && (pixel_index <=  658)) || ((pixel_index >=  752) && (pixel_index <=  754)) || 
                 ((pixel_index >=  851) && (pixel_index <=  852)) || ((pixel_index >=  947) && (pixel_index <=  948)) || ((pixel_index >= 1038) && (pixel_index <= 1041)) || 
                 ((pixel_index >= 1043) && (pixel_index <= 1046)) || ((pixel_index >= 1134) && (pixel_index <= 1137)) || ((pixel_index >= 1141) && (pixel_index <= 1142)) || 
                 ((pixel_index >= 1239) && (pixel_index <= 1240)) || ((pixel_index >= 1335) && (pixel_index <= 1336)) || ((pixel_index >= 1427) && (pixel_index <= 1428)) || 
                 ((pixel_index >= 1520) && (pixel_index <= 1521)) || ((pixel_index >= 1525) && (pixel_index <= 1526)) || ((pixel_index >= 1616) && (pixel_index <= 1617)) || 
                  (pixel_index >= 1621) && (pixel_index <= 1622)) 
                 
            startScreenOled = 16'b1010010100000000;
        
        else if (((pixel_index >= 584) && (pixel_index <= 585)) || pixel_index ==  679 || pixel_index ==  775 || pixel_index == 872 || 
                 ((pixel_index >= 968) && (pixel_index <= 972)) || pixel_index == 1065 || pixel_index == 1068 || pixel_index == 1351) 
                   
            startScreenOled = 16'b1010001010000000;
        
        else if (((pixel_index >=  588) && (pixel_index <=  589)) || ((pixel_index >=  680) &&  (pixel_index <=  681)) || ((pixel_index >=  684)  && (pixel_index <= 686)) || 
                 ((pixel_index >=  778) && (pixel_index <=  779)) ||   pixel_index ==  782  || ((pixel_index >=  873)  &&  (pixel_index <=  877)) ||  pixel_index == 973   || 
                 ((pixel_index >= 1066) && (pixel_index <= 1067)) ||   pixel_index == 1359  ||   pixel_index == 1642   ||   pixel_index == 1644) 
                 
            startScreenOled = 16'b1111001010000000;
        
        else if (pixel_index == 2620   ||  pixel_index == 2625   ||   pixel_index == 2628  || ((pixel_index >= 2630)  &&  (pixel_index <= 2632)) || ((pixel_index >= 2636)  &&  (pixel_index <= 2637)) || 
               ((pixel_index >= 2643)  && (pixel_index <= 2644)) || ((pixel_index >= 2648) &&  (pixel_index <= 2649)) ||   pixel_index == 2652   ||   pixel_index == 2656   || ((pixel_index >= 2658)  && 
                (pixel_index <= 2661)) ||  pixel_index == 2716   ||   pixel_index == 2721  ||   pixel_index == 2724   ||   pixel_index == 2726   ||   pixel_index == 2729   ||   pixel_index == 2731   || 
                 pixel_index == 2734   ||  pixel_index == 2738   ||   pixel_index == 2743  ||   pixel_index == 2746   || ((pixel_index >= 2748)  &&  (pixel_index <= 2749)) || ((pixel_index >= 2751)  && 
                (pixel_index <= 2752)) ||  pixel_index == 2754   ||   pixel_index == 2812  ||   pixel_index == 2817   ||   pixel_index == 2820   ||   pixel_index == 2822   ||   pixel_index == 2825   ||
                 pixel_index == 2827   ||  pixel_index == 2830   ||   pixel_index == 2834  || ((pixel_index >= 2836)  &&  (pixel_index <= 2837)) || ((pixel_index >= 2839)  &&  (pixel_index <= 2842)) ||
                 pixel_index == 2844   ||  pixel_index == 2846   ||   pixel_index == 2848  || ((pixel_index >= 2850)  &&  (pixel_index <= 2852)) ||   pixel_index == 2908   ||   pixel_index == 2913   || 
                 pixel_index == 2916   ||  pixel_index == 2918   ||   pixel_index == 2921  ||   pixel_index == 2923   ||   pixel_index == 2926   ||   pixel_index == 2930   ||   pixel_index == 2933   || 
                 pixel_index == 2935   ||  pixel_index == 2938   ||   pixel_index == 2940  ||   pixel_index == 2944   ||   pixel_index == 2946   || ((pixel_index >= 3004)  &&  (pixel_index <= 3007)) || 
               ((pixel_index >= 3010)  && (pixel_index <= 3011)) || ((pixel_index >= 3014) &&  (pixel_index <= 3016)) || ((pixel_index >= 3020)  &&  (pixel_index <= 3021)) || ((pixel_index >= 3027)  && 
                (pixel_index <= 3028)) ||  pixel_index == 3031   ||   pixel_index == 3034  ||   pixel_index == 3036   ||   pixel_index == 3040   ||  (pixel_index >= 3042)  &&  (pixel_index <= 3045)) 
                
            startScreenOled = 16'b1010000000001010;
        
        else if (((pixel_index >= 3196)  &&  (pixel_index <= 3237)) || ((pixel_index >= 3292)  &&  (pixel_index <= 3333)) ||   pixel_index == 3774   || ((pixel_index >= 3779)  &&  (pixel_index <= 3781)) || 
                   pixel_index == 3784   || ((pixel_index >= 3790)  &&  (pixel_index <= 3791)) ||   pixel_index == 3794   ||   pixel_index == 3798   || ((pixel_index >= 3800)  &&  (pixel_index <= 3803)) || 
                 ((pixel_index >= 3805)  &&  (pixel_index <= 3807)) || ((pixel_index >= 3811)  &&  (pixel_index <= 3813)) || ((pixel_index >= 3869)  &&  (pixel_index <= 3870)) ||   pixel_index == 3875   || 
                   pixel_index == 3878   ||   pixel_index == 3880   ||   pixel_index == 3885   ||   pixel_index == 3888   ||   pixel_index == 3890   ||   pixel_index == 3894   ||   pixel_index == 3896   || 
                   pixel_index == 3901   ||   pixel_index == 3904   ||   pixel_index == 3906   ||   pixel_index == 3964   ||   pixel_index == 3966   || ((pixel_index >= 3971)  &&  (pixel_index <= 3973)) ||   
                   pixel_index == 3976   || ((pixel_index >= 3981)  &&  (pixel_index <= 3984)) || ((pixel_index >= 3987)  &&  (pixel_index <= 3989)) || ((pixel_index >= 3992)  &&  (pixel_index <= 3994)) || 
                 ((pixel_index >= 3997)  &&  (pixel_index <= 3999)) || ((pixel_index >= 4003)  &&  (pixel_index <= 4004)) || ((pixel_index >= 4060)  &&  (pixel_index <= 4063)) ||   pixel_index == 4067   ||   
                   pixel_index == 4072   ||   pixel_index == 4077   ||   pixel_index == 4080   ||   pixel_index == 4084   ||   pixel_index == 4088   ||   pixel_index == 4093   ||   pixel_index == 4095   ||   
                   pixel_index == 4101   ||   pixel_index == 4158   ||   pixel_index == 4163   || ((pixel_index >= 4168)  &&  (pixel_index <= 4171)) ||   pixel_index == 4173   ||   pixel_index == 4176   ||   
                   pixel_index == 4180   || ((pixel_index >= 4184)  &&  (pixel_index <= 4187)) ||   pixel_index == 4189   ||   pixel_index == 4192   || ((pixel_index >= 4194)  &&  (pixel_index <= 4196)) || 
                 ((pixel_index >= 4618)  &&  (pixel_index <= 4620)) || ((pixel_index >= 4691)  &&  (pixel_index <= 4692)) || ((pixel_index >= 4714)  &&  (pixel_index <= 4715)) || ((pixel_index >= 4786)  &&  
                  (pixel_index <= 4787)) || ((pixel_index >= 4810)  &&  (pixel_index <= 4811)) || ((pixel_index >= 4883)  &&  (pixel_index <= 4884)) ||   pixel_index == 4886   ||   pixel_index == 4911   ||   
                   pixel_index == 5007   ||   pixel_index == 5103   || ((pixel_index >= 5289)  &&  (pixel_index <= 5290)) ||   pixel_index == 5294   ||  (pixel_index >= 5386)  &&  (pixel_index <= 5390)) 
                   
            startScreenOled = 16'b1111011110011110;
        
        else if (((pixel_index >= 3840)  &&  (pixel_index <= 3864)) || ((pixel_index >= 3936)  &&  (pixel_index <= 3960)) || ((pixel_index >= 4032)  &&  (pixel_index <= 4056)) || ((pixel_index >= 4128)  && 
                  (pixel_index <= 4152)) || ((pixel_index >= 4224)  &&  (pixel_index <= 4248)) || ((pixel_index >= 4320)  &&  (pixel_index <= 4344)) || ((pixel_index >= 4416)  &&  (pixel_index <= 4440)) || 
                 ((pixel_index >= 4512)  &&  (pixel_index <= 4521)) || ((pixel_index >= 4526)  &&  (pixel_index <= 4536)) || ((pixel_index >= 4608)  &&  (pixel_index <= 4616)) || ((pixel_index >= 4623)  && 
                  (pixel_index <= 4632)) || ((pixel_index >= 4704)  &&  (pixel_index <= 4711)) || ((pixel_index >= 4720)  &&  (pixel_index <= 4728)) || ((pixel_index >= 4800)  &&  (pixel_index <= 4807)) || 
                 ((pixel_index >= 4816)  &&  (pixel_index <= 4824)) || ((pixel_index >= 4896)  &&  (pixel_index <= 4902)) || ((pixel_index >= 4913)  &&  (pixel_index <= 4920)) || ((pixel_index >= 4992)  && 
                  (pixel_index <= 4998)) || ((pixel_index >= 5009)  &&  (pixel_index <= 5016)) || ((pixel_index >= 5088)  &&  (pixel_index <= 5094)) || ((pixel_index >= 5105)  &&  (pixel_index <= 5112)) || 
                 ((pixel_index >= 5184)  &&  (pixel_index <= 5190)) || ((pixel_index >= 5201)  &&  (pixel_index <= 5208)) || ((pixel_index >= 5280)  &&  (pixel_index <= 5286)) || ((pixel_index >= 5297)  && 
                  (pixel_index <= 5304)) || ((pixel_index >= 5376)  &&  (pixel_index <= 5383)) || ((pixel_index >= 5392)  &&  (pixel_index <= 5400)) || ((pixel_index >= 5472)  &&  (pixel_index <= 5479)) || 
                 ((pixel_index >= 5488)  &&  (pixel_index <= 5496)) || ((pixel_index >= 5568)  &&  (pixel_index <= 5575)) || ((pixel_index >= 5579)  &&  (pixel_index <= 5580)) || ((pixel_index >= 5584)  && 
                  (pixel_index <= 5592)) || ((pixel_index >= 5664)  &&  (pixel_index <= 5688)) || ((pixel_index >= 5760)  &&  (pixel_index <= 5784)) || ((pixel_index >= 5856)  &&  (pixel_index <= 5880)) || 
                 ((pixel_index >= 5952)  &&  (pixel_index <= 5976)) ||  (pixel_index >= 6048)  &&  (pixel_index <= 6072)) 
                  
            startScreenOled = 16'b0000010100000000;
        
        else if (((pixel_index >= 3910)  &&  (pixel_index <= 3935)) || ((pixel_index >= 4006)  &&  (pixel_index <= 4031)) || ((pixel_index >= 4102)  &&  (pixel_index <= 4127)) || ((pixel_index >= 4198)  && 
                  (pixel_index <= 4223)) || ((pixel_index >= 4294)  &&  (pixel_index <= 4306)) || ((pixel_index >= 4309)  &&  (pixel_index <= 4319)) || ((pixel_index >= 4390)  &&  (pixel_index <= 4400)) || 
                 ((pixel_index >= 4407)  &&  (pixel_index <= 4415)) || ((pixel_index >= 4486)  &&  (pixel_index <= 4495)) || ((pixel_index >= 4503)  &&  (pixel_index <= 4511)) || ((pixel_index >= 4582)  && 
                  (pixel_index <= 4591)) || ((pixel_index >= 4600)  &&  (pixel_index <= 4607)) || ((pixel_index >= 4678)  &&  (pixel_index <= 4687)) || ((pixel_index >= 4696)  &&  (pixel_index <= 4703)) || 
                 ((pixel_index >= 4774)  &&  (pixel_index <= 4783)) || ((pixel_index >= 4792)  &&  (pixel_index <= 4799)) || ((pixel_index >= 4870)  &&  (pixel_index <= 4879)) || ((pixel_index >= 4888)  && 
                  (pixel_index <= 4895)) || ((pixel_index >= 4966)  &&  (pixel_index <= 4973)) || ((pixel_index >= 4985)  &&  (pixel_index <= 4991)) || ((pixel_index >= 5062)  &&  (pixel_index <= 5069)) || 
                 ((pixel_index >= 5081)  &&  (pixel_index <= 5087)) || ((pixel_index >= 5158)  &&  (pixel_index <= 5164)) || ((pixel_index >= 5178)  &&  (pixel_index <= 5183)) || ((pixel_index >= 5254)  && 
                  (pixel_index <= 5260)) || ((pixel_index >= 5274)  &&  (pixel_index <= 5279)) || ((pixel_index >= 5350)  &&  (pixel_index <= 5357)) || ((pixel_index >= 5369)  &&  (pixel_index <= 5375)) || 
                 ((pixel_index >= 5446)  &&  (pixel_index <= 5455)) || ((pixel_index >= 5463)  &&  (pixel_index <= 5471)) || ((pixel_index >= 5542)  &&  (pixel_index <= 5549)) ||   pixel_index == 5555   || 
                 ((pixel_index >= 5561)  &&  (pixel_index <= 5567)) || ((pixel_index >= 5638)  &&  (pixel_index <= 5644)) || ((pixel_index >= 5650)  &&  (pixel_index <= 5652)) || ((pixel_index >= 5658)  && 
                  (pixel_index <= 5663)) || ((pixel_index >= 5734)  &&  (pixel_index <= 5739)) || ((pixel_index >= 5746)  &&  (pixel_index <= 5748)) || ((pixel_index >= 5755)  &&  (pixel_index <= 5759)) || 
                 ((pixel_index >= 5830)  &&  (pixel_index <= 5855)) || ((pixel_index >= 5926)  &&  (pixel_index <= 5951)) || ((pixel_index >= 6022)  &&  (pixel_index <= 6047)) ||  (pixel_index >= 6118)  && 
                  (pixel_index <= 6143)) 
                  
            startScreenOled = 16'b0000010100010100;
        
        else if (((pixel_index >= 4402)  &&  (pixel_index <= 4403)) || ((pixel_index >= 4497)  &&  (pixel_index <= 4500)) || ((pixel_index >= 4592)  &&  (pixel_index <= 4596)) || ((pixel_index >= 4688)  && 
                  (pixel_index <= 4689)) || ((pixel_index >= 4693)  &&  (pixel_index <= 4694)) ||   pixel_index == 4785   ||   pixel_index == 4881   ||   pixel_index == 4974   ||   pixel_index == 4984   || 
                 ((pixel_index >= 5070)  &&  (pixel_index <= 5071)) || ((pixel_index >= 5079)  &&  (pixel_index <= 5080)) ||   pixel_index == 5166   ||   pixel_index == 5176   || ((pixel_index >= 5262)  && 
                  (pixel_index <= 5263)) || ((pixel_index >= 5271)  &&  (pixel_index <= 5272)) || ((pixel_index >= 5361)  &&  (pixel_index <= 5365)) || ((pixel_index >= 5458)  &&  (pixel_index <= 5460)) || 
                 ((pixel_index >= 5552)  &&  (pixel_index <= 5553)) || ((pixel_index >= 5557)  &&  (pixel_index <= 5558)) || ((pixel_index >= 5646)  &&  (pixel_index <= 5649)) ||  (pixel_index >= 5653)  && 
                  (pixel_index <= 5656)) 
                  
            startScreenOled = 16'b0000000000011110;
        
        else if (pixel_index == 4405  || ((pixel_index >= 4975)  &&  (pixel_index <= 4977)) ||  pixel_index == 4983   || ((pixel_index >= 5072) && (pixel_index <= 5073)) ||  pixel_index == 5078  || 
               ((pixel_index >= 5169) &&  (pixel_index <= 5173)) || ((pixel_index >= 5265)  && (pixel_index <= 5269)) || ((pixel_index >= 5456) && (pixel_index <= 5457)) || (pixel_index >= 5461) && 
                (pixel_index <= 5462)) 
               
            startScreenOled = 16'b0000011110011110;
        
        else if (pixel_index == 4617 || pixel_index == 5000 || pixel_index == 5385 || pixel_index == 5481 || pixel_index == 5486) 
        
            startScreenOled = 16'b1010010100010100;
        
        else if (((pixel_index >= 4621)  && (pixel_index <= 4622)) ||   pixel_index == 4713  || ((pixel_index >= 4716)  && (pixel_index <= 4718)) || pixel_index == 4809 || ((pixel_index >= 4812) && 
                  (pixel_index <= 4814)) ||  pixel_index == 5199   || ((pixel_index >= 5291) &&  (pixel_index <= 5293)) ||  pixel_index == 5295) 
                  
            startScreenOled = 16'b0101011110000000;
        
        else if (pixel_index == 4690 || pixel_index == 4789 || pixel_index == 4882 || pixel_index == 4885 || ((pixel_index >= 4978) && (pixel_index <= 4981)) || pixel_index == 5001 || 
                 pixel_index == 5097) 
                 
            startScreenOled = 16'b1010010100001010;
        
        else if (pixel_index == 4904 || pixel_index == 5096 || pixel_index == 5192 || pixel_index == 5288) 
        
            startScreenOled = 16'b0101010100000000;
        
        else if (pixel_index == 5002 || pixel_index == 5004 || pixel_index == 5006 || (pixel_index >= 5098) && (pixel_index <= 5102)) 
        
            startScreenOled = 16'b1111010100001010;
        
        else 
            startScreenOled = 0;
        end
    end
endmodule