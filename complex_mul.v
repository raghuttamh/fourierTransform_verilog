module complex_mul(
	input [31:0]Xr,
	input [31:0]Xi,
	input [31:0]Yr,
	input [31:0]Yi,
	output [31:0]Pr,
	output [31:0]Pi);

assign Pr = (Xr*Yr)-(Xi*Yi);
assign Pi = (Xr*Yi)+(Xi*Yr);
endmodule
