module clase (clk, trigg, echo, dist);
input clk;
input echo;
output reg trigg;
output reg [9:0] dist;
reg [26:0] cont;

initial begin 
	cont = 0;
	trigg = clk;
	dist = 0;
	cont_t = 0;
end

always @(posedge clk) begin
	cont = cont + 1;
	
	if (cont<1024)
		trigg = 1'b1;
	else begin
		trigg = 1'b0;
		
		if (echo == 1)begin
			
			cont_t = cont_t + 1;
			dist = (cont_t*34/200_000)*2;
		
			end
		else if (echo == 0)begin
			
			cont_t = 0;
			
			end
		end
end

reg [26:0] cont_t;
//
//reg [13:0] cont_clk1;
//wire [6:0] display1;
//wire [6:0] display2;
//wire [6:0] display3;
//reg [1:0] cont_anodos;
//reg clk1;
//
//always @(posedge clk)begin
//	if (cont_clk1<10_000)
//	cont_clk1 = cont_clk1 + 13'b0000000000001;
//	
//	else begin
//	
//	clk1 = ~clk1;
//	cont_clk1 = 0;
//
//	end
//
//end
//
//displays d(clk, dist, display1, display2, display3);
//
//always @(posedge clk1)begin
//cont_anodos = cont_anodos + 2'b01;
//case (cont_anodos)
//	0: begin	anodos = 4'b1110; display = display1;	end
//	1: begin	anodos = 4'b1101; display = display2;  end
//	2: begin	anodos = 4'b1011; display = display3;  end
//	
//	endcase
//end

endmodule

