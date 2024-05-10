`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 16:24:53
// Design Name: 
// Module Name: assignment3
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


module assignment3(input sw0, sw1, sw2, sw15, CLOCK, BTNU, BTNL, BTNR,
                   output LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED10, LED15, 
                   output [7:0]seg, output [3:0]an);

    wire w1, w2, w10, w20, w100, w200;
    wire clock_output;
    wire A_complete, B_complete, D_active;
    wire led15_control;
    wire [3:0] countA; 
    wire [1:0] countC;
    wire [10:0] led_out;
    wire [7:0] taskB_seg, taskC_seg;
    wire [3:0] taskB_an, taskC_an;
    wire [2:0] taskC_clockSelect;
    reg [3:0] taskD_anode = 4'b0000;
    reg [7:0] taskD_seg = 8'b10010001; 
    
    clock_1hz clock1 (CLOCK, w1);
    clock_2hz clock2 (CLOCK, w2);
    clock_10hz clock10 (CLOCK, w10);
    clock_20hz clock20 (CLOCK, w20);
    clock_100hz clock100 (CLOCK, w100);
    clock_200hz clock200 (CLOCK, w200);
    
    counter counterA (w1, countA);
    led_A_handler led_handler (CLOCK, w100, w10, w1, countA, sw0, sw1, sw2, led_out, A_complete);
    taskB_buttons button_handler (CLOCK, BTNL, BTNR, BTNU, A_complete, led15_control, B_complete, taskB_seg, taskB_an);
    taskC_clockselector(sw0, sw1, sw2, B_complete, CLOCK, w2, w20, w200, clock_output);
    taskC_counter counterC (clock_output, countC);
    taskC_anodeswitcher switcherC (B_complete, CLOCK, countC, taskC_seg, taskC_an);
    taskD_checker checkerD (sw15, w100, D_active);
    
    assign LED0 = D_active ? 0 : led_out[0];
    assign LED1 = D_active ? 0 : led_out[1];
    assign LED2 = D_active ? 0 : led_out[2];
    assign LED3 = D_active ? 0 : led_out[3];
    assign LED4 = D_active ? 1 : led_out[4];
    assign LED5 = D_active ? 1 : led_out[5];
    assign LED6 = D_active ? 0 : led_out[6];
    assign LED7 = D_active ? 1 : led_out[7];
    assign LED8 = D_active ? 0 : led_out[8];
    assign LED9 = D_active ? 0 : led_out[9];
    assign LED10 = D_active ? 0 : led_out[10];
    assign LED15 = D_active ? 0 : led15_control;
    assign an = D_active ? taskD_anode : (B_complete ? taskC_an : taskB_an);
    assign seg = D_active ? taskD_seg : (B_complete ? taskC_seg : taskB_seg);
    
endmodule
