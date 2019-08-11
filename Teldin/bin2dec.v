module bin2dec;

reg[4:0] a = 'b11001;
reg[4:0] b = 'b10110;
reg[5:0] c = 'b100101;
reg[5:0] d = 'b111011;
reg[5:0] e = 'b111001;


initial
begin: main

   $display("a = %d", a);
   $display("b = %d", b);
   $display("c = %d", c);
   $display("d = %d", d);
   $display("e = %d", e);

end


endmodule
