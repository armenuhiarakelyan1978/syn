
module count_sl(
output  reg [3:0]data_out,
output  reg out,
input clk,
input en,
input rst
);
reg [3:0]count;

always@(posedge clk or posedge rst)
begin
	if(rst) begin
		data_out <= 0;
	        out <= 0;
		count <= 0;
	end
	else if(en)
	begin
		count <= count + 1;
		data_out <= count;
	        out <= 1;
	end
end

endmodule
