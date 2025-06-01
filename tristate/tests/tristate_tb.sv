module tristate_tb();
   logic [3:0] a, y;
   logic       en;

   tristate dut(a,en,y);
   initial begin
      a = 4'b1110; en = 0; #10;
      assert(y === 'z) else $error("Output not floating when en = 0");

      en = 1; #10;
      assert(y === a) else $error("Output not equal to input when en = 1");

      a = 4'b0011; #10;
      assert(y === a) else $error("Output not equal to input when input changes");

      en = 0; #10;
      assert(y === 'z) else $error("Output not floating when en goes back to 0");

      $finish;
   end
   
endmodule // tristate_tb
