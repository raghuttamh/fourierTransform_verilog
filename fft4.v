// Code your design here
module fft_n4(
	input logic [1:0]x [3:0],
	output logic [3:0]Xr [3:0],
	output logic [3:0]Xi [3:0]);

always @(x[0],x[1],x[2],x[3])
begin
	 Xr[0] <= x[0]+x[1]+x[2]+x[3];
	Xi[0] <= 4'b0000;
	Xr[1] <= x[0]-x[2];
  	Xi[1] <= x[3]-x[1];
	Xr[2] <= x[0]-x[1]+x[2]-x[3];
	Xi[2] <= 4'b0000;
	Xr[3] <= x[0]-x[2];
  	Xi[3] <= x[1]-x[3];
end
endmodule
