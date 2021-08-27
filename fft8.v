module fft8(
	input [7:0]A0,
	input [7:0]A1,
	input [7:0]A2,
	input [7:0]A3,
	input [7:0]A4,
	input [7:0]A5,
	input [7:0]A6,
	input [7:0]A7,
	output [7:0]Xr0,
	output [7:0]Xr1,
	output [7:0]Xr2,
	output [7:0]Xr3,
	output [7:0]Xi0,
	output [7:0]Xi1,
	output [7:0]Xi2,
	output [7:0]Xi3,
	output [7:0]Xr4,
	output [7:0]Xr5,
	output [7:0]Xr6,
	output [7:0]Xr7,
	output [7:0]Xi4,
	output [7:0]Xi5,
	output [7:0]Xi6,
	output [7:0]Xi7);


wire[7:0] Xr0_,Xr1_,Xr2_,Xr3_,Xi0_,Xi1_,Xi2_,Xi3_;
wire[7:0] Xr4_,Xr5_,Xr6_,Xr7_,Xi4_,Xi5_,Xi6_,Xi7_;
wire[7:0] Lr4,Lr5,Lr6,Lr7,Li4,Li5,Li6,Li7;
fft_n4 radix1(A0,A2,A4,A6,Xr0_,Xr1_,Xr2_,Xr3_,Xi0_,Xi1_,Xi2_,Xi3_);
fft_n4 radix2(A1,A3,A5,A7,Lr4,Lr5,Lr6,Lr7,Li4,Li5,Li6,Li7);

complex_mul m4(Lr4,Li4,8'b01100100,8'b00000000,Xr4_,Xi4_);
complex_mul m5(Lr5,Li5,8'b01000110,8'b01000110,Xr5_,Xi5_);
complex_mul m6(Lr6,Li6,8'b00000000,8'b01100100,Xr6_,Xi6_);
complex_mul m7(Lr7,Li7,8'b11000110,8'b01000110,Xr7_,Xi7_);

fft2 rd1(Xr0_,Xi0_,Xr4_,Xi4_,Xr0,Xi0,Xr4,Xi4);
fft2 rd2(Xr1_,Xi1_,Xr5_,Xi5_,Xr1,Xi1,Xr5,Xi5);
fft2 rd3(Xr2_,Xi2_,Xr6_,Xi6_,Xr2,Xi2,Xr6,Xi6);
fft2 rd4(Xr3_,Xi3_,Xr7_,Xi7_,Xr3,Xi3,Xr7,Xi7);

endmodule

