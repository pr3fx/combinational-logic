module full_adder_tb();
   logic a, b, cin, s, cout;

   full_adder dut(a,b,cin,s,cout);

   initial begin
      a = 0; b = 0; cin = 0; #10;
      assert (s === 0) else $error("{a,b,cin} = 000 did not produce s = 0");
      assert (cout === 0) else $error("{a,b,cin} = 000 did not produce cout = 0");
      
      b = 1; #10;
      assert(s === 1) else $error("{a,b,cin} = 010 did not produce s = 1");
      assert (cout === 0) else $error("{a,b,cin} = 010 did not produce cout = 0");

      a = 1; b = 0; #10;
      assert(s === 1) else $error("{a,b,cin} = 100 did not produce s = 1");
      assert (cout === 0) else $error("{a,b,cin} = 100 did not produce cout = 0");

      a = 0; cin = 1; #10;
      assert(s === 1) else $error("{a,b,cin} = 001 did not produce s = 1");
      assert (cout === 0) else $error("{a,b,cin} = 001 did not produce cout = 0");

      a = 1; b = 1; cin = 0; #10;
      assert(s === 0) else $error("{a,b,cin} = 110 did not produce s = 0");
      assert (cout === 1) else $error("{a,b,cin} = 110 did not produce cout = 1");
      
      b = 0; cin = 1; #10;
      assert(s === 0) else $error("{a,b,cin} = 101 did not produce s = 0");
      assert (cout === 1) else $error("{a,b,cin} = 101 did not produce cout = 1");
      
      a = 0; b = 1; #10;
      assert(s === 0) else $error("{a,b,cin} = 011 did not produce s = 0");
      assert (cout === 1) else $error("{a,b,cin} = 011 did not produce cout = 1");
      
      a = 1; #10;
      assert(s === 1) else $error("{a,b,cin} = 111 did not produce s = 1");
      assert (cout === 1) else $error("{a,b,cin} = 111 did not produce cout = 1");

      $finish;
   end
   
endmodule // full_adder_tb
