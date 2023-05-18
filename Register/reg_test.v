module reg_test;
 
wire [15:0]zout;
reg [3:0] rs1,rs2,rd,func;
reg [7:0] addr;
reg clk1,clk2;
integer k;

register mypipe(zout,rs1,rs2,rd,func,addr,clk1,clk2);

initial 
begin
clk1=0;clk2=0;
repeat(20)
 begin
 #5 clk1=1; #5 clk1=0;
 #5 clk2=1; #5 clk2=0;
end
end

initial
for(k=0;k<=16;k=k+1)
mypipe.regbank[k]=k;

initial 
begin
#5 rs1=3; rs2=5; rd=10; func=0; addr=125;
#20 rs1=1; rs2=5; rd=12; func=2; addr=127;
#20 rs1=8; rs2=5; rd=11; func=1; addr=128;
#20 rs1=3; rs2=5; rd=13; func=4; addr=129;
#20 rs1=3; rs2=5; rd=14; func=6; addr=130;

#60 for(k=125;k<131;k=k+1)
$display("mem[%3d]=%d",k,mypipe.mem[k]);
end

initial
begin
$dumpfile("register.vod");
$dumpvars(0,reg_test);
$monitor("Time:%3d,f=%3d",$time,zout);
#300 $finish;
end
endmodule

module register(zout,rs1,rs2,rd,func,addr,clk1,clk2);
input [3:0]rs1,rs2,rd,func;
input [7:0]addr;
input clk1,clk2;
output [15:0]zout;
reg [15:0]a,b,l12_rd,l12_func,l12_addr,l23_z,l23_addr,l23_rd,l34_z,l34_addr;
reg [15:0] regbank [0:15];
reg [15:0] mem[0:255];

assign zout=l34_z;
always @(posedge clk1)
begin
a<= #2 regbank[rs1];
b<= #2 regbank[rs2];
l12_rd<= #2 rd;
l12_func<= #2 func;
l12_addr<= #2 addr;
end

always@(negedge clk2)
begin
case(l12_func)
0: l23_z <= #4 a+b;
1: l23_z <= #4 a-b;
2: l23_z <= #6 a*b;
3: l23_z <= #2 a;
4: l23_z <= #2 b;
5: l23_z <= #4 a&b;
6: l23_z <= #4 a|b;
7: l23_z <= #4 a^b;
8: l23_z <= #2 -a;
9: l23_z <= #2 -b;
10: l23_z <= #2 a>>1;
11: l23_z <= #2 b>>1;
default: l23_z= #2 0;
endcase
l23_rd<= #2 l12_rd;
l23_addr<= #2 l12_addr;

end

always @(posedge clk1)
begin
regbank[l23_rd]<= #2 l23_z;
l34_z <= #2 l23_z;
l34_addr<= #2 l23_addr;
end

always@(negedge clk2)
begin
mem[addr]<= #2 l34_z;
end
 


endmodule


