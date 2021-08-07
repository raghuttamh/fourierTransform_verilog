module test;
logic [1:0]x [3:0];
logic [3:0]Xr [3:0];
logic [3:0]Xi [3:0];


initial begin
	x[0] = 2'b10;
	x[1] = 2'b01;
	x[2] = 2'b00;
	x[3] = 2'b01;
end
fft_n4 DUT(.x,.Xr,.Xi);
initial begin
	#10;
	$display("Input -> \n",x[0],"\n",x[1],"\n",x[2],"\n",x[3],"\n");
	#10;
	$display(Xr[0]," + j ",Xi[0],"\n",Xr[1]," + j ",Xi[1],"\n",Xr[2]," + j ",Xi[2],"\n",Xr[3]," + j ",Xi[3]);
	$finish;
end
endmodule
