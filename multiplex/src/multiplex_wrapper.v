module multiplex_wrapper(input        a,
                         output [3:0] y);
   multiplex multiplex_0 (
                          .a(a),
                          .y(y)
                          );
   
endmodule // multiplex_wrapper
