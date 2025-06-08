module alu
  #(parameter width=32)
   (input logic [width-1:0]  A, B,
    input logic [1:0]        ALUCtrl,
    output logic [width-1:0] Result,
    //           [V,C,N,Z]
    output logic [3:0]       ALUFlags);

   logic [width-1:0] B_add_sub, S;
   logic             cout;

   assign B_add_sub  = ALUCtrl[0] ? ~B : B;

   // Instantiate modules
   cla #(width) adder(.a(A), .b(B_add_sub), .cin(ALUCtrl[0]), .s(S), .cout(cout));

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

   // V Overflow flag
   assign ALUFlags[3] = ~ALUCtrl[1] & (A[width-1] ^ S[width-1]) & ~(A[width-1] ^ B[width-1] ^ ALUCtrl[0]);
   // C Carry flag
   assign ALUFlags[2] = cout & ~ALUCtrl[1];
   // N Negative flag
   assign ALUFlags[1] = Result[width-1];
   // Z Zero flag
   assign ALUFlags[0] = &(~Result);

endmodule // alu
