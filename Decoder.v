module Decoder(

input       [3:2]            ALU_FUN,
output      reg              Logic_Enable,
output      reg              Shift_Enable,
output      reg              Arith_Enable,
output      reg              CMP_Enable


);


always @(*)               
 begin 
 
  case (ALU_FUN)
  
	
		   2'b00 : 
		   begin 
		    Arith_Enable = 1'b1;
			Shift_Enable = 1'b0;
			Logic_Enable = 1'b0;
			CMP_Enable = 1'b0;
		   end
			
		   2'b01 :                                       
		   begin 
		    Arith_Enable = 1'b0;
			Shift_Enable = 1'b0;
			Logic_Enable = 1'b1;
			CMP_Enable = 1'b0;
		   end
			
		   2'b10 :                                       
		   begin 
		    Arith_Enable = 1'b0;
			Shift_Enable = 1'b0;
			Logic_Enable = 1'b0;
			CMP_Enable = 1'b1;
		   end
		   
		   2'b11 :                                       
		   begin 
		    Arith_Enable = 1'b0;
			Shift_Enable = 1'b1;
			Logic_Enable = 1'b0;
			CMP_Enable = 1'b0;
		   end
		   
	endcase 
		
end 	

endmodule