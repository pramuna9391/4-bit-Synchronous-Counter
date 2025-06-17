module counter_4bit (
    input  logic clk,       // Clock signal
    input  logic reset,     // Synchronous reset
    input  logic enable,    // Enable signal
    output logic [3:0] q    // 4-bit counter output
);

    // Counter logic
    always_ff @(posedge clk) begin
        if (reset)
            q <= 4'b0000;            // Reset counter to 0
        else if (enable)
            q <= q + 1;              // Increment counter
    end

endmodule
