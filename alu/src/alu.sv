module alu
  #(parameter width=32)
   (input logic [width-1:0]  A, B,
    input logic [1:0]        ALUCtrl,
    output logic [width-1:0] Result,
    //           [V,C,N,Z]
    output logic [3:0]       ALUFlags);

   logic [width-1:0] B_add_sub, S;
   logic             cout;

   assign B_add_sub  = B ? ALUCtrl[0] : ~B;

   // Instantiate modules
   cla adder(.a(A), .b(B_add_sub), .cin(ALUCtrl[0]), .s(S), .cout(cout));

   always_comb
     begin
        case(ALUCtrl)
          2'b00:   Result = S;      // ADD
          2'b01:   Result = S;      // SUB
          2'b10:   Result = A & B;  // AND
          2'b11:   Result = A | B;  // OR
          default: Result = 0;
        endcase // case (ALUCtrl)
     end

   // Overflow flag
   assign V = ~ALUCtrl[1] & (A[width-1] ^ S[width-1]) & ~(A[width-1] ^ B[width-1] ^ ALUCtrl[0]);
   // Carry flag
   assign C = cout & ~ALUCtrl[1];
   // Negative flag
   assign N = Result[width-1];
   // Zero flag
   assign Z = &(~Result);

endmodule // alu
