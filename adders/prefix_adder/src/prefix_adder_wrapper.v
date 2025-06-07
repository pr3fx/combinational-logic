module prefix_adder_wrapper
  #(parameter width=8)
   (input              cin,
    input [width-1:0]  a, b,
    output             cout,
    output [width-1:0] s);

   prefix_adder prefix_adder_0(
                               .cin(cin),
                               .a(a),
                               .b(b),
                               .cout(cout),
                               .s(s)
                               );
   
endmodule // prefix_adder_wrapper
