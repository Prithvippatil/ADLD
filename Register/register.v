module register(zout,rs1,rs2,rd,func,addr,clk1,cl2);
input [3:0]rs1,rs2,rd,func;
input [7:0]addr;
input clk1,clk2;
output [15:0]zout;
reg [15:0]a,b,l12_rd,l12,_func,l12_addr,l23_z,l23_addr,l23_rd,l34_z,l34_addr;
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
default: l23_z= #2 z;
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
