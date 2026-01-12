
# How to Create and Run a Testbench for Verilog Files

To create and run a testbench for Verilog files, follow these steps:

## Basic Steps

1. **Install a Verilog Simulator**: Ensure you have a Verilog simulator installed, such as Icarus Verilog, ModelSim, or Vivado.

2. **Create a Testbench File**: Write a testbench file that instantiates the Verilog module you want to test and applies stimulus to it. A basic testbench structure looks like this:

```verilog
`timescale 1ns / 1ps

module testbench;
    // Declare inputs as reg and outputs as wire
    reg clk;
    reg reset;
    wire [width-1:0] output_signal;

    // Instantiate the module under test (MUT or DUT)
    your_module_name uut (
        .clk(clk),
        .reset(reset),
        .output_signal(output_signal)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Apply stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        #10; // Wait for 10 time units
        reset = 0;

        // Add more stimulus as needed
        #100; // Run simulation for additional time
        $finish; // End simulation
    end

    // Optional: Waveform dump for GTKWave
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
    end

    // Optional: Monitor outputs
    initial begin
        $monitor("At time %t, output_signal = %h", $time, output_signal);
    end
endmodule
```

3. **Compile the Verilog Files**: Use the simulator's command line or GUI to compile both the Verilog module and the testbench.
   - For Icarus Verilog, use:
     ```bash
     iverilog -g2012 -Wall -o output_file.vvp your_module.v your_testbench.v
     ```

4. **Run the Simulation**: Execute the compiled output file to run the simulation.
   - For Icarus Verilog, use:
     ```bash
     vvp output_file.vvp
     ```

5. **View the Results**: Check the output in the console or use waveform viewers like GTKWave to visualize the signals.

6. **Debug if Necessary**: If results are not as expected, modify your code and repeat the steps.

Refer to specific simulator documentation for more detailed instructions.

## Example: Simple Counter Testbench

In the `04-Testbench` folder, we have a simple 4-bit counter module defined in `counter.v`. Below is an example of a testbench for this module, defined in `tb_counter.v`.

**Key parts of a testbench:**

1. **Declare signals** - Use `reg` for inputs you control, `wire` for outputs
2. **Instantiate module** - Connect your module (called DUT - Device Under Test)
3. **Generate clock** - Use `forever` loop to create periodic signal
4. **Apply stimulus** - Use `initial` block to set input values over time
5. **Monitor/Display** - Use `$display` for printing or `$dumpvars` for waveforms

### Step-by-Step Execution

**Step 1:** Open terminal and compile
```bash
iverilog -o .\01_Basics\04-Testbench\counter_sim.vvp .\01_Basics\04-Testbench\counter.v .\01_Basics\04-Testbench\tb_counter.v
```

**Step 2:** Execute the simulation
```bash
vvp .\01_Basics\04-Testbench\counter_sim.vvp
```

**Step 3:** Observe output
```
Time    Reset   Count
----    -----   -----
        10      1       0
        20      0       1
        30      0       2
        40      0       3
        ...
        
Applying reset again...
        220     1       0
        240     0       1

Simulation complete!
```

**Step 4 (Optional):** Visualize the waveform with GTKWave
```bash
gtkwave .\01_Basics\04-Testbench\counter_wave.vcd
```

This shows the counter counting from 0 to 15 repeatedly, then resetting.
