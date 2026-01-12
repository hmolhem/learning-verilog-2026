// Testbench for counter module
module tb_counter;
    // 1. Declare signals to connect to the module
    reg clk;           // Input to module (use 'reg' for inputs you control)
    reg reset;         // Input to module
    wire [3:0] count;  // Output from module (use 'wire' for outputs)

    // 2. Instantiate the module under test (DUT - Device Under Test)
    counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // 3. Generate clock signal (toggles every 5 time units = 10 time unit period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // 4. Apply test stimulus
    initial begin
        // Create VCD file for waveform viewing
        $dumpfile(".\\04-Testbench\\counter_wave.vcd");
        $dumpvars(0, tb_counter);
        
        // Display header
        $display("Time\tReset\tCount");
        $display("----\t-----\t-----");
        
        // Test sequence
        reset = 1;           // Start with reset active
        #10;                 // Wait 10 time units
        reset = 0;           // Release reset
        
        // Monitor the count value
        repeat(20) begin
            #10;             // Wait for one clock cycle
            $display("%0t\t%b\t%d", $time, reset, count);
        end
        
        // Test reset again
        $display("\nApplying reset again...");
        reset = 1;
        #10;
        $display("%0t\t%b\t%d", $time, reset, count);
        reset = 0;
        #20;
        $display("%0t\t%b\t%d", $time, reset, count);
        
        // End simulation
        $display("\nSimulation complete!");
        $finish;
    end

endmodule
