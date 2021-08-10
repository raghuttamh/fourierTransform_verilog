module fft2(
	input [3:0]xr,
	input [3:0]xi,
	input [3:0]yr,
	input [3:0]yi,
	output [3:0]Xr,
	output [3:0]Xi,
	output [3:0]Yr,
	output [3:0]Yi);

assign Xr = xr + yr;
assign Yr = xr - yr;
assign Xi = xi + yi;
assign Yi = xi - yi;
endmodule
