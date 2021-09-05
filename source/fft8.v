module fft8(
	input [31:0]A0,
	input [31:0]A1,
	input [31:0]A2,
	input [31:0]A3,
	input [31:0]A4,
	input [31:0]A5,
	input [31:0]A6,
	input [31:0]A7,
	output [31:0]Xr0,
	output [31:0]Xr1,
	output [31:0]Xr2,
	output [31:0]Xr3,
	output [31:0]Xi0,
	output [31:0]Xi1,
	output [31:0]Xi2,
	output [31:0]Xi3,
	output [31:0]Xr4,
	output [31:0]Xr5,
	output [31:0]Xr6,
	output [31:0]Xr7,
	output [31:0]Xi4,
	output [31:0]Xi5,
	output [31:0]Xi6,
	output [31:0]Xi7);

reg[31:0] sin[0:3];
reg[31:0] cos[0:3];
initial begin
	$readmemh("hexdata/sine.data",sin);
	$readmemh("hexdata/cosine.data",cos);
end


wire[31:0] Xr0_,Xr1_,Xr2_,Xr3_,Xi0_,Xi1_,Xi2_,Xi3_;
wire[31:0] Xr4_,Xr5_,Xr6_,Xr7_,Xi4_,Xi5_,Xi6_,Xi7_;
wire[31:0] Kr0,Kr2,Kr3,Kr1,Ki0,Ki1,Ki2,Ki3,Kr7,Ki7,Kr6,Ki6;
wire[31:0] Lr1,Lr5,Lr3,Lr7,Li1,Li5,Li3,Li7;
wire[31:0] Tr0,Ti0,Tr1,Ti1,Tr2,Ti2,Tr3,Ti3,Tr4,Ti4,Tr5,Ti5,Tr6,Ti6,Tr7,Ti7;


fft2 rd1(A0,0,A4,0,Xr0_,Xi0_,Xr4_,Xi4_);
fft2 rd2(A2,0,A6,0,Xr2_,Xi2_,Kr6,Ki6);
fft2 rd3(A1,0,A5,0,Xr1_,Xi1_,Xr5_,Xi5_);
fft2 rd4(A3,0,A7,0,Xr3_,Xi3_,Kr7,Ki7);

//fft2 rd2(A2,0,A6,0,Xr2_,Xi2_,Xr6_,Xi6_);
//fft2 rd4(A3,0,A7,0,Xr3_,Xi3_,Xr7_,Xi7_);
complex_mul s1(Kr6,Ki6,0,32'b11111111111111111111111111111111,Xr6_,Xi6_);
complex_mul s2(Kr7,Ki7,0,32'b11111111111111111111111111111111,Xr7_,Xi7_);


fft_n4 r1(Xr0_,Xi0_,Xr4_,Xi4_,Xr2_,Xi2_,Xr6_,Xi6_,Tr0,Ti0,Tr4,Ti4,Tr2,Ti2,Tr6,Ti6);
fft_n4 r2(Xr1_,Xi1_,Xr5_,Xi5_,Xr3_,Xi3_,Xr7_,Xi7_,Lr1,Li1,Lr5,Li5,Lr3,Li3,Lr7,Li7);

complex_mul m4(Lr1,Li1,1,0,Tr1,Ti1);
complex_mul m5(Lr5,Li5,cos[1],sin[1],Tr5,Ti5);
complex_mul m6(Lr3,Li3,cos[2],sin[2],Tr3,Ti3);
complex_mul m7(Lr7,Li7,cos[3],sin[3],Tr7,Ti7);

assign Xr0 = Tr0 + Tr1;
assign Xi0 = Ti0 + Ti1;
assign Xr1 = Tr4 + Tr5;
assign Xi1 = Ti4 + Ti5;
assign Xr2 = Tr2 + Tr3;
assign Xi2 = Ti2 + Ti3;
assign Xr3 = Tr6 + Tr7;
assign Xi3 = Ti6 + Ti7;
assign Xr4 = Tr0 - Tr1;
assign Xi4 = Ti0 - Ti1;
assign Xr5 = Tr4 - Tr5;
assign Xi5 = Ti4 - Ti5;
assign Xr6 = Tr2 - Tr3;
assign Xi6 = Ti2 - Ti3;
assign Xr7 = Tr6 - Tr7;
assign Xi7 = Ti6 - Ti7;


//Below is one way of computing that didnt work out well
/*fft_n4 radix1(A0,A2,A4,A6,Xr0_,Xr1_,Xr2_,Xr3_,Xi0_,Xi1_,Xi2_,Xi3_);
fft_n4 radix2(A1,A3,A5,A7,Lr4,Lr5,Lr6,Lr7,Li4,Li5,Li6,Li7);

complex_mul m4(Lr4,Li4,cos[0],sin[0],Xr4_,Xi4_);
complex_mul m5(Lr5,Li5,cos[1],sin[1],Xr5_,Xi5_);
complex_mul m6(Lr6,Li6,cos[2],sin[2],Xr6_,Xi6_);
complex_mul m7(Lr7,Li7,cos[3],sin[3],Xr7_,Xi7_);

fft2 rd1(Xr0_,Xi0_,Xr4_,Xi4_,Xr0,Xi0,Xr4,Xi4);
fft2 rd2(Xr1_,Xi1_,Xr5_,Xi5_,Xr1,Xi1,Xr5,Xi5);
fft2 rd3(Xr2_,Xi2_,Xr6_,Xi6_,Xr2,Xi2,Xr6,Xi6);
fft2 rd4(Xr3_,Xi3_,Xr7_,Xi7_,Xr3,Xi3,Xr7,Xi7);
*/
endmodule

