module fft4_test;
reg [31:0]A0;
reg [31:0]A1;
reg [31:0]A2;
reg [31:0]A3;
reg [31:0]A4;
reg [31:0]A5;
reg [31:0]A6;
reg [31:0]A7;

wire [31:0]Xr0;
wire [31:0]Xr1;
wire [31:0]Xr2;
wire [31:0]Xr3;
wire [31:0]Xi0;
wire [31:0]Xi1;
wire [31:0]Xi2;
wire [31:0]Xi3;
wire [31:0]Xr4;
wire [31:0]Xr5;
wire [31:0]Xr6;
wire [31:0]Xr7;
wire [31:0]Xi4;
wire [31:0]Xi5;
wire [31:0]Xi6;
wire [31:0]Xi7;

fft8 f(A0,A1,A2,A3,A4,A5,A6,A7,Xr0,Xr1,Xr2,Xr3,Xi0,Xi1,Xi2,Xi3,Xr4,Xr5,Xr6,Xr7,Xi4,Xi5,Xi6,Xi7);
initial begin
	$monitor(Xr0[30:0]," ",Xr1[30:0]," ",Xr2[30:0]," ",Xr3[30:0]," ",Xr4[30:0]," ",Xr5[30:0]," ",Xr6[30:0]," ",Xr7[30:0],"\n",Xi0[30:0]," ",Xi1[30:0]," ",Xi2[30:0]," ",Xi3[30:0]," ",Xi4[30:0]," ",Xi5[30:0]," ",Xi6[30:0]," ",Xi7[30:0],"\n");
	A0 = 120;
	A1 = 130;
	A2 = 0;
	A3 = 110;
	A4 = 0;
	A5 = 150;
	A6 = 200;
	A7 = 0;
	
	#10;
	$finish;
end
endmodule


