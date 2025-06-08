`define DUT_WIDTH 32

module cla_tb();

   logic cin, cout, exp_cout;
   logic [`DUT_WIDTH-1:0] a, b, s, exp_s;
   logic [1+`DUT_WIDTH*3:0] testvector[10000:0];
   logic [31:0]             vectornum, errors;

   // DUT
   cla #(`DUT_WIDTH) dut(.cin(cin), .cout(cout), .a(a), .b(b), .s(s));
   
   initial
     begin
        $readmemb("cla.tv", testvector);
        vectornum = 0;
        errors = 0;
     end

   always
     begin
        // Read next test vector
        {cin, a, b, exp_s, exp_cout} = testvector[vectornum]; #5;
        if (s !== exp_s & cout !== exp_cout)
          begin
             $display("ERROR: inputs a=%b, b=%b, cin=%b produced incorrect", a, b, cin);
             $display("       outputs: s=%b (expected %b), cout=%b (expected %b)", s, exp_s, cout, exp_cout);
             errors = errors+1;
          end
        vectornum = vectornum+1;
        if (testvector[vectornum] === 'x) // no more test vectors
          begin
             $display("Completed %d tests with %d errors", vectornum, errors);
             $finish;
          end
     end

endmodule // cla_tb
