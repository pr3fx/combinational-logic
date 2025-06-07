module cla_wrapper
  #(parameter width=16)
   (input              cin,
    input [width-1:0]  a, b,
    output [width-1:0] s,
    output             cout);

   cla cla_0(
             .cin(cin),
             .a(a),
             .b(b),
             .s(s),
             .cout(cout)
             );
   
endmodule // cla_wrapper

