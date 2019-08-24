module Questao4;

reg signed[4:0] a = 'b10111; //Valor na base 2
reg signed[3:0] a2 = 'b1101; //Valor na base 2 para ser subtraido
reg signed[4:0] respA; //Resposta da A

reg signed[2:0] b = 'b101; //Parte inteira da letra b
reg signed[3:0] bFracionado = 'b0111; //Parte fracionada para b
reg signed[2:0] b2 = 'b10; //Parte inteira do segundo operando de b
reg signed[3:0] b2Fracionado = 'b0100;  //Parte fracionada do segundo operando de b
reg signed[3:0] respB; //Resposta da questao b
reg signed[3:0] respBfracionada; //Resposta da parte fracionada de b

reg signed[3*3:0] c; //

