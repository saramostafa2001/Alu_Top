module CMP_Unit #(parameter Width = 16)
(

input       [Width-1 :0]               A,
input       [Width-1 :0]               B,
input                                  CLK,
input       [1:0]                      ALU_FUN,
input                                  RST,
input                                  CMP_Enable,
output      reg                        CMP_Flag,
output      reg[Width-1 :0]            CMP_OUT


);



wire                         High; 
wire                         LOW;
reg   [Width-1 :0]           CMP_OUT_R;
reg                          CMP_Flag_R;



always @(*)               
 begin 
  if (CMP_Enable)
   begin
               CMP_Flag_R = High;
			   
	  case (ALU_FUN)
	  
	//Compare Operations:


			   2'b00 : 
			   begin                                  //NOP
				 CMP_OUT_R = 16'b0000;
				 end
				
				
			   2'b01 : 
			   begin 
				if (A == B)                                     //Equal
				 CMP_OUT_R = 16'b0001;
				 end
				
			   2'b10 :                                       //Greater than
			   begin 
				if ( A > B)
				 CMP_OUT_R = 16'b0010;
				 end
				
			   2'b11 :                                      //Smaller than
			   begin
				if (A < B)
				 CMP_OUT_R = 16'b0011;
				 end
		endcase 
	end
  else
   begin
    CMP_OUT_R = 16'b0;
  end	
end 	



always @ (posedge CLK or negedge RST)                 
begin 
 if (!RST)
  begin
  CMP_OUT <= 16'b0;
  CMP_Flag <= 1'b0;
  end
 else
  begin 
  CMP_OUT <= CMP_OUT_R;
  CMP_Flag <= CMP_Flag_R;
  end
end


assign High = 1'b1;
assign LOW = 1'b0;



endmodule   