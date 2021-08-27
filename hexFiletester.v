module hexTest;
reg [7:0]cos[0:3];
reg [7:0]sin[0:3];
integer i;
initial begin
	$readmemh("cosine.data",cos);
       	$readmemh("sine.data",sin);
end
initial begin
	for(i=0;i<4;i=i+1)
		$display("Twiddle Factor = ",cos[i]," + ",sin[i],"j");
end
endmodule
