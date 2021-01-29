module syn (output sync_clk,
input fast_clk,
input slow_clk,
input rst,
input out,
input [3:0] data_in,
output reg [3:0]data_out
);
reg a, b,c,d;
always@(posedge slow_clk or posedge rst)
begin
	if(rst) a <= 1'b0;
	else if(out) a <= !a;
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
//assign data_out = sync_clk? data_in:0;

always@(posedge fast_clk)
begin
	if(rst)begin
		data_out <= 0;
	end
		else if(sync_clk==1)  begin
		data_out <= data_in;
	end
end

endmodule
