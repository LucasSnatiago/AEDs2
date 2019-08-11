module questao4c;

reg[4:0]a = 'b11010;
reg[4:0]b = 'b10011;
reg[5:0]c = 'b101101;
reg[5:0]d = 'b110111;
reg[5:0]e = 'b110011;

initial
begin: main

	$display("a = %d%d%d", a[4], a[3:2], a[1:0]);
	$display("b = %d%d", b[4:3], b[2:0]);
	$display("c = %h", c);
	$display("d = %d%d", d[5:3], d[2:0]);
	$display("e = %d%d%d", e[5:4], e[3:2], e[1:0]);
	
end

endmodule
