module Guia2_1c;

real resp = 0;
real numero = 1.0;
reg[4:0] c = 'b01010;
integer contador = 4;

initial
begin: main
	
	while(contador >= 0)
	begin
		numero = numero / 2.0;
		if (c[contador] == 1)
		begin
			resp = resp + numero;
		end
		contador = contador - 1;
	end
	
	$display("c = %f", resp);
	

end
endmodule
