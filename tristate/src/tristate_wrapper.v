module tristate_wrapper(
                        input [3:0]      a,
                        input            en,
                        output tri [3:0] out
                        );
   tristate tristate_0 (
                        .a(a),
                        .en(en),
                        .out(out)
                        );

endmodule // tristate_wrapper
