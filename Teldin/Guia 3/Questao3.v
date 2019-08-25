//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888

module Questao3;

reg signed [3:0] a = 4'b1101;  //Numero na base 2
reg signed [3:0] a2;  //Numero invertido

reg signed [5:0] b = 6'b110011; //Numero na base 2
reg signed [5:0] b2; //Numero invertido

reg signed [5:0] c = 6'b111101; //Numero na base 2
reg signed [5:0] c2; //Numero invertido

reg signed [6:0] d = 7'b1011111; //Numero na base 2
reg signed [6:0] d2; //Numero invertido

reg signed [7:0] e = 8'b10111101; //Numero na base 2
reg signed [7:0] e2; //Numero invertido


initial
begin : main
	
	a2 = ~(a-1);
	$display("Valor a: %d", a2);

	b2 = ~(b-1);
	$display("Valor b: %d", b2);

	c2 = ~(c-1);
	$display("Valor c: %b", c2);

	d2 = ~(d-1);
	$display("Valor d: %b", d2);

	e2 = ~(e-1);
	$display("Valor e: %h", e2);	
	

end
endmodule
