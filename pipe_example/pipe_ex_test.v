module pipe_ex_test;
reg [9:0]a,b,c,d;
wire [9:0]f;
reg clk;
pipe_ex p(f,a,b,c,d,clk);
initial begin
a=3;
b=7;
c=8;
d=5;
clk=1;
#35 $display("output=%d",f); 
$finish;
end
 

always #3 clk=~clk;
endmodule









module pipe_ex(f,a,b,c,d,clk);
input [9:0]a,b,c,d;
input clk;
output [9:0]f;
reg [9:0] l12_x1,l12_x2,l12_d,l23_x3,l23_d,l34_f=0;
assign f=l34_f;
always @(posedge clk)
begin
l12_x1 <= #4 a+b;
l12_x2 <= #4 c-d;
l12_d <=d;

l23_x3 <= #6 l12_x1+l12_x2;
l23_d <=l12_d;

l34_f<= #8l23_x3*l23_d;

end
endmodule
