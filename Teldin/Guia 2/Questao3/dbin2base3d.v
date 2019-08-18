module dbin2base;

reg[5:0] var = 'b110110;

initial
begin : main

	$display("Resultado: 1.%d%d", var[5:3], var[2:0]);

end
endmodule
