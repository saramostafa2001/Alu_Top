module Shift_Unit #(parameter Width = 16)
(

input       [Width-1 :0]                  A,
input       [Width-1 :0]                  B,
input                                     CLK,
input       [1:0]                         ALU_FUN,
input                                     RST,
input                                     Shift_Enable,
output      reg                           Shift_Flag,
output      reg[Width-1 :0]               Shift_OUT


);

wire                         High; 
wire                         LOW;
reg   [Width-1 :0]           Shift_OUT_R;
reg                          Shift_Flag_R;



always @(*)               
 begin 
  if (Shift_Enable)
   begin
              Shift_Flag_R = High;
			  
	  case (ALU_FUN)
	  
	//Shift Operations:
			   
			   2'b00 :                                       //Shift A right
			   begin 
			   Shift_OUT_R = A >> 16'b0001;
			   end
			   
			   2'b01 :                                       //Shift A left
			   begin
			   Shift_OUT_R = A << 16'b0001;
			   end
			   
			   2'b10 :                                       //Shift B right
			   begin 
			   Shift_OUT_R = B >> 16'b0001;
			   end
			   
			   2'b11 :                                       //Shift B left
			   begin
			   Shift_OUT_R = B << 16'b0001;
			   end
		endcase 
	end
  else
   begin 
     Shift_OUT_R = 16'b0;
  end	 
end 	



always @ (posedge CLK or negedge RST)                 
 begin 
  if (!RST)
   begin 
  Shift_OUT <= 16'b0;
  Shift_Flag <= 1'b0;
   end
  else
   begin  
  Shift_OUT <= Shift_OUT_R;
  Shift_Flag <= Shift_Flag_R;
  end
end


assign High = 1'b1;
assign LOW = 1'b0;



endmodule   
