module tristate(
                input logic [3:0] a,
                input logic       en,
                output tri [3:0]  out
                );
   // When en=0, output floats (z)
   assign out = en ? a : 4'bz;

endmodule // tristate
