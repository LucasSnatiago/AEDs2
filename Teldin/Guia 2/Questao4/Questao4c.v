module dbase2base;

reg [7:0] c = 8'o157;
reg [7:0] cBin;

initial
begin : main 

	cBin[3] = c[7:6];
	cBin[2] = c[5:4];
	cBin[1] = c[3:2];
	cBin[0] = c[1:0];
	$display("c = 0.%b%b", cBin[3:2], cBin[1:0]);

end
endmodule
