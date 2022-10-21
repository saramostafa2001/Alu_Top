`timescale 1us/1ns
module tb_ALU_TOP ();
parameter Width = 16;
reg             [Width-1 :0]                                       tb_A;
reg             [Width-1 :0]                                       tb_B;
reg                                                                tb_CLK;
reg                                                                tb_RST;
reg             [3:0]                                              tb_ALU_FUN;
wire            [Width-1 :0]                                       tb_Arith_OUT;
wire                                                               tb_Carry_OUT;
wire                                                               tb_Arith_Flag;
wire            [Width-1 :0]                                       tb_Logic_Out;
wire                                                               tb_Logic_Flag;
wire            [Width-1 :0]                                       tb_CMP_OUT;
wire                                                               tb_CMP_Flag;
wire            [Width-1 :0]                                       tb_Shift_OUT;
wire                                                               tb_Shift_Flag;

  

always
 begin 
  #4 tb_CLK = !tb_CLK ;
  #6 tb_CLK = !tb_CLK ;
 end 
 
 
ALU_TOP tb_4
(
.A (tb_A),
.B (tb_B),
.CLK (tb_CLK),
.RST (tb_RST),
.ALU_FUN (tb_ALU_FUN),
.Arith_OUT (tb_Arith_OUT),
.Arith_Flag (tb_Arith_Flag),
.Logic_Out (tb_Logic_Out),
.Logic_Flag (tb_Logic_Flag),
.CMP_OUT (tb_CMP_OUT),
.CMP_Flag (tb_CMP_Flag),
.Shift_OUT (tb_Shift_OUT),
.Shift_Flag (tb_Shift_Flag)
            
);



initial
  begin 
  
   $dumpfile ("ALU_TOP.vcd");
   $dumpvars;
   
   
   tb_A = 'b0001;
   tb_B = 'b0001;
   tb_CLK = 1'b0;
   tb_ALU_FUN =4'b0;


$display("Test Case 1: Addition");
       #3
	   tb_ALU_FUN = 4'b0000;
	   tb_A = 'b0011;
	   tb_B = 'b1101;
	   #7
		if(tb_Arith_OUT != 'b10000 && tb_Carry_OUT != 1'b0)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
	 
$display("Test Case 2: Subtraction");
       #3
	   tb_ALU_FUN = 4'b0001;
	   tb_A = 'b0011;
	   tb_B = 'b0010;
	   #7
		if(tb_Arith_OUT != 'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
$display("Test Case 3: Multiplication");
       #3
	   tb_ALU_FUN = 4'b0010;
	   tb_A = 'b0010;
	   tb_B = 'b0001;
	   #7
		if(tb_Arith_OUT != 'b0010)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 

$display("Test Case 4: Division");
       #3
	   tb_ALU_FUN = 4'b0011;
	   tb_A = 'b0110;
	   tb_B = 'b0010;
	   #7
		if(tb_Arith_OUT != 'b0011)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 5: AND");
       #3
	   tb_ALU_FUN = 4'b0100;
	   tb_A = 'b0011;
	   tb_B = 'b1101;
	   #7
		if(tb_Logic_Out != 'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 6: OR");
       #3
	   tb_ALU_FUN = 4'b0101;
	   tb_A = 'b0011;
	   tb_B = 'b1101;
	   #7
		if(tb_Logic_Out != 'b1111 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 

$display("Test Case 7: NAND");
       #3
	   tb_ALU_FUN = 4'b0110;
	   tb_A = 'b0011;
	   tb_B = 'b1101;
	   #7
		if(tb_Logic_Out != 'hfffe)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 
		
		
$display("Test Case 8: NOR");
       #3
	   tb_ALU_FUN = 4'b0111;
	   tb_A = 'b0011;
	   tb_B = 'b1101;
	   #7
		if(tb_Logic_Out != 'hfff0 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 		 		 
		 

		 
$display("Test Case 9: NOP");
       #3
	   tb_ALU_FUN = 4'b1000;
	   #7
		if(tb_CMP_OUT != 'b0000 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");

		 
		 
$display("Test Case 10: Equal");
       #3
	   tb_ALU_FUN = 4'b1001;
	   tb_A = 'b0011;
	   tb_B = 'b0011;
	   #7
		if(tb_CMP_OUT != 'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
$display("Test Case 11: Greater Than");
       #3
	   tb_ALU_FUN = 4'b1010;
	   tb_A = 'b0111;
	   tb_B = 'b0001;
	   #7
		if(tb_CMP_OUT != 'b0010 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 
		 	

			
$display("Test Case 12: Smaller Than");
       #3
	   tb_ALU_FUN = 4'b1011; 
	   tb_A = 'b0011;
	   tb_B = 'b0100;
	   #7
		if(tb_CMP_OUT != 'b0011 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 	

			
$display("Test Case 13: Shift A Right");
       #3
	   tb_ALU_FUN = 4'b1100;
	   tb_A = 'b0011;
	   tb_B = 'b0001;   
	   #7
		if(tb_Shift_OUT != 'b0001)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");


$display("Test Case 14: Shift B Right");
       #3
	   tb_ALU_FUN = 4'b1110;
	   tb_A = 'b0011;
	   tb_B = 'b0001;   
	   #7
		if(tb_Shift_OUT != 'b0000)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");		 
	
	
					 
$display("Test Case 15: Shift A Left");
       #3
	   tb_ALU_FUN = 4'b1101;
	   tb_A = 'b0011;
	   tb_B = 'b0001;
	   #7
		if(tb_Shift_OUT != 'b0110)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 



$display("Test Case 16: Shift B Left");
       #3
	   tb_ALU_FUN = 4'b1111;
	   tb_A = 'b0011;
	   tb_B = 'b0001;
	   #7
		if(tb_Shift_OUT != 'b0010)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");		 
		 
		 
		 
	#10				 
   
   $finish;
   
   end
   
 
 
 endmodule  
   
   

