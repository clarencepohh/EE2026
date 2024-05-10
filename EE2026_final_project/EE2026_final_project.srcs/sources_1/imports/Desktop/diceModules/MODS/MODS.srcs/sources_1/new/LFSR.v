`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 23:29:28
// Design Name: 
// Module Name: LFSR
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
`define DELAY 100_000_000

module LFSR (input CLOCK, trigger,
             output reg [2:0] S);

    reg [7:0] lfsr_reg;
    reg [2:0] dice_number;
    reg [$clog2(`DELAY) - 1:0] counter = 0;
    reg prev_trigger;
    
    wire feedback;
    
    assign feedback = ~(lfsr_reg[7] ^ lfsr_reg[6]);
    
    always @ (posedge CLOCK) begin
    
        // Detect rising edge of trigger
        if (trigger && !prev_trigger) begin 
                S <= dice_number;
        end
        
        prev_trigger <= trigger;
    
        if (counter == `DELAY - 1) begin
            counter <= 0; 
            lfsr_reg <= {lfsr_reg[6:0], feedback}; 
            
            dice_number <= (lfsr_reg % 6) + 1;
            
        end else begin  
            counter <= counter + 1; 
        end
     end
 
 endmodule
