module sevenseg_wrapper(
                        input [3:0]  data,
                        output [6:0] segments
                        );
   sevenseg sevenseg_0 (
                        .data(data),
                        .segments(segments)
                        );

endmodule // sevenseg_wrapper
