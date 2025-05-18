module gates_wrapper(input  a, b,
                     output y);
   gates gates_0 (
                  .a(a),
                  .b(b),
                  .y(y)
                  );

endmodule // gates_wrapper
