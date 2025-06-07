module rca
  #(parameter width=8)
   (input logic             cin,
    input logic [width-1:0] a, b,
    output logic [width:0]  s,
    output logic            cout);
   
   logic [width-1:0] cout_int;
   genvar i;

   generate
      full_adder fa_0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(cout_int[0]));
      for (i=1; i<width; i=i+1) begin: fa_modules
          full_adder fa(.a(a[i]), .b(b[i]), .cin(cout_int[i-1]), .s(s[i]), .cout(cout_int[i]));
      end
   endgenerate

   assign cout = cout_int[width-1];

endmodule // cpa
