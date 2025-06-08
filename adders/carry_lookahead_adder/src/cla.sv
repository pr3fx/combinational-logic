module cla
  #(parameter width=32)
   (input logic              cin,
    input logic [width-1:0]  a, b,
    output logic [width-1:0] s,
    output logic             cout);

   logic [width-1:0] fa_cout;
   logic [width/4 - 1: 0] blk_cout;

   assign blk_cout[0] = cin;

   genvar i;

   generate
      for (i=0; i < width; i=i+4) begin: adder_blocks
         full_adder fa_0(.cin(blk_cout[i/4]), .a(a[i]), .b(b[i]), .s(s[i]), .cout(fa_cout[i]));
         full_adder fa_1(.cin(fa_cout[i]), .a(a[i+1]), .b(b[i+1]), .s(s[i+1]), .cout(fa_cout[i+1]));
         full_adder fa_2(.cin(fa_cout[i+1]), .a(a[i+2]), .b(b[i+2]), .s(s[i+2]), .cout(fa_cout[i+2]));
         full_adder fa_3(.cin(fa_cout[i+2]), .a(a[i+3]), .b(b[i+3]), .s(s[i+3]), .cout(fa_cout[i+3]));

         logic [3:0] p, g, c_i;
         assign g = a & b;
         assign p[0] = blk_cout[0] & (a[0] | b[0]);
         assign p[1] = g[0] | (a[1] | b[1]) & p[0];
         assign p[2] = g[1] | (a[2] | b[2]) & p[1];
         assign p[3] = g[2] | (a[3] | b[3]) & p[2];

         logic G, P;
         assign G = g[3] | p[3]&(g[2] | p[2]&(g[1] | p[1]&g[0]));
         assign P = &p;

         assign blk_cout[i/4 + 1] = G | P & blk_cout[i/4];
      end
   endgenerate

   assign cout = blk_cout[i/4 - 1];

endmodule // cla
