module	bh1750_driver(sys_clk, _rst, SCL, SDA, pwm, selectmode, numteclado);
input [3:0] numteclado;
input [3:0] selectmode;
input sys_clk, _rst;
inout SDA, SCL;	
output pwm;
//---------------------------------------------------//		
wire busy;//
wire [15:0]Rxdata;//
//---------------------------------------------------//	
	bh1750 #(.Freq_MegaHZ(50))
		U0(
			.sys_clk(sys_clk),
			._rst(_rst),
			.str(1'b1),
			.SCL(SCL),
			.SDA(SDA),
			.data(Rxdata),
			.busy(busy)
	);
//---------------------------------------------------//


led l(selectmode, sys_clk, pwm, Rxdata, numteclado);


endmodule
