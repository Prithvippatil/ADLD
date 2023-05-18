module sram_tb;
reg [9:0]address;
wire [7:0]data_out;
reg [7:0]data_in;
reg write,select,read;

integer k,myspeed;
sram p(data_out,data_in,address,write,select,read);
initial begin
for(k=0;k<=10;k=k+1)
begin
data_in=(k+1)%2;  write=1; select=1;read=0;
#2 address=k; write=0; select=0;
//end

//repeat(20)
//begin
//address=$random(myspeed)%1024;
#2 

write=0; select=1;read=1;
$display("Address:%d, Data_in:%d, data_out:%d",address,data_in,data_out);
end
end
initial myspeed=35;
endmodule

module sram(data_out,data_in,address,write,select,read);
parameter addr_size=10,word_size=8,memory_size=1024;

input [addr_size-1:0]address;
input [word_size-1:0]data_in;
input write,select,read;
output [word_size-1:0]data_out;
reg [word_size-1:0] mem[memory_size-1:0];
assign data_out=mem[address];
always @(write or select)
  if(write)
  mem[address]=data_in;
always @(read or select)
  if(read)
  data_out=mem[address];
endmodule
