module multiplex(input logic        a,
                 output logic [3:0] y);
   /* Hardcode two outputs */
   assign y = a ? 4'b1001 : 4'b0110;
endmodule // multiplex
