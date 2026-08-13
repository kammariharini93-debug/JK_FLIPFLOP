`timescale 1ns/1ps

module jk_flipflop_tb;

    reg J;
    reg K;
    reg clk;
    reg reset;

    wire Q;
    wire Qbar;

    // Instantiate JK flip-flop
    jk_flipflop uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        J = 0;
        K = 0;

        // Release reset
        #10 reset = 0;

        // No change
        #10 J = 0; K = 0;

        // Set
        #10 J = 1; K = 0;

        // Reset
        #10 J = 0; K = 1;

        // Toggle
        #10 J = 1; K = 1;

        // Toggle again
        #10 J = 1; K = 1;

        #10 $finish;
    end

    // Display output
    initial begin
        $monitor("Time=%0t | Reset=%b | J=%b | K=%b | Q=%b | Qbar=%b",
                 $time, reset, J, K, Q, Qbar);
    end

endmodule
