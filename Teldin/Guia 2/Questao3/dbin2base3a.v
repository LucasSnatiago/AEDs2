module dbin2base;

reg[5:0] variavel = 'b101110;

initial
begin : main

	$display("Resultado: 0.%d%d%d", variavel[5:4], variavel[3:2], variavel[1:0]);


end
endmodule
