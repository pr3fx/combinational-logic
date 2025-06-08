module alu_wrapper
  #(parameter width=32)
   (input [width-1:0]  A, B,
    input [1:0]        ALUCtrl,
    output [width-1:0] Result,
    //     [V,C,N,Z]
    output [3:0]       ALUFlags);

   alu alu_0(
             .A(A), .B(B),
             .ALUCtrl(ALUCtrl),
             .Result(Result),
             .ALUFlags(ALUFlags)
             );

endmodule // alu_wrapper
