module ALU_TOP #(parameter Width = 16)

( 

input        [Width-1 :0]                                 A,
input        [Width-1 :0]                                 B,
input        [3:0]                                        ALU_FUN,
input                                                     CLK,
input                                                     RST,
output       [Width-1 :0]                                 Arith_OUT,
output                                                    Arith_Flag,
output                                                    Carry_OUT,
output       [Width-1 :0]                                 Logic_Out,
output                                                    Logic_Flag,
output       [Width-1 :0]                                 CMP_OUT,
output                                                    CMP_Flag,
output                                                    Shift_Flag,
output       [Width-1 :0]                                 Shift_OUT

);


wire      Shift_Enable,Logic_Enable,Arith_Enable,CMP_Enable;



//Instantiating Decoder


Decoder DUT1 (

.ALU_FUN(ALU_FUN[3:2]),
.Logic_Enable(Logic_Enable),
.Shift_Enable(Shift_Enable),
.Arith_Enable(Arith_Enable),
.CMP_Enable(CMP_Enable)

);



//Instantiating Arithmatic Unit


Arith_Unit DUT2 (

.A(A),
.B(B),
.CLK(CLK),
.RST(RST),
.ALU_FUN(ALU_FUN[1:0]),
.Arith_Enable(Arith_Enable),
.Arith_OUT(Arith_OUT),
.Carry_OUT(Carry_OUT),
.Arith_Flag(Arith_Flag)

);


//Instantiating Logic Unit

Logic_Unit DUT3 (
.A(A),
.B(B),
.CLK(CLK),
.RST(RST),
.ALU_FUN(ALU_FUN[1:0]),
.Logic_Enable(Logic_Enable),
.Logic_Flag(Logic_Flag),
.Logic_OUT(Logic_OUT)

);


//Instantiating Compare Unit


CMP_Unit DUT4 (
.A(A),
.B(B),
.CLK(CLK),
.RST(RST),
.ALU_FUN(ALU_FUN[1:0]),
.CMP_Enable(CMP_Enable),
.CMP_Flag(CMP_Flag),
.CMP_OUT(CMP_OUT)

);



//Instantiating Shift Unit


Shift_Unit DUT5(
.A(A),
.B(B),
.CLK(CLK),
.RST(RST),
.ALU_FUN(ALU_FUN[1:0]),
.Shift_Enable(Shift_Enable),
.Shift_Flag(Shift_Flag),
.Shift_OUT(Shift_OUT)

);



 
endmodule 