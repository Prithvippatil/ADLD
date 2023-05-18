module assgn_2(payment_done,product_required,total_amount,amount_to_pay,change,insert_coin);
input [1:0]product_required;
input [4:0]insert_coin;
output reg [4:0] amount_to_pay=0,change=0,total_amount=0;
output reg payment_done=0;
reg process_completed=0;
parameter pr_A=2'b00,pr_B=2'b01,pr_C=2'b10,pr_D=2'b11;

always @(*)
begin
if(!payment_done)begin
process_completed <=0;
case(product_required)
pr_A:
     begin
     total_amount <= 5;
     amount_to_pay <= 5;
     end
pr_B:
    begin
    total_amount <= 10;
    amount_to_pay <= 10;
   end
pr_C:
    begin
    total_amount <= 15;
    amount_to_pay <=  15;
    end
pr_D:
     begin
    total_amount <= 20;
    amount_to_pay <= 20;
     end
default:
    begin
    total_amount <= 0;
    amount_to_pay <= 0;
    end
endcase
end
end

always @(*)
begin

if(total_amount==5)begin
if(insert_coin==5)begin
amount_to_pay <= 0;
payment_done <= 1;
process_completed <=1;
end
if(insert_coin==10)begin
payment_done <= 1;
change <= 5;
amount_to_pay <= 0;
process_completed <=1;
end
end

if(total_amount==10)begin
if(insert_coin==5)begin
amount_to_pay <= 5;
end
if(insert_coin==10)begin
payment_done <= 1;
process_completed <=1;
end
if(insert_coin==5 +5)begin
payment_done <= 1;
process_completed <=1;
end
end


if(total_amount==15)begin
if(insert_coin==5)begin
amount_to_pay <= 10;
end
if(insert_coin==10)begin
amount_to_pay <= 5;
end
if(insert_coin==5 +5)begin
amount_to_pay <= 5;
end
if(insert_coin==5 +5 +5 )begin
payment_done <= 1;
amount_to_pay <= 0;
process_completed <=1;
end
if(insert_coin== 10 +5)begin
payment_done <= 1;
amount_to_pay <= 0;
process_completed <=1;
end
end


if(total_amount==20)begin
if(insert_coin==5)begin
amount_to_pay <= 15;
end
if(insert_coin==10)begin
amount_to_pay <= 10;
end
if(insert_coin==5 +5)begin
amount_to_pay <= 10;
end
if(insert_coin==5 +5 +5 )begin
amount_to_pay <= 5;
end
if(insert_coin==10 +5)begin
amount_to_pay <= 5;
end
if(insert_coin==5 +5 +5 +5)begin
payment_done <= 1;
amount_to_pay <= 0;
process_completed <=1;
end
if(insert_coin==10 +5+5)begin
payment_done <= 1;
amount_to_pay <= 0;
process_completed <=1;
end
if(insert_coin==10 +10)begin
payment_done <= 1;
amount_to_pay <= 0;
process_completed <=1;
end
end

end

always @(*)
begin
if(process_completed==1)begin
payment_done <= #2 0;
change <= #2 0;
total_amount <= #2 0;
end
end

endmodule
