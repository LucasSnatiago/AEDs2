module dbin2base;

reg[5:0] var = 'b101110;

initial
begin : main

	$display("Resultado: 0.%h%h", var[5:2], var[1:0]);

end
endmodule
