`define DUT_WIDTH 8

module rca_tb();

   logic cin, cout, expected_cout;
   logic [`DUT_WIDTH-1:0]   a, b, s, expected_s;
   logic [1+`DUT_WIDTH*3:0] testvectors[10000:0];
   logic [31:0]            vectornum, errors;
   
   // DUT
   rca #(`DUT_WIDTH) dut(.cin(cin), .a(a), .b(b), .s(s), .cout(cout));

   // Load vectors from test vector file
   initial
     begin
        $readmemb("rca.tv", testvectors);
        vectornum = 0;
        errors = 0;
     end
   
   // Apply test vectors
   always
     begin
        {cin, a, b, expected_s, expected_cout} = testvectors[vectornum]; #5;
        // Check results
        if (s !== expected_s & cout !== expected_cout)
          begin
             $display("ERROR: inputs cin=%b, a=%b, b=%b", cin, a, b);
             $display("       outputs {cout, s}=%b (expected {cout, s}=%b", {cout,s}, {expected_cout, expected_s});
             errors=errors+1;
          end
        vectornum=vectornum+1;
        if (testvectors[vectornum] === 'x)
          begin
             $display("%d tests completed, %d errors", vectornum, errors);
             $finish;
          end
     end

endmodule // rca_tb
