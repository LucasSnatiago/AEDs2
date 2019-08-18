module dbin2base;

reg[3:0] inteiro = 'b1001;
reg[2:0] var = 'b101;

initial
begin : main

	$display("Resultado: %h.%h", inteiro, var[2:0]);

end
endmodule
