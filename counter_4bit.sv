module tb_counter_4bit;

    // Testbench signals
    logic clk;
    logic reset;
    logic enable;
    logic [3:0] q;

    // Instantiate the counter
    counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .q(q)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        enable = 0;

        $display("Time\tReset\tEnable\tCount");
        $monitor("%0t\t%b\t%b\t%0d", $time, reset, enable, q);

        // Apply reset
        #10 reset = 1; enable = 0;
        #10 reset = 0; enable = 1;

        // Let counter run
        #50;

        // Disable counter
        enable = 0;
        #20;

        // Re-enable counter
        enable = 1;
        #30;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;

        // Let counter run more
        #30;

        // Finish simulation
        $finish;
    end

endmodule
