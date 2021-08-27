module complex_mul(
	input [7:0]Xr,
	input [7:0]Xi,
	input [7:0]Yr,
	input [7:0]Yi,
	output [7:0]Pr,
	output [7:0]Pi);

assign Pr = (Xr*Yr)-(Xi*Yi);
assign Pi = (Xr*Yi)+(Xi*Yr);
endmodule
