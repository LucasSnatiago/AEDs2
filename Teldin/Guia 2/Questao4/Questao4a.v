module dbase2base;

reg [1:0] a1 = 1;
reg[1:0] a2 = 2;
reg [1:0] a3 = 3;


initial
begin : main 

	$display("a = 0.%b%b%b", a1, a2, a3);

end
endmodule
