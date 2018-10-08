module IMPOR(
	output  reg [2:0] out,
	output  reg out_valid,
	output  reg ready,
	input  [2:0] in,
	input  [2:0] mode,
	input  in_valid,
	input  clk,
	input  rst_n
);
parameter IDLE=0,INPUT=1,EX=2,OUTPUT=3;
reg [1:0]current_state,next_state;
reg tmp;
reg [1:0]j;
reg [2:0]p1,p2,p3,p4,p5,p6,p7,p8,p9;
reg [3:0]count;
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                ready<=1;
	else
		ready<=1;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		current_state<=IDLE;
	else
		current_state<=next_state;
end
always@(*) begin
	case(current_state)
		IDLE:
			if(in_valid==1)
				next_state<=INPUT;
			else
				next_state<=IDLE;
		INPUT:
			if(in_valid==0)
				next_state<=EX;
			else
				next_state<=INPUT;
		EX:
			if(count==9)
				next_state<=OUTPUT;
			else
				next_state<=EX;
		OUTPUT:
				next_state<=IDLE;
		default:
			next_state<=IDLE;
	endcase
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		p1<=0;
	else if(in_valid==1&&count==0)
		p1<=in;
	else if(in_valid==1&&count==9) begin
		case(mode)
			1:p1<=p3;
			2:p1<=p7;
			3:p1<=p3;
			4:p1<=p7;
			5:p1<=(p1==7)?7:p1+1;
			default:p1<=p1;
		endcase
	end
	else
		p1<=p1;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p2<=0;
        else if(in_valid==1&&count==1)
                p2<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        2:p2<=p8;
                        3:p2<=p6;
                        4:p2<=p4;
                        6:p2<=(p2==7)?7:p2+1;
			default:p2<=p2;
                endcase
        end
        else
                p2<=p2;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p3<=0;
        else if(in_valid==1&&count==2)
                p3<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        1:p3<=p1;
                        2:p3<=p9;
                        3:p3<=p9;
                        4:p3<=p1;
                        7:p3<=(p3==7)?7:p3+1;
			default:p3<=p3;
                endcase
        end
        else
                p3<=p3;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p4<=0;
        else if(in_valid==1&&count==3)
                p4<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        1:p4<=p6;
                        3:p4<=p2;
                        4:p4<=p8;
                        5:p4<=(p4==7)?7:p4+1;
			default:p4<=p4;
                endcase
        end
        else
                p4<=p4;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p5<=0;
        else if(in_valid==1&&count==4)
                p5<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        6:p5<=(p5==7)?7:p5+1;
			default:p5<=p5;
                endcase
        end
        else
                p5<=p5;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p6<=0;
        else if(in_valid==1&&count==5)
                p6<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        1:p6<=p4;
                        3:p6<=p8;
                        4:p6<=p2;
                        7:p6<=(p6==7)?7:p6+1;
			default:p6<=p6;
                endcase
        end
        else
                p6<=p6;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p7<=0;
        else if(in_valid==1&&count==6)
                p7<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        1:p7<=p9;
                        2:p7<=p1;
                        3:p7<=p1;
                        4:p7<=p9;
                        5:p7<=(p7==7)?7:p7+1;
			default:p7<=p7;
                endcase
        end
        else
                p7<=p7;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p8<=0;
        else if(in_valid==1&&count==7)
                p8<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        2:p8<=p2;
                        3:p8<=p4;
                        4:p8<=p6;
                        6:p8<=(p8==7)?7:p8+1;
			default:p8<=p8;
                endcase
        end
        else
                p8<=p8;
end
always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
                p9<=0;
        else if(in_valid==1&&count==8)
                p9<=in;
        else if(in_valid==1&&count==9) begin
                case(mode)
                        1:p9<=p7;
                        2:p9<=p3;
                        3:p9<=p7;
                        4:p9<=p3;
                        7:p9<=(p9==7)?7:p9+1;
			default:p9<=p9;
                endcase
        end
        else
                p9<=p9;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		tmp<=0;
	else if(next_state==OUTPUT)
		tmp<=0;
	else if(in_valid==1&&count==9&&mode==0)
		tmp<=1;
	else tmp<=tmp;
end
/*always@(posedge clk or negedge rst_n) begin	
	if(!rst_n) 
	begin
		tmp<=0;
		p1<=0;
		p2<=0;
		p3<=0;
		p4<=0;
		p5<=0;
		p6<=0;
		p7<=0;
		p8<=0;
		p9<=0;	
	end
	else if(next_state==OUTPUT)
		tmp<=0;
	else if(in_valid==1) begin
		case(count)
			0: p1<=in;
			1: p2<=in;
			2: p3<=in;
			3: p4<=in;
			4: p5<=in;
			5: p6<=in;
			6: p7<=in;
			7: p8<=in;
			8: p9<=in;
			9:begin
			case(mode)
				0: begin
					tmp<=1;
					p1<=p1;
				end
				1: begin
					p1<=p3;
					p3<=p1;
					p4<=p6;
					p6<=p4;
					p7<=p9;
					p9<=p7;
				end	
				2: begin
					p1<=p7;
					p2<=p8;
					p3<=p9;
					p7<=p1;
					p8<=p2;
					p9<=p3;
				end
				3: begin
					p1<=p3;
					p2<=p6;
					p3<=p9;
					p4<=p2;
					p6<=p8;
					p7<=p1;
					p8<=p4;
					p9<=p7;
				end
				4: begin
					p1<=p7;
					p2<=p4;
					p3<=p1;
					p4<=p8;
					p6<=p2;
					p7<=p9;
					p8<=p6;
					p9<=p3;
				end
				5: begin
					p1<=(p1==7)?7:p1+1;
					p4<=(p4==7)?7:p4+1;
					p7<=(p7==7)?7:p7+1;
				end
				6: begin
					p2<=(p2==7)?7:p2+1;
					p5<=(p5==7)?7:p5+1;
					p8<=(p8==7)?7:p8+1;
				end
				7: begin
					p3<=(p3==7)?7:p3+1;
					p6<=(p6==7)?7:p6+1;
					p9<=(p9==7)?7:p9+1;
				end
			endcase
			end
		endcase
	end
	else begin
		tmp<=tmp;
		p1<=p1;
		p2<=p2;
		p3<=p3;
		p4<=p4;
		p5<=p5;
		p6<=p6;
		p7<=p7;
		p8<=p8;
		p9<=p9;
	end
end*/
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count<=0;
	else if(in_valid==1&&count<9)
		count<=count+1;
	else if(tmp==1) begin
		count<=count+1;
		if(next_state==OUTPUT)
			count<=0;
	end
	else if(mode==0)
		count<=0;
	else 
		count<=count;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		out<=0;
	else if(next_state==OUTPUT)
		out<=0;
	else if(tmp==1) begin
		case(count)
			0: out<=p1;
			1: out<=p2;
			2: out<=p3;
			3: out<=p4;
			4: out<=p5;
			5: out<=p6;
			6: out<=p7;
			7: out<=p8;
			8: out<=p9;
			default: out<=out;
		endcase
	end
	else
		out<=out;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		out_valid<=0;
	else if(next_state==OUTPUT)
		out_valid<=0;
	else if(tmp==1)
		out_valid<=1;
	else
		out_valid<=out_valid;
end	

endmodule
