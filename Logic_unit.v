module Logic_Unit  #(parameter Width = 16)
(

input       [Width-1 :0]               A,
input       [Width-1 :0]               B,
input                                  CLK,
input       [1:0]                      ALU_FUN,
input                                  RST,
input                                  Logic_Enable,
output      reg                        Logic_Flag,
output      reg[Width-1 :0]            Logic_OUT

);


wire                         High; 
wire                         LOW;
reg    [Width-1 :0]          Logic_OUT_R;
reg                          Logic_Flag_R;




always @(*)               
 begin 
  
  if (Logic_Enable)
  
   begin
               Logic_Flag_R = High;
			   
	  case (ALU_FUN)
	  
	  //Logic Operations:
			   
			   2'b00 :                                      //AND
			   begin
			   Logic_OUT_R = A & B;
			   end
			   
			   2'b01 :                                      //OR
			   begin
			   Logic_OUT_R = A | B;
			   end
			   
			   2'b10 :                                      //NAND
			   begin
			   Logic_OUT_R = ~(A & B);
			   end
			   
			   2'b11 :                                       //NOR
			   begin
			   Logic_OUT_R = ~(A | B);
			   end
			   
		endcase
     end	
	 
	else		
	 begin
	 Logic_OUT_R = 16'b0;
	 end
end 	



always @ (posedge CLK or negedge RST)                 
 begin 
 if (!RST)
  begin
  Logic_OUT <= 16'b0;
  Logic_Flag <= 1'b0;
  end
 else
  begin 
  Logic_OUT <= Logic_OUT_R;
  Logic_Flag <= Logic_Flag_R;
  end
end

assign High = 1'b1;
assign LOW = 1'b0;



endmodule   