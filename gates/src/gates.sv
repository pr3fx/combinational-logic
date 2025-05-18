/*
 * Simple combinational logic to test design and hardware file generation.
 */

module gates(input logic        a, b,
             output logic [3:0] y);
   /* Four boolean logic operations, the outputs of which
      will be displayed on the board's respective LEDs */
   assign y[0] = a & b;    // AND
   assign y[1] = a | b;    // OR
   assign y[2] = a ^ b;    // XOR
   assign y[3] = ~(a & b); // NAND

endmodule // gates
