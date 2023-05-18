`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:27:56 05/11/2023
// Design Name:   CAM
// Module Name:   /tmp/structural_modelling/tb_cam.v
// Project Name:  structural_modelling
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cam;

	// Inputs
	reg [7:0] data0;
	reg [7:0] data1;
	reg [7:0] data2;
	reg [7:0] data3;
	reg [7:0] data4;
	reg [7:0] data5;
	reg [7:0] data6;
	reg [7:0] data7;
	reg [7:0] addr;
	reg [7:0] data_in;
	reg write;
	reg read;

	// Outputs
	wire srch0;
	wire srch1;
	wire srch2;
	wire srch3;
	wire srch4;
	wire srch5;
	wire srch6;
	wire srch7;
	wire [7:0] status;

	// Instantiate the Unit Under Test (UUT)
	CAM uut (
		.data0(data0), 
		.data1(data1), 
		.data2(data2), 
		.data3(data3), 
		.data4(data4), 
		.data5(data5), 
		.data6(data6), 
		.data7(data7), 
		.addr(addr), 
		.data_in(data_in), 
		.srch0(srch0), 
		.srch1(srch1), 
		.srch2(srch2), 
		.srch3(srch3), 
		.srch4(srch4), 
		.srch5(srch5), 
		.srch6(srch6), 
		.srch7(srch7), 
		.write(write), 
		.read(read), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		data0 = 8'hAB;
		data1 = 8'hCB;
		data2 = 8'hAC;
		data3 = 8'hCC;
		data4 = 8'hAD;
		data5 = 8'hDB;
		data6 = 8'hDC;
		data7 = 8'hFB;
		addr = 8'b10101011;
				write = 1;
		#100
		read = 1;
data_in =8'hAD ;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

