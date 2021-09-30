module serial_ip_test_bench;
reg clk;
reg[31:0] data;
wire[31:0] Xr0,Xr1,Xr2,Xr3,Xr4,Xr5,Xr6,Xr7;
wire[31:0] Xi0,Xi1,Xi2,Xi3,Xi4,Xi5,Xi6,Xi7;

sendSignal DUT(clk,data,Xr0,Xr1,Xr2,Xr3,Xr4,Xr5,Xr6,Xr7,Xi0,Xi1,Xi2,Xi3,Xi4,Xi5,Xi6,Xi7);
initial begin
	clk = 0;
	forever #5 clk=~clk;
end
initial begin
	$monitor(data,"\n",Xr0,"  ",Xr1,"  ",Xr2,"  ",Xr3,"  ",Xr4,"  ",Xr5,"  ",Xr6,"  ",Xr7,"\n",
		Xi0,"  ",Xi1,"  ",Xi2,"  ",Xi3,"  ",Xi4,"  ",Xi5,"  ",Xi6,"  ",Xi7);
	$dumpfile("dump.vcd");$dumpvars;
	data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	#10 data = 1;
	#10 data = 10;
	$finish;
end
endmodule
