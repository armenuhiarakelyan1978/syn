module syn (output sync_clk,
input fast_clk,
input slow_clk,
input rst);
reg a, b,c,d;
always@(posedge slow_clk or posedge rst)
begin
	if(rst) a <= 1'b0;
	else a <= !a;
end
always@(posedge fast_clk or posedge rst)
	if(rst) begin
		b <= 1'b0;
		c <= 1'b0;
		d <= 1'b0;
	end
	else begin
		b <= a;
		c <= b;
		d <= c;
	end
assign sync_clk = d^c;
endmodule
