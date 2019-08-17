module Guia2_1b;

real resp = 0;
real numero = 1.0;
reg[4:0] b = 'b01100;
integer contador = 4;


initial
begin: main
	
	while(contador >= 0)
	begin
		numero = numero / 2.0;
		if (b[contador] == 1)
		begin
			resp = resp + numero;
		end
		contador = contador - 1;
	end
	
	$display("b = %f", resp);
	

end
endmodule
