module mux4 (
             input logic [3:0] a,
             input logic       s0, s1,
             output logic      y
             );
   assign y = s1 ? (s0 ? a[3] : a[2])
                 : (s0 ? a[1] : a[0]);
   
endmodule // mux4
