module mux4_tb();
   logic [3:0] a;
   logic       s0, s1, y;

   mux4 dut(a,s0,s1,y);

   initial begin
      a = 4'b1001; s1 = 0; s0 = 0; #10;
      assert(y === 1) else $error("s[1:0] = 00 failed");
      a = 4'b1000; #10;
      assert(y === 0) else $error("s[1:0] = 00 failed");
      
      s0 = 1; #10;
      assert(y === 0) else $error("s[1:0] = 01 failed");
      a = 4'b1010; #10;
      assert(y === 1) else $error("s[1:0] = 01 failed");

      s1 = 1; s0 = 0; #10;
      assert(y === 0) else $error("s[1:0] = 10 failed");
      a = 4'b0110; #10;
      assert(y === 1) else $error("s[1:0] = 10 failed");

      s0 = 1; #10;
      assert(y === 0) else $error("s[1:0] = 11 failed");
      a = 4'b1110; #10;
      assert(y === 1) else $error("s[1:0] = 11 failed");

      $finish;
   end
        
endmodule // mux4_tb
