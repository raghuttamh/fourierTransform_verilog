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
	$monitor("Signal\n",A0," ",A1," ",A2," ",A3," ",A4," ",A5," ",A6," ",A7,"\nFT\n",Xr0[31:0]," ",Xr1[31:0]," ",Xr2[31:0]," ",Xr3[31:0]," ",Xr4[31:0]," ",Xr5[31:0]," ",Xr6[31:0]," ",Xr7[31:0],"\n",Xi0[31:0]," ",Xi1[31:0]," ",Xi2[31:0]," ",Xi3[31:0]," ",Xi4[31:0]," ",Xi5[31:0]," ",Xi6[31:0]," ",Xi7[31:0]);
	$dumpfile("dump.vcd");$dumpvars;
	
	A0 = 1;
	A1 = 1;
	A2 = 1;
	A3 = 1;
	A4 = 1;
	A5 = 1;
	A6 = 1;
	A7 = 1;
	#10;
	
	A0 = 100;
	A1 = 0;
	A2 = 0;
	A3 = 0;
	A4 = 0;
	A5 = 0;
	A6 = 0;
	A7 = 0;
	#10;
	
	A0 = 30;
	A1 = 20;
	A2 = 10;
	A3 = 00;
	A4 = 00;
	A5 = 10;
	A6 = 20;
	A7 = 30;
	#10;

	$finish;
end
endmodule

