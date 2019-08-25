//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888

module Questao1;

reg[5:0] a = 'b1001;
reg[7:0] b = 'b1101;
reg[5:0] c = 'b101111;
reg[6:0] d = 'b10011;
reg[7:0] e = 'b11011;

reg[5:0] c2 = 0;
reg[6:0] d2 = 0; 
reg[7:0] e2 = 0;

initial
begin : main

	$display("Bits normais letra A = %b, complemento de 1 da letra A = %b", a, ~a);
	$display("Bits normais letra B = %b, complemento de 1 da letra B = %b", b, ~b);
	c2 = ~c + 1;
	$display("Bits normais letra C = %b, complemento de 1 da letra C = %b", c, c2);
	d2 = ~d + 1;
	$display("Bits normais letra D = %b, complemento de 1 da letra D = %b", d, d2);
	e2 = ~e + 1;
	$display("Bits normais letra E = %b, complemento de 1 da letra E = %b", e, e2);

end
endmodule
