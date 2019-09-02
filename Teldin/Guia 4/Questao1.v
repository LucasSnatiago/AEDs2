//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888
//
//Questao 1


module A (output a, input x,y,z);

	assign a = ~x & ~(~y | z); 

endmodule



module B (output b, input x, y, z);

	assign b = ~(~x | y) & ~z;

endmodule



module C (output c, input x, y, z);

	assign c = ~(~x | ~y) & ~z;

endmodule



module D (output d, input x, y, z);

	assign d = ~(x & y) | ~z;

endmodule



module E (output e, input x, y, z);

	assign e = (~x | y) & (x | ~z);

endmodule


module ValoresIniciais;

reg x, y, z;
wire a, b, c, d, e;

	A letraA (a, x, y, z);
	B letraB (b, x, y, z);
	C letraC (c, x, y, z);
	D letraD (d, x, y, z);
	E letraE (e, x, y, z);	

initial
begin : start

	x = 1'bx;
	y = 1'bx;
	z = 1'bx;

end

initial
begin : main

	$display("Exemplo - Lucas Santiago de Oliveira - 650888");
	$display("Expressoes booleanas");
	
	$display(" x  y  z =  a  b  c  d  e");
	$monitor("%2b %2b %2b = %2b %2b %2b %2b %2b", x, y, z, a, b, c, d, e);
		
	#1 x = 0; y = 0; z = 0;
	#1 x = 0; y = 0; z = 1;
	#1 x = 0; y = 1; z = 0;
	#1 x = 0; y = 1; z = 1;
	#1 x = 1; y = 0; z = 1;
	#1 x = 1; y = 1; z = 1;
	#1 x = 1; y = 0; z = 0;
	#1 x = 1; y = 1; z = 0;

end
endmodule
