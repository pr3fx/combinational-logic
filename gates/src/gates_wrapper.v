module gates_wrapper(input        a, b,
                     output [3:0] y);
   gates gates_0 (
                  .a(a),
                  .b(b),
                  .y(y)
                  );

endmodule // gates_wrapper
