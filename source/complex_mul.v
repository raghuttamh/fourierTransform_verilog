module complex_mul(
	input signed [31:0]Xr,
	input signed [31:0]Xi,
	input signed [31:0]Yr,
	input signed [31:0]Yi,
	output signed [31:0]Pr,
	output signed [31:0]Pi);

assign Pr = (Xr*Yr)-(Xi*Yi);
assign Pi = (Xr*Yi)+(Xi*Yr);
endmodule
