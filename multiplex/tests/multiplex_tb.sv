module multiplex_tb();
   logic       a;
   logic [3:0] y;

   multiplex dut(a,y);

   initial begin
      a = 0; #10;
      assert(y === 4'b0110) else $error("0 failed");

      a = 1; #10;
      assert(y === 4'b1001) else $error("1 failed");
      
      $finish;
   end
   
endmodule // multiplex_tb
