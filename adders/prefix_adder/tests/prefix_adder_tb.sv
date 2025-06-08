`define DUT_WIDTH 32

module prefix_adder_tb();
   logic cin, cout, exp_cout;
   logic [`DUT_WIDTH-1:0] a, b, s, exp_s;
   logic [1+`DUT_WIDTH*3:0] testvector[10000:0];
   logic [31:0]             vectornum, errors;

   // DUT
   prefix_adder dut(.cin(cin), .a(a), .b(b), .s(s), .cout(cout));

   initial // load test vectors
     begin
        $readmemb("prefix_adder.tv", testvector);
        errors = 0;
        vectornum = 0;
     end

   always
     begin
        {cin, a, b, exp_s, exp_cout} = testvector[vectornum]; #5;
        if (s !== exp_s & cout !== exp_cout)
          begin
             $display("ERROR: inputs a=%b, b=%b, cin=%b produced", a, b, cin);
             $display("       outputs: s=%b (expected %b), cout=%b (expected %b)", s, exp_s, cout, exp_cout);
             errors = errors+1;
          end
        vectornum = vectornum+1;
        if (testvector[vectornum] === 'x)
          begin
             $display("Completed %d tests with %d errors", vectornum, errors);
             $finish;
          end
     end
   
endmodule // prefix_adder_tb
