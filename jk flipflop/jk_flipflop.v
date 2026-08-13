// JK Flip-Flop
// File: jk_flipflop.v

`timescale 1ns/1ps

module jk_flipflop (
    input  wire J,
    input  wire K,
    input  wire clk,
    input  wire reset,
    output reg  Q,
    output wire Qbar
);

    // JK flip-flop with asynchronous active-high reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;       // No change
                2'b01: Q <= 1'b0;    // Reset
                2'b10: Q <= 1'b1;    // Set
                2'b11: Q <= ~Q;      // Toggle
            endcase
        end
    end

    assign Qbar = ~Q;

endmodule
