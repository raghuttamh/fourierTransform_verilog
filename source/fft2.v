module fft2(
	input [31:0]xr,
	input [31:0]xi,
	input [31:0]yr,
	input [31:0]yi,
	output [31:0]Xr,
	output [31:0]Xi,
	output [31:0]Yr,
	output [31:0]Yi);

assign Xr = xr + yr;
assign Yr = xr - yr;
assign Xi = xi + yi;
assign Yi = xi - yi;
endmodule
