module alu
  #(parameter width=32)
   (input logic [width-1:0]  A, B,
    input logic [1:0]        ALUCtrl,
    output logic [width-1:0] Result,
    //           [V,C,N,Z]
    output logic [3:0]       ALUFlags);

endmodule // alu
