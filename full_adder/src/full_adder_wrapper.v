module full_adder_wrapper (
                           input  a, b, cin,
                           output s, cout
                           );
   full_adder full_adder_0(
                           .a(a),
                           .b(b),
                           .cin(cin),
                           .s(s),
                           .cout(cout)
                           );

endmodule // full_adder_wrapper
