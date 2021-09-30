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

reg [31:0] sin[0:3];
reg [31:0] cos[0:3];
initial begin
	$readmemh("hexdata/sine.txt",sin);
	$readmemh("hexdata/cosine.txt",cos);
end

wire [31:0] ar0,ar1,ar2,ar3,ar4,ar5,ar6,ar7,ai0,ai1,ai2,ai3,ai4,ai5,ai6,ai7;
wire [31:0] br0,br1,br2,br3,br4,br5,br6,br7,bi0,bi1,bi2,bi3,bi4,bi5,bi6,bi7;
wire [31:0] tr0,tr1,tr2,tr3,ti0,ti1,ti2,ti3,tr4,tr5,tr6,tr7,ti4,ti5,ti6,ti7;
wire [31:0] rr3,ri3,rr7,ri7;

assign tr0 = A0 + A4;
assign tr1 = A1 + A5;
assign tr2 = A2 + A6;
assign tr3 = A3 + A7;
assign tr4 = A0 - A4;
assign tr5 = A1 - A5;
assign tr6 = A2 - A6;
assign tr7 = A3 - A7;
assign ti0 = 0;
assign ti1 = 0;
assign ti2 = 0;
assign ti3 = 0;
assign ti4 = 0;
assign ti5 = 0;
assign ti6 = 0;
assign ti7 = 0;

complex_mul m0(tr0,ti0,cos[0],sin[0],ar0,ai0);
complex_mul m1(tr1,ti1,cos[0],sin[0],ar1,ai1);
complex_mul m2(tr2,ti2,cos[0],sin[0],ar2,ai2);
complex_mul m3(tr3,ti3,cos[0],sin[0],ar3,ai3);
complex_mul m4(tr4,ti4,cos[0],sin[0],ar4,ai4);
complex_mul m5(tr5,ti5,cos[1],sin[1],ar5,ai5);
complex_mul m6(tr6,ti6,cos[2],sin[2],ar6,ai6);
complex_mul m7(tr7,ti7,cos[3],sin[3],ar7,ai7);


fft_n4 ff1(ar0,ai0,ar1,ai1,ar2,ai2,ar3,ai3,br0,bi0,br1,bi1,br2,bi2,br3,bi3);
fft_n4 ff2(ar4,ai4,ar5,ai5,ar6,ai6,ar7,ai7,br4,bi4,br5,bi5,br6,bi6,br7,bi7);

/*
assign br0 = ar0 + ar2;
assign br1 = ar1 + ar3;
assign br2 = ar0 - ar2;
assign br3 = ar1 - ar3;
assign br4 = ar4 + ar6;
assign br5 = ar5 + ar7;
assign br6 = ar4 - ar6;
assign br7 = ar5 - ar7;
assign bi0 = ai0 + ai2;
assign bi1 = ai1 + ai3;
assign bi2 = ai0 - ai2;
assign bi3 = ai1 - ai3;
assign bi4 = ai4 + ai6;
assign bi5 = ai5 + ai7;
assign bi6 = ai4 - ai6;
assign bi7 = ai5 - ai7;
*/
complex_mul n1(br3,bi3,0,32'b11111111111111111111111111111111,rr3,ri3);
complex_mul n2(br7,bi7,0,32'b11111111111111111111111111111111,rr7,ri7);

fft2 f1(br0,bi0,br1,bi1,Xr0,Xi0,Xr4,Xi4);
fft2 f2(br2,bi2,rr3,ri3,Xr2,Xi2,Xr6,Xi6);
fft2 f3(br4,bi4,br5,bi5,Xr1,Xi1,Xr5,Xi5);
fft2 f4(br6,bi6,rr7,ri7,Xr3,Xi3,Xr7,Xi7);


endmodule

