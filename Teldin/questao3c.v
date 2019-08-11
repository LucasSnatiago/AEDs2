module conversor;

reg[6:0] a = 77;
reg[15:0] b = 45;
reg[15:0] c = 67;
reg[15:0] d = 171;
reg[15:0] e = 135;


initial
begin: main

   $display("a = %d%d%d%d", a[6], a[5:4], a[3:2], a[1:0]);
   $display("b = %o", b);
   $display("c = %h", c);
   $display("d = %h", d);
   $display("e = %h", e);

end

endmodule
