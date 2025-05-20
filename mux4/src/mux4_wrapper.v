module mux4_wrapper (
                     input [3:0] a,
                     output      y
                     );
   mux4 mux4_0(
               .a(a),
               .y(y)
               );

endmodule; // mux4_wrapper
