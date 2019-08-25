//Aluno: Lucas Santiago de Oliveira
//Matricula: 650888

module Questao4;

reg signed[4:0] a = 'b10111; //Valor na base 2
reg signed[3:0] a2 = 'b1101; //Valor na base 2 para ser subtraido
reg signed[4:0] respA; //Resposta da A

reg signed[2:0] b = 'b101; //Parte inteira da letra b
reg signed[3:0] bFracionado = 'b0111; //Parte fracionada para b
reg signed[2:0] b2 = 'b010; //Parte inteira do segundo operando de b
reg signed[3:0] b2Fracionado = 'b0100;  //Parte fracionada do segundo operando de b
reg signed[2:0] respB; //Resposta da questao b
reg signed[3:0] respBfracionada; //Resposta da parte fracionada de b

reg signed[5:0] c; //Primeiro operando
reg signed[5:0] c2; //Segundo operando
reg signed[5:0] cResp; //Resposta da operacao

reg signed[7:0] d = 'o321; //Primeiro operando
reg signed[6:0] d2 = 'o123; //Segundo operando
reg signed[7:0] dResp; //Resposta da operacao

reg signed[10:0] e = 'h7e6; //Primeiro operando
reg signed[11:0] e2 = 'ha1b; //Segundo operando
reg signed[11:0] eResp; //Resposta da operacao

initial
begin : main

	respA = (a - a2);

	respB = (b - b2);
	respBfracionada = (bFracionado - b2Fracionado);

	c[1:0] = 1;
	c[3:2] = 3;
	c[5:4] = 2;
	c2[1:0] = 3;
	c2[3:2] = 1;
	c2[5:4] = 1;
	cResp = (c - c2);

	dResp = (d - d2);

	eResp = (e - e2);

	$display("a) %b", respA);
        $display("b) %b,%b", respB, respBfracionada);
	$display("c) %d%d%d", cResp[5:4], cResp[3:2], cResp[1:0]);
	$display("d) %o", dResp);
	$display("e) %h", eResp);
		

end
endmodule

