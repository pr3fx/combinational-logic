module mux4_wrapper (
                     input [3:0] a,
                     input       s0, s1,
                     output      y
                     );
   mux4 mux4_0(
               .a(a),
               .s0(s0),
               .s1(s1),
               .y(y)
               );

endmodule; // mux4_wrapper
