module dbin2base;

reg[5:0] var = 'b110101;

initial
begin : main

	$display("Resultado: 0.%d%d", var[5:3], var[2:0]);

end
endmodule
