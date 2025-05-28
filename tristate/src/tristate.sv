module tristate(
                input logic [3:0] a,
                input logic       en,
                output tri [3:0]  y
                );
   // When en=0, output floats (z)
   assign y = en ? a : 4'bz;

endmodule // tristate
