/*
Guia_0101.
*/
module Guia_0101;// define data
reg [7:0]x =  10; // Trocar de bin para dec

// actions
initial
	begin: main
		$display ( "b = %b", x );
	end// main

endmodule // Guia_0101
