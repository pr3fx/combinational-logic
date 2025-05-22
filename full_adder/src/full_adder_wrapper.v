module full_adder_wrapper (
                           input  a, b,
                           output s, cout
                           );
   full_adder full_adder_0(
                           .a(a),
                           .b(b),
                           .s(s),
                           .cout(cout)
                           );

endmodule // full_adder_wrapper
