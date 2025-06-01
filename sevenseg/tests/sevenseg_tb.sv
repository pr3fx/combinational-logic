module sevenseg_tb();
   logic [3:0] data;
   logic [6:0] segments;

   sevenseg dut(data, segments);

   initial begin
      data = 4'd0; #10;
      assert(segments === 7'b111_1110) else $error("0 does not produce correct segments");

      data = 4'd1; #10;
      assert(segments === 7'b011_0000) else $error("1 does not produce correct segments");

      data = 4'd2; #10;
      assert(segments === 7'b110_1101) else $error("2 does not produce correct segments");
      
      data = 4'd3; #10;
      assert(segments === 7'b111_1001) else $error("3 does not produce correct segments");

      data = 4'd4; #10;
      assert(segments === 7'b011_0011) else $error("4 does not produce correct segments");

      data = 4'd5; #10;
      assert(segments === 7'b101_1011) else $error("5 does not produce correct segments");

      data = 4'd6; #10;
      assert(segments === 7'b101_1111) else $error("6 does not produce correct segments");

      data = 4'd7; #10;
      assert(segments === 7'b111_0000) else $error("7 does not produce correct segments");

      data = 4'd8; #10;
      assert(segments === 7'b111_1111) else $error("8 does not produce correct segments");

      data = 4'd9; #10;
      assert(segments === 7'b111_0011) else $error("9 does not produce correct segments");

      // Test default (invalid inputs)
      data = 4'd10; #10;
      assert(segments === 7'b000_0000) else $error("10 does not produce default behaviour");
      data = 4'd15; #10;
      assert(segments === 7'b000_0000) else $error("15 does not produce default behaviour");
      data = 4'd12; #10;
      assert(segments === 7'b000_0000) else $error("12 does not produce default behaviour");

      $finish;
   end

   
endmodule // sevenseg_tb
