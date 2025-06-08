module prefix_adder
  #(parameter width=32)
   (input logic              cin,
    input logic [width-1:0]  a, b,
    output logic             cout,
    output logic [width-1:0] s);

   genvar i;
   genvar lvl;

   logic [width-1:0] upper_p, upper_g, lower_g;
   logic [width-1:0] lvl_out_p [$clog2(width)], lvl_out_g [$clog2(width)];

   // Carry in logic
   upper cin_upper(.A(1), .B(cin), .P(), .G(lower_g[0]));
   
   // Generate logic for top- and bottom-most levels
   generate
      for (i=0; i < width; i=i+1) begin: upper_prfx
         upper u(.A(a[0]), .B(b[0]), .P(upper_p[i]), .G(upper_g[i]));
         lower l(.A(a[0]), .B(b[0]), .G(lower_g[i]), .S(s[0]));
      end
   endgenerate

   generate
      for (lvl=1; lvl <= $clog2(width); lvl=lvl+1) begin: prfx_add_lvls
         genvar k;
         for (k=$pow(2, lvl)-1; k < width; k=k+$pow(2, lvl+1)) begin: prfx_add_blk // each in block in level
            middle first(.P({upper_p[k], lvl_out_p[lvl-2][k-1]}), .G({upper_g[k], lvl_out_g[lvl-2][k-1]}),
                         .P_out(lvl_out_p[lvl-1][k]), .G_out(lvl_out_g[lvl-1][k]));
            
            genvar l;
            for (l=k; l < k+$pow(2, lvl); l=l+1) begin: prfx_add_mid_blk // each mid in block
                middle m(
                        .P({lvl_out_p[$clog2(l-k+1)][l], lvl_out_p[lvl-2][k-1]}),
                        .G({lvl_out_p[$clog2(l-k+1)][l], lvl_out_g[lvl-2][k-1]}),
                        .P_out(lvl_out_p[lvl-1][l]),
                        .G_out(lvl_out_g[lvl-1][l])
                        );
            end
         end
      end
   endgenerate

endmodule // prefix_adder


module upper(input logic  A, B,
             output logic P, G);
   assign P = A | B;
   assign G = A & B;
endmodule // upper


module middle(input logic [1:0] P, G,
              output logic      P_out, G_out);
   assign P_out = &P;
   assign G_out = &G | G[1];
endmodule // middle


module lower(input logic  A, B, G,
             output logic S);
   assign S = G ^ A ^ B;
endmodule // lower
