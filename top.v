module top(
	input enable,
	input [2:0] difficulty,
	input clk,
	input rst,
	input [7:0] switch, //the seven switches should be wired here
	
	output hit,
	output miss,
	output [7:0] LED
);

reg [12:0] rnd;
wire freq;

freq uut(
	//inputs
	.clk(clk),
	.rst(rst),
	.enable(enable), //enable frequency to send pulses
	.difficulty(difficulty),

	//outputs
	.freq(freq)
);


LFSR uut1(
	//inputs
	.clock(clk),
	.reset(rst),
	
	//output
	.rnd(rnd),
	
);

randomizer uut2(
	//inputs
	.clk(clk),
	.rst(rst),
	.freq(freq),
	.rnd(rnd),
	
	//outputs
	.LED_num(LED)

);

hit uut3(
	.clk(clk),
	.rst(rst),
	.freq(freq),
	.LED(LED),
	.switch(switch),
	
	.hit(hit),
	.miss(miss)

); 