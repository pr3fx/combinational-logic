module tristate_wrapper(
                        input [3:0]      a,
                        input            en,
                        output tri [3:0] y
                        );
   tristate tristate_0 (
                        .a(a),
                        .en(en),
                        .y(y)
                        );

endmodule // tristate_wrapper
