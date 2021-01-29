`timescale 1ns/1ns
module sync_tb;
reg slow_clk;
reg fast_clk;
wire sync_clk;
reg rst;
wire out;
wire [3:0] data_in;
wire [3:0] data_out_in;
wire [3:0] data_out;

reg en;

syn sy(.rst(rst), .slow_clk(slow_clk),
.fast_clk(fast_clk), .sync_clk(sync_clk),
.out(out), .data_in(data_out_in), .data_out(data_out));


count_sl c_sl(.clk(slow_clk), .rst(rst),
.en(en), .out(out), .data_out(data_out_in));


initial
begin
#5;	rst = 1;
#62; rst = 0; en = 1;

end
initial
begin
	fast_clk = 0;
	forever #4 fast_clk = ~fast_clk;
end

initial
begin
	slow_clk = 0;
	forever #21 slow_clk = ~slow_clk;
end

initial
begin
	$dumpfile("syn_tb.vcd");
	$dumpvars();
	#1500 $finish;
end
endmodule
