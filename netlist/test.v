# clock Path - Clock - > CLK ...mlb .

module  fulladder (A,B,C,Sum,Carry,Clock, Scan_clk,Scan_en,cg_en, gen_clk_mux );
input A,B,C, Clock,Scan_clk,Scan_en,cg_en, gen_clk_mux;
output Sum,Carry;
wire  n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, CLK, mux_clock,gated_clock;

MUX2_X1 mux1(.A(Clock), .B(Scan_clk), .S(Scan_en), .Z(mux_clock));


AND2_X1 gate(.A1(mux_clock), .A2(cg_en), .ZN(gated_clock));


BUF_X1 CLK_B1 (.A(gated_clock), .Z(CLK) );

DFF_X1 reg1(.D(A), .CK(CLK), .Q(n4), .QN() );
DFF_X1 reg2(.D(B), .CK(CLK), .Q(n5), .QN() );
DFF_X1 reg3(.D(C), .CK(CLK), .Q(n6), .QN() );

XOR2_X1 G1(.A(n4), .B(n5), .Z(n7));
XOR2_X1 G2(.A(n7), .B(n6), .Z(n8));



AND2_X1 G3(.A1(n5), .A2(n6), .ZN(n9));
AND2_X1 G4(.A1(n4), .A2(n5), .ZN(n10));
AND2_X1 G5(.A1(n4), .A2(n6), .ZN(n11));


OR2_X1 G7(.A1(n9), .A2(n10), .ZN(n12));
OR2_X1 G6(.A1(n12), .A2(n11), .ZN(n13));


DFF_X1 reg4(.D(n13), .CK(CLK), .Q(n14), .QN() );
DFF_X1 reg5(.D(n8),  .CK(CLK), .Q(n15), .QN() );

BUF_X1 B1 (.A(n14), .Z(Carry) );
BUF_X1 B2 (.A(n15), .Z(Sum) );
endmodule
