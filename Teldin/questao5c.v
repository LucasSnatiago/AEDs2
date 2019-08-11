module conversor;

reg[8:0][7:0]  puc = "PUC-Minas";
reg[5:0][7:0]  ano = "2019-2";
reg[5:0][7:0]  brasil = "Brasil";
reg[0:4][7:0]  numero;
reg[6:0][7:0]  hexa = 'h422e482e2d4d47;


initial	
begin: main

	numero[0] = 078;
	numero[1] = 111;
	numero[2] = 105;
	numero[3] = 116;
	numero[4] = 101;

	$display("a = %h", puc);
	$display("b = %h", ano);
	$display("c = %b", brasil);
       	$display("d = %s", numero);
	$display("e = %s", hexa);	

end
endmodule
