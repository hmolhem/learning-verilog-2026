module simple_counter (  // Module declaration for simple counter
    input clk,            // Clock input signal
    input rst,            // Reset input signal
    output reg [3:0] count  // 4-bit counter output register
);                        // End of port list
    
    always @(posedge clk or posedge rst) begin  // Trigger on clock rise or reset rise
        if (rst)          // Check if reset is asserted
            count <= 4'b0000;  // Reset counter to zero
        else              // Otherwise
            count <= count + 1;  // Increment counter by 1
    end                   // End of always block
    
endmodule                 // End of module