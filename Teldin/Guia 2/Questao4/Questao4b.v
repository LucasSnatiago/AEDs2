module dbase2base;

reg [7:0] b = 321;



initial
begin : main 

	$display("a = 0.%h%h", b[7:4], b[3:0]);

end
endmodule
