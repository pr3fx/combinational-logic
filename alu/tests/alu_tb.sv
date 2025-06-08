`define DUT_WIDTH 32

module alu_tb();
   logic [`DUT_WIDTH-1:0] A, B, Result, exp_Result;
   logic [3:0]            ALUFlags, exp_ALUFlags;
   logic [1:0]            ALUCtrl;

   logic [`DUT_WIDTH*3+7:0] testvectors[10000:0];
   logic [31:0]             vectornum, errors;


   // DUT
   alu dut(.A(A), .B(B), .ALUCtrl(ALUCtrl), .Result(Result), .ALUFlags(ALUFlags));
           
   // Load test vectors
   initial
     begin
        $readmemb("alu.tv", testvectors);
        vectornum=0;
        errors=0;
     end

   always
     begin
        {A, B, ALUCtrl, exp_Result, exp_ALUFlags} = testvectors[vectornum]; #5;
        if (Result !== exp_Result | ALUFlags !== exp_ALUFlags)
          begin
             $display("ERROR: inputs A=%b, B=%b, ALUCtrl=%b produced", A, B, ALUCtrl);
             $display("       outputs Result=%b (expected %b), ALUFlags=%b (expected %b)",
                      Result, exp_Result, ALUFlags, exp_ALUFlags);
             errors = errors+1;
          end
        vectornum = vectornum+1;
        if (testvectors[vectornum] === 'x)
          begin
             $display("Completed %d tests with %d errors", vectornum, errors);
             $finish;
          end
     end
   
endmodule // alu_tb
