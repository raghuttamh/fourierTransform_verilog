module fft2(
	input [7:0]xr,
	input [7:0]xi,
	input [7:0]yr,
	input [7:0]yi,
	output [7:0]Xr,
	output [7:0]Xi,
	output [7:0]Yr,
	output [7:0]Yi);

assign Xr = xr + yr;
assign Yr = xr - yr;
assign Xi = xi + yi;
assign Yi = xi - yi;
endmodule
