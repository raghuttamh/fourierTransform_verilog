module complex_mul(
	input [3:0]Xr,
	input [3:0]Xi,
	input [3:0]Yr,
	input [3:0]Yi,
	output [3:0]Pr,
	output [3:0]Pi);

assign Pr = (Xr*Yr)-(Xi*Yi);
assign Pi = (Xr*Yi)+(Xi*Yr);
endmodule
