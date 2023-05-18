`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:43:01 03/06/2023 
// Design Name: 
// Module Name:    CAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CAM(
input [7:0]data0,data1,data2,data3,data4,data5,data6,data7,
input [7:0]addr,
input [7:0]data_in,
output reg srch0,srch1,srch2,srch3,srch4,srch5,srch6,srch7,
input write,
input read,
output reg [7:0]status
    );
integer i;
reg [7:0] mem [7:0];



always @ (write)
begin
mem[0]=data0;
mem[1]=data1;
mem[2]=data2;
mem[3]=data3;
mem[4]=data4;
mem[5]=data5;
mem[6]=data6;
mem[7]=data7;
end

always @(*)
begin
srch0<= data_in[0];
srch1<= data_in[1];
srch2<= data_in[2];
srch3<= data_in[3];
srch4<= data_in[4];
srch5<= data_in[5];
srch6<= data_in[6];
srch7<= data_in[7];
end

always @(read)
begin
for(i=0;i<8;i=i+1)
begin
if(mem[i]==data_in)
begin
status[i]=1;
#50$display("matched in memory %d",il);
end
else
begin
status[i]=0;
end

end 
end

endmodule
