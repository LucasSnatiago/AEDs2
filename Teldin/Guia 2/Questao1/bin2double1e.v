module Guia2_1e;

real resp = 0;
real numero = 1.0;
reg[4:0] e = 'b01011;
integer contador = 4;


initial
begin: main
	
	while(contador >= 0)
	begin
		numero = numero / 2.0;
		if (e[contador] == 1)
		begin
			resp = resp + numero;
		end
		contador = contador - 1;
	end
	
	resp = resp + 3;

	$display("e = %f", resp);
	

end
endmodule
