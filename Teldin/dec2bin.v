module dec2bin;

reg[7:0] a = 25;
reg[7:0] b = 50;
reg[9:0] c = 713;
reg[7:0] d = 125;
reg[7:0] e = 365;


initial
begin: main

   $display("a = %b", a);
   $display("b = %b", b);
   $display("c = %b", c);
   $display("d = %b", d);
   $display("e = %b", e);
  
   
end

endmodule
