module Questao2;

reg[2:0][2:0] a; //Valor na base 4
reg[5:0] a2 = 0; //Valor na base 2

reg[7:0] b = 'h5B;

reg[2:0][2:0] c; //Valor na base 4
reg[5:0] c2 = 0; //Valor na base 2
reg[5:0] c3 = 0; //Valor invertido na base 2

reg[6:0] d = 'o175;
reg[6:0] d2 = 0;

reg[7:0] e = 'hB2;
reg[7:0] e2 = 0;

initial
begin : main

	a[0] = 3;
	a[1] = 2;
	a[2] = 1;

	a2[1:0] = a[2];
	a2[3:2] = a[1];
	a2[5:4] = a[0];

	c[1] = 2;
	c[0] = 3;

	c2[1:0] = c[0];
       	c2[3:2] = c[1];

	c3 = ~c2+1;

	d2 = ~d+1;

	e2 = ~e+1;

	$display("O complemento do numero %b é %b.", a2, ~a2);
	$display("O complemento do numero %b é %b.", b, ~b);
	$display("O complemento do numero %b é %b.", c2, c3);
	$display("O complemento do numero %b é %b.", d, d2);
	$display("O complemento do numero %b é %b.", e, e2);

end
endmodule
