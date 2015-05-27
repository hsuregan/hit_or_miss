/* 
Everytime frequency sends pulse, this module changes LED number
Random number is fed in from lsfr
*/

module randomizer(
	input clk,
	input rst,
	input freq, //from the frequency module
	input[12:0] rnd, //from the lfsr module

	output [7:0] LED_num,
);

reg [2:0] LED;
//reg [31:0] one_sec;
//assign LED_on = one_sec < 100000000; //LED is on for 1 sec 


//replace LED number everytime frequency pulses
always @(posedge freq or posedge rst) begin
	if(rst) LED <= 0;
	else if(freq) begin
		LED <= {rnd[2:0]};
		case(LED) //switches on specific LED on the board
			0: LED_num <= 0'b00000001;
			1: LED_num <= 0'b00000010;
			2: LED_num <= 0'b00000100;
			3: LED_num <= 0'b00001000;
			4: LED_num <= 0'b00010000;
			5: LED_num <= 0'b00100000;
			6: LED_num <= 0'b01000000;
			7: LED_num <= 0'b10000000;
			default: LED_num <= 0'b00000000;
		endcase
	end
end

//one_sec

/*
always @(posedge clk or posedge rst) begin 
	if(rst) one_sec <= 0;
	else if(freq) one_sec <= 0; //on freq pulse, one_sec begins to count
	else if(one_sec < 100000000) one_sec <= one_sec + 1; 
	//at 100000000, one_sec is frozen until freq brings one_sec back to zero 
	
end
*/
endmodule