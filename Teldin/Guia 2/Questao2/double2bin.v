module double2bin;

real double = 0.06250; 
integer contador = 7;
reg[7:0] bin = 0;



initial
begin : main

	while(double > 0 && bin >= 0)
	begin
		if(double*2.0 >= 1.0)
		begin
			bin[contador] = 1.0;
			double = double*2.0 - 1.0;
		end

		else
		begin
			bin[contador] = 0;
			double = double*2.0;
		end
		contador = contador - 1;
	end

	$display("Binario = 0.%b", bin);

end

endmodule
