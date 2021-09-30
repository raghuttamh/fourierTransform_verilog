module sendSignal(
	input clk,
	input[31:0] data,
	output[31:0] Xr0,
	output[31:0] Xr1,
	output[31:0] Xr2,
	output[31:0] Xr3,
	output[31:0] Xr4,
	output[31:0] Xr5,
	output[31:0] Xr6,
	output[31:0] Xr7,
	output[31:0] Xi0,
	output[31:0] Xi1,
	output[31:0] Xi2,
	output[31:0] Xi3,
	output[31:0] Xi4,
	output[31:0] Xi5,
	output[31:0] Xi6,
	output[31:0] Xi7
	);

reg[31:0] A0,A1,A2,A3,A4,A5,A6,A7;
always @ (posedge clk)
begin
	A7 <= A6;
	A6 <= A5;
	A5 <= A4;
	A4 <= A3;
	A3 <= A2;
	A2 <= A1;
	A1 <= A0;
	A0 <= data;
	
end
fft8 ff(A0,A1,A2,A3,A4,A5,A6,A7,Xr0,Xr1,Xr2,Xr3,Xi0,Xi1,Xi2,Xi3,Xr4,Xr5,Xr6,Xr7,Xi4,Xi5,Xi6,Xi7);	
endmodule
	
