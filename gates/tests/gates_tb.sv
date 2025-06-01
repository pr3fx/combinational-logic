module gates_tb();
   logic a, b;
   logic [3:0] y;

   // DUT (gates)
   gates dut(a,b,y);

   initial begin
      a = 0; b = 0; #10; // 00
      assert (y === 4'b1000) else $error("00 failed");

      b = 1;        #10; // 01
      assert (y === 4'b1110) else $error("01 failed");

      a = 1; b = 0; #10; // 10
      assert (y === 4'b1110) else $error("10 failed");
      
      b = 1;        #10; // 11
      assert (y === 4'b0011) else $error("11 failed");
      #10 $finish;
   end

endmodule // gates_tb
