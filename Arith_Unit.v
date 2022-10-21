module Arith_Unit #(parameter Width = 16)
(

input     [Width-1 :0]                 A,
input     [Width-1 :0]                 B,
input                                  CLK,
input                                  RST,
input       [1:0]                      ALU_FUN,
input                                  Arith_Enable,
output      reg[Width-1 :0]            Arith_OUT,
output      reg                        Carry_OUT,
output      reg                        Arith_Flag

);
 
wire                         High; 
wire                         LOW;
reg   [Width-1 :0]           Arith_OUT_R;
reg                          Arith_Flag_R;
reg   [Width-1: 0]           Carry_OUT_R;



always @(*) 
 
 begin

  if (Arith_Enable)  
  
   begin 
            Arith_Flag_R = High;
			
	  case (ALU_FUN)
		  
			  //Arithamtic Operations:
			  
			   2'b00 :                                      //Addition
			   begin 
			   {Carry_OUT_R , Arith_OUT_R} = A + B;
			   end
			   
			   2'b01 :                                     //Subtraction
			   begin 
			   Arith_OUT_R = A - B;
			   end
			   
			   2'b10 :                                     //Multiplication 
			   begin
			   Arith_OUT_R = A * B ;
			   end
			   
			   2'b11 :                                    //Division
			   begin
			   Arith_OUT_R = A / B ;
			   end
			   
		endcase 
	end
	
	
   else 
	
    begin
	
	  Arith_OUT_R= 16'b0;	
	  
	end	
end 	


always @(posedge CLK or negedge RST)                 
 begin 
	 if (!RST)
	  begin
	    Arith_OUT <= 16'b0;
	    Arith_Flag <= 1'b0;
		Carry_OUT <= 1'b0;
	  end
	  
	 else 
	  begin
	    Arith_OUT <= Arith_OUT_R;
 	    Arith_Flag <= Arith_Flag_R;
		Carry_OUT <= Carry_OUT_R - Arith_OUT_R;
	  end
 end


assign High = 1'b1;
assign LOW = 1'b0;



endmodule   
	   