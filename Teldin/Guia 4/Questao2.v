//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888
//
//Questao 2


module A (output a, input x, y);

	assign a = x & ~(x | y);

endmodule

module B (output b, b2, input x, y);

	assign b = (x | ~y) | (x & y);
	assign b2 = x | (~y & y);

endmodule

module C (output c, c2, input x, y);

	assign c = ~(x & y) & (~x | ~y);
	assign c2 = ~((x & y) & (x | y));

endmodule

module D (output d, d2, input x, y);

	assign d = ~(~x & y) | ~(x | ~y);
	assign d2 = (x & ~y) | (~x | y);

endmodule

module E (output e, e2, input x, y);

	assign e = ~(y | x) & (~y | ~x);
	assign e2 = (~y | ~x) & (~y | ~x);

endmodule


module Programa;

	reg x, y;
	wire a, b, b2, c, c2, d, d2, e, e2;

	A letraA (a, x, y);
	B letraB (b, b2, x, y);
	C letraC (c, c2, x, y);
	D letraD (d, d2, x, y);
	E letraE (e, e2, x, y);

initial
begin : start

	x = 1'bx;
	y = 1'bx;

end

initial 
begin : main

	$display("Exemplo: Lucas Santiago de Oliveira - 650888");
	$display("Expressoes Booleanas");

	$display(" x  y = a  b  b2  c  c2  d  d2  e  e2");
       	$monitor("%2b %2b  %2b %2b %2b  %2b %2b  %2b  %2b %2b %2b", x, y, a, b, b2, c, c2, d, d2, e, e2);

	#1 x = 0; y = 0;
	#1 x = 0; y = 1;
	#1 x = 1; y = 1;
	#1 x = 1; y = 0;

end
endmodule
