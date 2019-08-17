module Guia2_1d;

real resp = 0;
real numero = 1.0;
reg[4:0] d = 'b01011;
integer contador = 4;


initial
begin: main
	
	while(contador >= 0)
	begin
		numero = numero / 2.0;
		if (d[contador] == 1)
		begin
			resp = resp + numero;
		end
		contador = contador - 1;
	end

	resp = resp + 1;
	
	$display("d = %f", resp);
	

end
endmodule
