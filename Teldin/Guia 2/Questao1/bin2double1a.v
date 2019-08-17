module Guia2_1a;

real resp = 0;
real numero = 1.0;
reg[4:0] a = 'b10101;
integer contador = 4;


initial
begin: main
	
	while(contador >= 0)
	begin
		numero = numero / 2.0;
		if (a[contador] == 1)
		begin
			resp = resp + numero;
		end
		contador = contador - 1;
	end
	
	$display("a = %f", resp);
	

end
endmodule
