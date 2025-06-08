module rca_wrapper
  #(parameter width=8)
   (input              cin,
    input [width-1:0]  a, b,
    output [width-1:0] s,
    output             cout);

   rca #(width) rca_0(
                      .cin(cin),
                      .a(a),
                      .b(b),
                      .s(s),
                      .cout(cout)
                      );
   
endmodule // rca_wrapper
