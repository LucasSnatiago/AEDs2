//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888

module Questao5;

reg[7:0] a = 'b101010; //Primeiro operando
reg[7:0] a2 = 'b1011; //Segundo operando
reg[7:0] respA; //Resposta da A

reg[7:0] b = 'b101; //Parte inteira do primeiro operando
reg[7:0] bFrac = 'b11010000; //Parte fracionada do primeiro operando
reg[7:0] b2 = 'o2; //Parte inteira do segundo operando
reg[7:0] b2Frac = 'o500; //Parte fracionada do segundo operando
reg[7:0] respB; //Resposta da parte inteira
reg[7:0] respBFrac; //Resposta da parte fracionada

reg[7:0] c; //Parte inteira do primeiro operando
reg[7:0] c2 = 'hb; //Segundo operando
reg[7:0] respC; //Resposta

reg[7:0] d = 'hab; //Primeiro operando
reg[7:0] d2 = 'b1001111; //Segundo operando
reg[7:0] respD; //Resposta

reg[7:0] e = 36; //Primeiro operando
reg[7:0] e2 = 'h2c; //Segundo operando
reg[7:0] respE; //Resposta


initial
begin : main

	respA = 1 + (a + ~a2); //Subtracao usando soma de um termo com o complemtento de 2 do outro

	respB = 1 + (b + ~b2);
	respBFrac = 1 + (bFrac + ~b2Frac);

	c[1:0] = 2;
	c[3:2] = 1;
	c[5:4] = 3;
	c[7:6] = 0;
	respC = 1 + (c + ~c2);

	respD = 1 + (d + ~d2);

	respE = 1 + (e + ~e2);

	$display("a) %b", respA);
	$display("b) %b,%b", respB, respBFrac);
	$display("c) %b", respC);
	$display("d) %b", respD);
	$display("e) %b", ~respE);


end
endmodule
