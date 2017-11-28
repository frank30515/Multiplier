`timescale 1ns/1ps

module DOQE_ppl(clk,rst,A,B,C,D,DOQE_ppl_num);
// DO NOT CHANGE !
	input		clk;
	input		rst;
	input		[3:0]	A;
	input		[6:0]	B;
	input   	[5:0] 	C;
	
	output		[14:0]	D;
    output  	[50:0]  DOQE_ppl_num;	

  // Write your design here
    wire [11:0] AC;
	wire [13:0] BB;
	wire [25:0]  Q;
	wire [14:0] temp;
	wire [50:0] AC_num,BB_num,BB_AC_num,reg0_num,reg1_num;
	assign DOQE_ppl_num=AC_num+BB_num+BB_AC_num+reg0_num+reg1_num;
  
    AC      ac0 (A,C,AC,AC_num);
    BB	    bb0 (B,BB,BB_num);
	Reg26  reg0 (Q,AC,BB,clk,rst,reg0_num);
	BB_AC bbac0 (Q,temp,BB_AC_num);
	Reg15  reg1 (D,temp,clk,rst,reg1_num);
  
endmodule 

module BB_AC (Q,D,BB_AC_num);
    input [25:0] Q;
			
	output [14:0] D;
	output wire [50:0] BB_AC_num;
		
	wire [11:0] nAC;
	wire [50:0] iv_num,iv_num0,iv_num1,iv_num2,iv_num3,iv_num4,iv_num5,iv_num6,iv_num7,iv_num8;
	wire [50:0] iv_num9,iv_num10,iv_num11;
	assign iv_num=iv_num0+iv_num1+iv_num2+iv_num3+iv_num4+iv_num5+iv_num6+iv_num7+iv_num8+iv_num9+iv_num10+iv_num11;
		
	IV iv0 (nAC[0],Q[0],iv_num0);
	IV iv1 (nAC[1],Q[1],iv_num1);
	IV iv2 (nAC[2],Q[2],iv_num2);
	IV iv3 (nAC[3],Q[3],iv_num3);
	IV iv4 (nAC[4],Q[4],iv_num4);
	IV iv5 (nAC[5],Q[5],iv_num5);
	IV iv6 (nAC[6],Q[6],iv_num6);
	IV iv7 (nAC[7],Q[7],iv_num7);
	IV iv8 (nAC[8],Q[8],iv_num8);
	IV iv9 (nAC[9],Q[9],iv_num9);
	IV iv10 (nAC[10],Q[10],iv_num10);
	IV iv11 (nAC[11],Q[11],iv_num11);
		
	wire [13:2] temp;
	wire [50:0] fa_num,fa_num0,fa_num1,fa_num2,fa_num3,fa_num4,fa_num5,fa_num6,fa_num7,fa_num8;
	wire [50:0] fa_num9,fa_num10,fa_num11,fa_num12,fa_num13,fa_num14;
	assign fa_num=fa_num0+fa_num1+fa_num2+fa_num3+fa_num4+fa_num5+fa_num6+fa_num7+fa_num8+fa_num9+fa_num10+fa_num11+fa_num12+fa_num13+fa_num14;
	
	DRIVER buf0 (D[0],Q[12],fa_num0);
	DRIVER buf1 (D[1],Q[13],fa_num1);
	FA1 fa2 (temp[2],D[2],Q[14],nAC[0],1'b1,fa_num2);
	FA1 fa3 (temp[3],D[3],Q[15],nAC[1],temp[2],fa_num3);
	FA1 fa4 (temp[4],D[4],Q[16],nAC[2],temp[3],fa_num4);
	FA1 fa5 (temp[5],D[5],Q[17],nAC[3],temp[4],fa_num5);
	FA1 fa6 (temp[6],D[6],Q[18],nAC[4],temp[5],fa_num6);
	FA1 fa7 (temp[7],D[7],Q[19],nAC[5],temp[6],fa_num7);
	FA1 fa8 (temp[8],D[8],Q[20],nAC[6],temp[7],fa_num8);
	FA1 fa9 (temp[9],D[9],Q[21],nAC[7],temp[8],fa_num9);
	FA1 fa10 (temp[10],D[10],Q[22],nAC[8],temp[9],fa_num10);
	FA1 fa11 (temp[11],D[11],Q[23],nAC[9],temp[10],fa_num11);
	FA1 fa12 (temp[12],D[12],Q[24],nAC[10],temp[11],fa_num12);
	FA1 fa13 (temp[13],D[13],Q[25],nAC[11],temp[12],fa_num13);
	NR2 nor0 (   D[14],Q[11],temp[13],fa_num14);
	
	assign BB_AC_num = iv_num + fa_num;
	
endmodule

module AC (A,C,S,AC_num);
    input  [ 3:0] A;
	input  [ 5:0] C;
	output [11:0] S;
	output wire [50:0] AC_num;
	
	
	wire [50:0] AC_num0,AC_num1,AC_num2,AC_num3,AC_num4;
	wire [6:0]   pp0;wire [5:0] pp1,pp2,pp3,pp4;wire [6:0] pp5;
	wire [8:0] ppw00;wire [7:0] ppw01;wire [6:0] ppw02;wire [4:0] ppw03;
	wire [9:0] ppw10;wire [8:0] ppw11;wire [4:0] ppw12;
	wire [11:0] ppw20;wire [7:0] ppw21;	
	
	AC_pp ac0 (    A,    C,  pp0,  pp1,  pp2,  pp3,  pp4,pp5,AC_num0);
	AC_W0 ac1 (  pp0,  pp1,  pp2,  pp3,  pp4,  pp5,ppw00,ppw01,ppw02,ppw03,AC_num1);
	AC_W1 ac2 (ppw00,ppw01,ppw02,ppw03,ppw10,ppw11,ppw12,AC_num2);
	AC_W2 ac3 (ppw10,ppw11,ppw12,ppw20,ppw21,AC_num3);
	SUMAC ac4 (ppw20,ppw21,S,AC_num4);
	
    assign AC_num = AC_num0+AC_num1+AC_num2+AC_num3+AC_num4;
	
endmodule

module BB (B,S,BB_num);
    input  [ 6:0] B;
	output [13:0] S;
	output wire [50:0] BB_num;
		
	wire [50:0] BB_num0,BB_num1,BB_num2,BB_num3,BB_num4,BB_num5;
	wire [7:0]  pp0  ;wire [6:0]  pp1,pp2,pp3,pp4,pp5    ;wire [7:0] pp6;
	wire [13:0] ppw00;wire [10:0] ppw01;wire [ 6:0] ppw02;wire [ 4:0] ppw03;wire [ 1:0] ppw04;
	wire [13:0] ppw10;wire [10:0] ppw11;wire [ 4:0] ppw12;wire [ 1:0] ppw13;
	wire [13:0] ppw20;wire [ 9:0] ppw21;wire [ 1:0] ppw22;
	wire [13:0] ppw30;wire [ 8:0] ppw31;
	
	BB_pp bb0 (B,pp0,pp1,pp2,pp3,pp4,pp5,pp6,BB_num0);
	BB_W0 bb1 (pp0,pp1,pp2,pp3,pp4,pp5,pp6,ppw00,ppw01,ppw02,ppw03,ppw04,BB_num1);
	BB_W1 bb2 (ppw00,ppw01,ppw02,ppw03,ppw04,ppw10,ppw11,ppw12,ppw13,BB_num2);
	BB_W2 bb3 (ppw10,ppw11,ppw12,ppw13,ppw20,ppw21,ppw22,BB_num3);
	BB_W3 bb4 (ppw20,ppw21,ppw22,ppw30,ppw31,BB_num4);
	SUMBB bb5 (ppw30,ppw31,S,BB_num5);
	
    assign BB_num = BB_num0+BB_num1+BB_num2+BB_num3+BB_num4+BB_num5 ;
	
endmodule

//the partial product of B*B
module BB_pp (B,pp0,pp1,pp2,pp3,pp4,pp5,pp6,BB_pp_num);
    input  [6:0] B;
	
	output [7:0] pp0;
	output [6:0] pp1,pp2,pp3,pp4,pp5;
	output [7:0] pp6;
	output wire [50:0] BB_pp_num;
		
	//pp0
	wire [50:0] pp0_num,pp0_num0,pp0_num1,pp0_num2,pp0_num3,pp0_num4,pp0_num5,pp0_num6,pp0_num7;
	assign pp0_num = pp0_num0+pp0_num1+pp0_num2+pp0_num3+pp0_num4+pp0_num5+pp0_num6+pp0_num7;
	
	DRIVER buf0 (pp0[0],B[0],pp0_num0);
	AN2     an0 (pp0[1],B[0],B[1],pp0_num1);
	AN2     an1 (pp0[2],B[0],B[2],pp0_num2);
	AN2     an2 (pp0[3],B[0],B[3],pp0_num3);
	AN2     an3 (pp0[4],B[0],B[4],pp0_num4);
	AN2     an4 (pp0[5],B[0],B[5],pp0_num5);
	ND2	    nd0 (pp0[6],B[0],B[6],pp0_num6);
	DRIVER buf1 (pp0[7],1'b1,pp0_num7);
	
	//pp1
	wire [50:0] pp1_num,pp1_num0,pp1_num1,pp1_num2,pp1_num3,pp1_num4,pp1_num5,pp1_num6;
	assign pp1_num = pp1_num0+pp1_num1+pp1_num2+pp1_num3+pp1_num4+pp1_num5+pp1_num6;
	
	AN2     an5 (pp1[0],B[1],B[0],pp1_num0);
	DRIVER buf2 (pp1[1],B[1],     pp1_num1);
	AN2     an6 (pp1[2],B[1],B[2],pp1_num2);
	AN2     an7 (pp1[3],B[1],B[3],pp1_num3);
	AN2     an8 (pp1[4],B[1],B[4],pp1_num4);
	AN2     an9 (pp1[5],B[1],B[5],pp1_num5);
	ND2	    nd1 (pp1[6],B[1],B[6],pp1_num6);

	//pp2
	wire [50:0] pp2_num,pp2_num0,pp2_num1,pp2_num2,pp2_num3,pp2_num4,pp2_num5,pp2_num6;
	assign pp2_num = pp2_num0+pp2_num1+pp2_num2+pp2_num3+pp2_num4+pp2_num5+pp2_num6;
	
	AN2     an10 (pp2[0],B[2],B[0],pp2_num0);
	AN2     an11 (pp2[1],B[2],B[1],pp2_num1);
	DRIVER  buf3 (pp2[2],B[2],     pp2_num2);
	AN2     an12 (pp2[3],B[2],B[3],pp2_num3);
	AN2     an13 (pp2[4],B[2],B[4],pp2_num4);
	AN2     an14 (pp2[5],B[2],B[5],pp2_num5);
	ND2	    nd2  (pp2[6],B[2],B[6],pp2_num6);
	
	//pp3
	wire [50:0] pp3_num,pp3_num0,pp3_num1,pp3_num2,pp3_num3,pp3_num4,pp3_num5,pp3_num6;
	assign pp3_num = pp3_num0+pp3_num1+pp3_num2+pp3_num3+pp3_num4+pp3_num5+pp3_num6;
	
	AN2     an15 (pp3[0],B[3],B[0],pp3_num0);
	AN2     an16 (pp3[1],B[3],B[1],pp3_num1);
	AN2     an17 (pp3[2],B[3],B[2],pp3_num2);
	DRIVER  buf4 (pp3[3],B[3],     pp3_num3);
	AN2     an18 (pp3[4],B[3],B[4],pp3_num4);
	AN2     an19 (pp3[5],B[3],B[5],pp3_num5);
	ND2	    nd3  (pp3[6],B[3],B[6],pp3_num6);
	
	//pp4
	wire [50:0] pp4_num,pp4_num0,pp4_num1,pp4_num2,pp4_num3,pp4_num4,pp4_num5,pp4_num6;
	assign pp4_num = pp4_num0+pp4_num1+pp4_num2+pp4_num3+pp4_num4+pp4_num5+pp4_num6;
	
	AN2     an20 (pp4[0],B[4],B[0],pp4_num0);
	AN2     an21 (pp4[1],B[4],B[1],pp4_num1);
	AN2     an22 (pp4[2],B[4],B[2],pp4_num2);
	AN2     an23 (pp4[3],B[4],B[3],pp4_num3);
	DRIVER  buf5 (pp4[4],B[4],	   pp4_num4);
	AN2     an24 (pp4[5],B[4],B[5],pp4_num5);
	ND2	    nd4  (pp4[6],B[4],B[6],pp4_num6);
	
	//pp5
	wire [50:0] pp5_num,pp5_num0,pp5_num1,pp5_num2,pp5_num3,pp5_num4,pp5_num5,pp5_num6;
	assign pp5_num = pp5_num0+pp5_num1+pp5_num2+pp5_num3+pp5_num4+pp5_num5+pp5_num6;
	
	AN2     an25 (pp5[0],B[5],B[0],pp5_num0);
	AN2     an26 (pp5[1],B[5],B[1],pp5_num1);
	AN2     an27 (pp5[2],B[5],B[2],pp5_num2);
	AN2     an28 (pp5[3],B[5],B[3],pp5_num3);
	AN2     an29 (pp5[4],B[5],B[4],pp5_num4);
	DRIVER  buf6 (pp5[5],B[5],     pp5_num5);
	ND2	    nd5  (pp5[6],B[5],B[6],pp5_num6);
	
	//pp6
	wire [50:0] pp6_num,pp6_num0,pp6_num1,pp6_num2,pp6_num3,pp6_num4,pp6_num5,pp6_num6,pp6_num7;
	assign pp6_num = pp6_num0+pp6_num1+pp6_num2+pp6_num3+pp6_num4+pp6_num5+pp6_num6+pp6_num7;
	
	ND2 nd6  (pp6[0],B[6],B[0],pp6_num0);
	ND2 nd7  (pp6[1],B[6],B[1],pp6_num1);
	ND2 nd8  (pp6[2],B[6],B[2],pp6_num2);
	ND2 nd9  (pp6[3],B[6],B[3],pp6_num3);
	ND2 nd10 (pp6[4],B[6],B[4],pp6_num4);
	ND2 nd11 (pp6[5],B[6],B[5],pp6_num5);
	DRIVER  buf7 (pp6[6] ,B[6],pp6_num6);
	DRIVER  buf8 (pp6[7] ,1'b1,pp6_num7);
	
	assign BB_pp_num = pp0_num+pp1_num+pp2_num+pp3_num+pp4_num+pp5_num+pp6_num;

endmodule

module BB_W0 (pp0,pp1,pp2,pp3,pp4,pp5,pp6,ppw0,ppw1,ppw2,ppw3,ppw4,BB_W0_num);
    input [7:0] pp0;
	input [6:0] pp1,pp2,pp3,pp4,pp5;
	input [7:0] pp6;
	
	output [13:0] ppw0;
	output [10:0] ppw1;
	output [ 6:0] ppw2;
	output [ 4:0] ppw3;
	output [ 1:0] ppw4;
	output wire [50:0] BB_W0_num;
		
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5,ppw0_num6,ppw0_num7;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5 + ppw0_num6 + ppw0_num7;
	
	DRIVER buf0 (ppw0[0],pp0[0],                      ppw0_num0);
	HA1 ha0     (ppw0[2],ppw0[1],pp0[1],pp1[0],       ppw0_num1);
	FA1 fa0     (ppw0[4],ppw0[3],pp0[3],pp1[2],pp2[1],ppw0_num2);
	FA1 fa1     (ppw0[6],ppw0[5],pp0[5],pp1[4],pp2[3],ppw0_num3);
	FA1 fa2     (ppw0[8],ppw0[7],pp0[7],pp1[6],pp2[5],ppw0_num4);
	FA1 fa3     (ppw0[10],ppw0[9],pp3[6],pp4[5],pp5[4],ppw0_num5);
	HA1 ha1     (ppw0[12],ppw0[11],pp5[6],pp6[5],      ppw0_num6);
	DRIVER buf1 (ppw0[13],pp6[7],                      ppw0_num7);
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3,ppw1_num4,ppw1_num5;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3 + ppw1_num4 + ppw1_num5;
	
	FA1 fa4 (ppw1[1],ppw1[0],pp0[2],pp1[1],pp2[0],ppw1_num0);
	FA1 fa5 (ppw1[3],ppw1[2],pp0[4],pp1[3],pp2[2],ppw1_num1);
	FA1 fa6 (ppw1[5],ppw1[4],pp0[6],pp1[5],pp2[4],ppw1_num2);
	FA1 fa7 (ppw1[7],ppw1[6],pp2[6],pp3[5],pp4[4],ppw1_num3);
	FA1 fa8 (ppw1[9],ppw1[8],pp4[6],pp5[5],pp6[4],ppw1_num4);
	DRIVER buf2 (ppw1[10],pp6[6],ppw1_num5);
	
	//ppw2
	wire [50:0] ppw2_num,ppw2_num0,ppw2_num1,ppw2_num2,ppw2_num3;
	assign ppw2_num = ppw2_num0 + ppw2_num1 + ppw2_num2 + ppw2_num3;
	
	DRIVER buf3 (ppw2[0],pp3[0],ppw2_num0);
	HA1 ha2 (ppw2[2],ppw2[1],pp3[1],pp4[0],ppw2_num1);
	FA1 fa9 (ppw2[4],ppw2[3],pp3[3],pp4[2],pp5[1],ppw2_num2);
	HA1 ha3 (ppw2[6],ppw2[5],pp5[3],pp6[2],ppw2_num3);
	
	//ppw3
	wire [50:0] ppw3_num,ppw3_num0,ppw3_num1,ppw3_num2;
	assign ppw3_num = ppw3_num0 + ppw3_num1 + ppw3_num2;
	
	FA1 fa10 (ppw3[1],ppw3[0],pp3[2],pp4[1],pp5[0],ppw3_num0);
	FA1 fa11 (ppw3[3],ppw3[2],pp3[4],pp4[3],pp5[2],ppw3_num1);
	DRIVER buf4 (ppw3[4],pp6[3],ppw3_num2);
	
	//ppw4
	wire [50:0] ppw4_num,ppw4_num0,ppw4_num1;
	assign ppw4_num = ppw4_num0 + ppw4_num1;
	
	DRIVER buf5 (ppw4[0],pp6[0],ppw4_num0);
	DRIVER buf6 (ppw4[1],pp6[1],ppw4_num1);
	
	assign BB_W0_num = ppw0_num + ppw1_num + ppw2_num + ppw3_num + ppw4_num;
	
endmodule

module BB_W1 (pp0,pp1,pp2,pp3,pp4,ppw0,ppw1,ppw2,ppw3,BB_W1_num);
	input [13:0] pp0;
	input [10:0] pp1;
	input [ 6:0] pp2;
    input [ 4:0] pp3;
    input [ 1:0] pp4;
	
	output [13:0] ppw0;
	output [10:0] ppw1;
	output [ 4:0] ppw2;
	output [ 1:0] ppw3;
	output wire [50:0] BB_W1_num;
		
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5,ppw0_num6,ppw0_num7;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5 + ppw0_num6 + ppw0_num7;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	DRIVER buf1 (ppw0[1],pp0[1],ppw0_num1);
	HA1 ha0	    (ppw0[3],ppw0[2],pp0[2],pp1[0],ppw0_num2);
	FA1 fa0     (ppw0[5],ppw0[4],pp0[4],pp1[2],pp2[1],ppw0_num3);
	FA1 fa1     (ppw0[7],ppw0[6],pp0[6],pp1[4],pp2[3],ppw0_num4);
	FA1 fa2     (ppw0[9],ppw0[8],pp0[8],pp1[6],pp2[5],ppw0_num5);
	HA1 ha1     (ppw0[11],ppw0[10],pp0[10],pp1[8],ppw0_num6);
	HA1 ha2     (ppw0[13],ppw0[12],pp0[12],pp1[10],ppw0_num7);	
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3,ppw1_num4,ppw1_num5;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3 + ppw1_num4 + ppw1_num5;
	
	FA1 fa3 (ppw1[1],ppw1[0],pp0[3],pp1[1],pp2[0],ppw1_num0);
	FA1 fa4 (ppw1[3],ppw1[2],pp0[5],pp1[3],pp2[2],ppw1_num1);
	FA1 fa5 (ppw1[5],ppw1[4],pp0[7],pp1[5],pp2[4],ppw1_num2);
	FA1 fa6 (ppw1[7],ppw1[6],pp0[9],pp1[7],pp2[6],ppw1_num3);
	HA1 ha3 (ppw1[9],ppw1[8],pp0[11],pp1[9],ppw1_num4);
	DRIVER buf2 (ppw1[10],pp0[13],ppw1_num5);
	
	//ppw2
	wire [50:0] ppw2_num,ppw2_num0,ppw2_num1,ppw2_num2,ppw2_num3;
	assign ppw2_num = ppw2_num0 + ppw2_num1 + ppw2_num2 + ppw2_num3;
	
	DRIVER buf3 (ppw2[0],pp3[0],ppw2_num0);
	HA1     ha4 (ppw2[2],ppw2[1],pp3[1],pp4[0],ppw2_num1);
	DRIVER buf4 (ppw2[3],pp3[3],ppw2_num2);
	DRIVER buf5 (ppw2[4],pp3[4],ppw2_num3);	
	
	//ppw3
	wire [50:0] ppw3_num,ppw3_num0;
	assign ppw3_num = ppw3_num0;
	
	HA1 ha5 (ppw3[1],ppw3[0],pp3[2],pp4[1],ppw3_num0);
	
	assign BB_W1_num = ppw0_num + ppw1_num + ppw2_num + ppw3_num;
	
endmodule

module BB_W2 (pp0,pp1,pp2,pp3,ppw0,ppw1,ppw2,BB_W2_num);
    input [13:0] pp0;
	input [10:0] pp1;
	input [ 4:0] pp2;
	input [ 1:0] pp3;
	
	output [13:0] ppw0;
	output [ 9:0] ppw1;
	output [ 1:0] ppw2;
	output wire [50:0] BB_W2_num;
		
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5,ppw0_num6,ppw0_num7,ppw0_num8;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5 + ppw0_num6 + ppw0_num7+ ppw0_num8;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	DRIVER buf1 (ppw0[1],pp0[1],ppw0_num1);
	DRIVER buf2 (ppw0[2],pp0[2],ppw0_num2);
	HA1 ha0 (ppw0[4],ppw0[3],pp0[3],pp1[0],ppw0_num3);
	FA1 fa0 (ppw0[6],ppw0[5],pp0[5],pp1[2],pp2[0],ppw0_num4);
	FA1 fa1 (ppw0[8],ppw0[7],pp0[7],pp1[4],pp2[2],ppw0_num5);
	FA1 fa2 (ppw0[10],ppw0[9],pp0[9],pp1[6],pp2[4],ppw0_num6);
	HA1 ha1 (ppw0[12],ppw0[11],pp0[11],pp1[8],ppw0_num7);
	HA1 ha2 (        ,ppw0[13],pp0[13],pp1[10],ppw0_num8);
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3,ppw1_num4;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3 + ppw1_num4;
	
	HA1 ha3 (ppw1[1],ppw1[0],pp0[4],pp1[1],ppw1_num0);
	FA1 fa3 (ppw1[3],ppw1[2],pp0[6],pp1[3],pp2[1],ppw1_num1);
	FA1 fa4 (ppw1[5],ppw1[4],pp0[8],pp1[5],pp2[3],ppw1_num2);
	HA1 ha4 (ppw1[7],ppw1[6],pp0[10],pp1[7],ppw1_num3);
	HA1 ha5 (ppw1[9],ppw1[8],pp0[12],pp1[9],ppw1_num4);	
	
	//ppw2
	wire [50:0] ppw2_num,ppw2_num0,ppw2_num1;
	assign ppw2_num = ppw2_num0 + ppw2_num1;
	
	DRIVER buf3 (ppw2[0],pp3[0],ppw2_num0);
	DRIVER buf4 (ppw2[1],pp3[1],ppw2_num1);	

	assign BB_W2_num = ppw0_num + ppw1_num + ppw2_num;	

endmodule

module BB_W3 (pp0,pp1,pp2,ppw0,ppw1,BB_W3_num);
    input [13:0] pp0;
	input [ 9:0] pp1;
	input [ 1:0] pp2;
	
	output [13:0] ppw0;
	output [ 8:0] ppw1;
	output wire [50:0] BB_W3_num;
		
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5,ppw0_num6,ppw0_num7,ppw0_num8;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5 + ppw0_num6 + ppw0_num7+ ppw0_num8;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	DRIVER buf1 (ppw0[1],pp0[1],ppw0_num1);
	DRIVER buf2 (ppw0[2],pp0[2],ppw0_num2);
	DRIVER buf3 (ppw0[3],pp0[3],ppw0_num3);
	HA1 ha0 (ppw0[5],ppw0[4],pp0[4],pp1[0],ppw0_num4);
	HA1 ha1 (ppw0[7],ppw0[6],pp0[6],pp1[2],ppw0_num5);
	FA1 fa0 (ppw0[9],ppw0[8],pp0[8],pp1[4],pp2[1],ppw0_num6);
	HA1 ha2 (ppw0[11],ppw0[10],pp0[10],pp1[6],ppw0_num7);
	HA1 ha3 (ppw0[13],ppw0[12],pp0[12],pp1[8],ppw0_num8);
	
		
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3,ppw1_num4;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3 + ppw1_num4;
	
	HA1 ha4 (ppw1[1],ppw1[0],pp0[5],pp1[1],ppw1_num0);
	FA1 fa1 (ppw1[3],ppw1[2],pp0[7],pp1[3],pp2[0],ppw1_num1);
	HA1 ha5 (ppw1[5],ppw1[4],pp0[9],pp1[5],ppw1_num2);
	HA1 ha6 (ppw1[7],ppw1[6],pp0[11],pp1[7],ppw1_num3);
	HA1 ha7 (       ,ppw1[8],pp0[13],pp1[9],ppw1_num4);
	
	assign BB_W3_num = ppw0_num + ppw1_num;

endmodule

module SUMBB(pp0,pp1,S,SUMBB_num);
    input [13:0] pp0;
	input [ 8:0] pp1;
	
	output [13:0] S;
	output wire [50:0] SUMBB_num;
	
	wire [7:0] temp;
	wire [50:0] SUMBB_num0,SUMBB_num1,SUMBB_num2,SUMBB_num3,SUMBB_num4,SUMBB_num5,SUMBB_num6,SUMBB_num7;
	wire [50:0] SUMBB_num8,SUMBB_num9,SUMBB_num10,SUMBB_num11,SUMBB_num12,SUMBB_num13;
	
	DRIVER buf0     (S[0],pp0[0],SUMBB_num0);
	DRIVER buf1     (S[1],pp0[1],SUMBB_num1);
	DRIVER buf2     (S[2],pp0[2],SUMBB_num2);
	DRIVER buf3     (S[3],pp0[3],SUMBB_num3);
	DRIVER buf4     (S[4],pp0[4],SUMBB_num4);
	FA1 fa0 (temp[0],S[5],pp0[5],pp1[0],1'b0,SUMBB_num5);
	FA1 fa1 (temp[1],S[6],pp0[6],pp1[1],temp[0],SUMBB_num6);
	FA1 fa2 (temp[2],S[7],pp0[7],pp1[2],temp[1],SUMBB_num7);
	FA1 fa3 (temp[3],S[8],pp0[8],pp1[3],temp[2],SUMBB_num8);
	FA1 fa4 (temp[4],S[9],pp0[9],pp1[4],temp[3],SUMBB_num9);
	FA1 fa5 (temp[5],S[10],pp0[10],pp1[5],temp[4],SUMBB_num10);
	FA1 fa6 (temp[6],S[11],pp0[11],pp1[6],temp[5],SUMBB_num11);
	FA1 fa7 (temp[7],S[12],pp0[12],pp1[7],temp[6],SUMBB_num12);
	FA1 fa8 (       ,S[13],pp0[13],pp1[8],temp[7],SUMBB_num13);
	
	
	assign SUMBB_num = SUMBB_num0+SUMBB_num1+SUMBB_num2+SUMBB_num3+SUMBB_num4+SUMBB_num5+SUMBB_num6+SUMBB_num7+SUMBB_num8+SUMBB_num9+SUMBB_num10+SUMBB_num11+SUMBB_num12+SUMBB_num13;
		
endmodule

//the partial product of A*C
module AC_pp (A,C,pp0,pp1,pp2,pp3,pp4,pp5,AC_pp_num);
    input [3:0] A;
	input [5:0] C;
	
	output [6:0] pp0;
	output [5:0] pp1,pp2,pp3,pp4;
	output [6:0] pp5;
	output wire [50:0] AC_pp_num;
		
	//pp0
	wire [50:0] pp0_num,pp0_num0,pp0_num1,pp0_num2,pp0_num3,pp0_num4,pp0_num5,pp0_num6;
	assign pp0_num = pp0_num0+pp0_num1+pp0_num2+pp0_num3+pp0_num4+pp0_num5+pp0_num6;
	
	AN2 an0(pp0[0],A[0],C[0],pp0_num0);
	AN2 an1(pp0[1],A[0],C[1],pp0_num1);
	AN2 an2(pp0[2],A[0],C[2],pp0_num2);
	AN2 an3(pp0[3],A[0],C[3],pp0_num3);
	AN2 an4(pp0[4],A[0],C[4],pp0_num4);
	ND2 nd0(pp0[5],A[0],C[5],pp0_num5);
	DRIVER  buf0(pp0[6],1'b1,pp0_num6);
	
	//pp1
	wire [50:0] pp1_num,pp1_num0,pp1_num1,pp1_num2,pp1_num3,pp1_num4,pp1_num5;
	assign pp1_num = pp1_num0+pp1_num1+pp1_num2+pp1_num3+pp1_num4+pp1_num5;
	
	AN2 an5(pp1[0],A[1],C[0],pp1_num0);
	AN2 an6(pp1[1],A[1],C[1],pp1_num1);
	AN2 an7(pp1[2],A[1],C[2],pp1_num2);
	AN2 an8(pp1[3],A[1],C[3],pp1_num3);
	AN2 an9(pp1[4],A[1],C[4],pp1_num4);
	ND2 nd1(pp1[5],A[1],C[5],pp1_num5);
	
	//pp2
	wire [50:0] pp2_num,pp2_num0,pp2_num1,pp2_num2,pp2_num3,pp2_num4,pp2_num5;
	assign pp2_num = pp2_num0+pp2_num1+pp2_num2+pp2_num3+pp2_num4+pp2_num5;
	
	AN2 an10(pp2[0],A[2],C[0],pp2_num0);
	AN2 an11(pp2[1],A[2],C[1],pp2_num1);
	AN2 an12(pp2[2],A[2],C[2],pp2_num2);
	AN2 an13(pp2[3],A[2],C[3],pp2_num3);
	AN2 an14(pp2[4],A[2],C[4],pp2_num4);
	ND2 nd2 (pp2[5],A[2],C[5],pp2_num5);
	
	//pp3
	wire [50:0] pp3_num,pp3_num0,pp3_num1,pp3_num2,pp3_num3,pp3_num4,pp3_num5;
	assign pp3_num = pp3_num0+pp3_num1+pp3_num2+pp3_num3+pp3_num4+pp3_num5;
	
	AN2 an15(pp3[0],A[3],C[0],pp3_num0);
	AN2 an16(pp3[1],A[3],C[1],pp3_num1);
	AN2 an17(pp3[2],A[3],C[2],pp3_num2);
	AN2 an18(pp3[3],A[3],C[3],pp3_num3);
	AN2 an19(pp3[4],A[3],C[4],pp3_num4);
	ND2 nd3 (pp3[5],A[3],C[5],pp3_num5);
	
	//pp4
	wire [50:0] pp4_num,pp4_num0,pp4_num1,pp4_num2,pp4_num3,pp4_num4,pp4_num5;
	assign pp4_num = pp4_num0+pp4_num1+pp4_num2+pp4_num3+pp4_num4+pp4_num5;
	
	AN2 an20(pp4[0],A[3],C[0],pp4_num0);
	AN2 an21(pp4[1],A[3],C[1],pp4_num1);
	AN2 an22(pp4[2],A[3],C[2],pp4_num2);
	AN2 an23(pp4[3],A[3],C[3],pp4_num3);
	AN2 an24(pp4[4],A[3],C[4],pp4_num4);
	ND2 nd4 (pp4[5],A[3],C[5],pp4_num5);	
	
	//pp5
	wire [50:0] pp5_num,pp5_num0,pp5_num1,pp5_num2,pp5_num3,pp5_num4,pp5_num5,pp5_num6;
	assign pp5_num = pp5_num0+pp5_num1+pp5_num2+pp5_num3+pp5_num4+pp5_num5+pp5_num6;
	
	ND2 nd5  (pp5[0],A[3],C[0],pp5_num0);
	ND2 nd6  (pp5[1],A[3],C[1],pp5_num1);
	ND2 nd7  (pp5[2],A[3],C[2],pp5_num2);
	ND2 nd8  (pp5[3],A[3],C[3],pp5_num3);
	ND2 nd9  (pp5[4],A[3],C[4],pp5_num4);
	AN2 an25 (pp5[5],A[3],C[5],pp5_num5);
	DRIVER  buf1(pp5[6],  1'b1,pp5_num6);
	
	assign AC_pp_num = pp0_num+pp1_num+pp2_num+pp3_num+pp4_num+pp5_num;
 
endmodule

module AC_W0 (pp0,pp1,pp2,pp3,pp4,pp5,ppw0,ppw1,ppw2,ppw3,AC_W0_num);
    input [6:0] pp0;
	input [5:0] pp1,pp2,pp3,pp4;
	input [6:0] pp5; 
	
	output [8:0] ppw0;
	output [7:0] ppw1;
	output [6:0] ppw2;
	output [4:0] ppw3;
	output wire [50:0] AC_W0_num;
	
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	HA1     ha0 (ppw0[2],ppw0[1],pp0[1],pp1[0],ppw0_num1);
	FA1     fa0 (ppw0[4],ppw0[3],pp0[3],pp1[2],pp2[1],ppw0_num2);
	FA1     fa1 (ppw0[6],ppw0[5],pp0[5],pp1[4],pp2[3],ppw0_num3);
	FA1     fa2 (ppw0[8],ppw0[7],pp2[5],pp3[4],pp4[3],ppw0_num4);
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3;
	
	FA1 fa3 (ppw1[1],ppw1[0],pp0[2],pp1[1],pp2[0],ppw1_num0); 
	FA1 fa4 (ppw1[3],ppw1[2],pp0[4],pp1[3],pp2[2],ppw1_num1);
	FA1 fa5 (ppw1[5],ppw1[4],pp0[6],pp1[5],pp2[4],ppw1_num2);
	FA1 fa6 (ppw1[7],ppw1[6],pp3[5],pp4[4],pp5[3],ppw1_num3);
	
	//ppw2
	wire [50:0] ppw2_num,ppw2_num0,ppw2_num1,ppw2_num2,ppw2_num3;
	assign ppw2_num = ppw2_num0 + ppw2_num1 + ppw2_num2 + ppw2_num3;
	
	DRIVER buf1 (ppw2[0],pp3[0],ppw2_num0);
	HA1     ha1 (ppw2[2],ppw2[1],pp3[1],pp4[0],ppw2_num1);
	FA1     fa7 (ppw2[4],ppw2[3],pp3[3],pp4[2],pp5[1],ppw2_num2);
	HA1     ha2 (ppw2[6],ppw2[5],pp4[5],pp5[4],ppw2_num3);
	
	//ppw3
	wire [50:0] ppw3_num,ppw3_num0,ppw3_num1,ppw3_num2,ppw3_num3;
	assign ppw3_num = ppw3_num0 + ppw3_num1 + ppw3_num2 + ppw3_num3;
	
	FA1     fa8 (ppw3[1],ppw3[0],pp3[2],pp4[1],pp5[0],ppw3_num0);
	DRIVER buf2 (ppw3[2],pp5[2],ppw3_num1);
	DRIVER buf3 (ppw3[3],pp5[5],ppw3_num2);
	DRIVER buf4 (ppw3[4],  1'b1,ppw3_num3);
	
	assign AC_W0_num = ppw0_num + ppw1_num + ppw2_num + ppw3_num ;
		
endmodule

module AC_W1 (pp0,pp1,pp2,pp3,ppw0,ppw1,ppw2,AC_W1_num);
    input [8:0] pp0;
	input [7:0] pp1;
	input [6:0] pp2;
	input [4:0] pp3;
	
	output [9:0] ppw0;
	output [8:0] ppw1;
	output [4:0] ppw2;
	output wire [50:0] AC_W1_num;
	
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	DRIVER buf1 (ppw0[1],pp0[1],ppw0_num1);
	HA1     ha0 (ppw0[3],ppw0[2],pp0[2],pp1[0],ppw0_num2);
	FA1     fa0 (ppw0[5],ppw0[4],pp0[4],pp1[2],pp2[1],ppw0_num3);
	FA1     fa1 (ppw0[7],ppw0[6],pp0[6],pp1[4],pp2[3],ppw0_num4);
	HA1     ha1 (ppw0[9],ppw0[8],pp0[8],pp1[6],ppw0_num5);
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3,ppw1_num4;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3 + ppw1_num4 ;
	
	FA1 fa2 (ppw1[1],ppw1[0],pp0[3],pp1[1],pp2[0],ppw1_num0);
	FA1 fa3 (ppw1[3],ppw1[2],pp0[5],pp1[3],pp2[2],ppw1_num1);
	FA1 fa4 (ppw1[5],ppw1[4],pp0[7],pp1[5],pp2[4],ppw1_num2);
	HA1 ha2 (ppw1[7],ppw1[6],pp1[7],pp2[5],ppw1_num3);
	DRIVER buf2 (ppw1[8],pp3[4],ppw1_num4);
	
	//ppw2
	wire [50:0] ppw2_num,ppw2_num0,ppw2_num1,ppw2_num2,ppw2_num3;
	assign ppw2_num = ppw2_num0 + ppw2_num1 + ppw2_num2 + ppw2_num3;
	
	DRIVER buf3 (ppw2[0],pp3[0],ppw2_num0);
	DRIVER buf4 (ppw2[1],pp3[1],ppw2_num1);
	DRIVER buf5 (ppw2[2],pp3[2],ppw2_num2);
	HA1     ha3 (ppw2[4],ppw2[3],pp2[6],pp3[3],ppw2_num3);
	
	assign AC_W1_num = ppw0_num + ppw1_num + ppw2_num;
	
endmodule

module AC_W2 (pp0,pp1,pp2,ppw0,ppw1,AC_W2_num);
    input [9:0] pp0;
	input [8:0] pp1;
	input [4:0] pp2;
	
	output [11:0] ppw0;
	output [ 7:0] ppw1;
	output wire [50:0] AC_W2_num;
		
	//ppw0
	wire [50:0] ppw0_num,ppw0_num0,ppw0_num1,ppw0_num2,ppw0_num3,ppw0_num4,ppw0_num5,ppw0_num6,ppw0_num7;
	assign ppw0_num = ppw0_num0 + ppw0_num1 + ppw0_num2 + ppw0_num3 + ppw0_num4 + ppw0_num5 + ppw0_num6 + ppw0_num7;
	
	DRIVER buf0 (ppw0[0],pp0[0],ppw0_num0);
	DRIVER buf1 (ppw0[1],pp0[1],ppw0_num1);
	DRIVER buf2 (ppw0[2],pp0[2],ppw0_num2);
	HA1     ha0 (ppw0[4],ppw0[3],pp0[3],pp1[0],ppw0_num3);
	FA1     fa0 (ppw0[6],ppw0[5],pp0[5],pp1[2],pp2[0],ppw0_num4);
	FA1     fa1 (ppw0[8],ppw0[7],pp0[7],pp1[4],pp2[2],ppw0_num5);
	HA1     ha1 (ppw0[10],ppw0[9],pp0[9],pp1[6],ppw0_num6);
	HA1 	ha2 (        ,ppw0[11],pp1[8],pp2[4],ppw0_num7);
	
	//ppw1
	wire [50:0] ppw1_num,ppw1_num0,ppw1_num1,ppw1_num2,ppw1_num3;
	assign ppw1_num = ppw1_num0 + ppw1_num1 + ppw1_num2 + ppw1_num3;
	
	HA1 ha3 (ppw1[1],ppw1[0],pp0[4],pp1[1],ppw1_num0);
	FA1 fa2 (ppw1[3],ppw1[2],pp0[6],pp1[3],pp2[1],ppw1_num1);
	HA1 ha4 (ppw1[5],ppw1[4],pp0[8],pp1[5],ppw1_num2);
	HA1 ha5 (ppw1[7],ppw1[6],pp1[7],pp2[3],ppw1_num3);
	
	assign AC_W2_num = ppw0_num + ppw1_num;
	
endmodule

module SUMAC(pp0,pp1,S,SUMAC_num);
    input [11:0] pp0;
	input [ 7:0] pp1;
	
	output [11:0] S;
	output wire [50:0] SUMAC_num;
	
	wire [6:0] temp;
	wire [50:0] SUMAC_num0,SUMAC_num1,SUMAC_num2,SUMAC_num3,SUMAC_num4,SUMAC_num5,SUMAC_num6,SUMAC_num7;
	wire [50:0] SUMAC_num8,SUMAC_num9,SUMAC_num10,SUMAC_num11;
	
	DRIVER buf0       (S[0], pp0[0],SUMAC_num0);
	DRIVER buf1       (S[1], pp0[1],SUMAC_num1);
	DRIVER buf2       (S[2], pp0[2],SUMAC_num2);
	DRIVER buf3       (S[3], pp0[3],SUMAC_num3);
	FA1  fa0 (temp[0], S[4], pp0[4],pp1[0],   1'b0,SUMAC_num4);
	FA1  fa1 (temp[1], S[5], pp0[5],pp1[1],temp[0],SUMAC_num5);
	FA1  fa2 (temp[2], S[6], pp0[6],pp1[2],temp[1],SUMAC_num6);
	FA1  fa3 (temp[3], S[7], pp0[7],pp1[3],temp[2],SUMAC_num7);
	FA1  fa4 (temp[4], S[8], pp0[8],pp1[4],temp[3],SUMAC_num8);
	FA1  fa5 (temp[5], S[9], pp0[9],pp1[5],temp[4],SUMAC_num9);
	FA1  fa6 (temp[6],S[10],pp0[10],pp1[6],temp[5],SUMAC_num10);
	FA1  fa7 (       ,S[11],pp0[11],pp1[7],temp[6],SUMAC_num11);
		
	assign SUMAC_num = SUMAC_num0+SUMAC_num1+SUMAC_num2+SUMAC_num3+SUMAC_num4+SUMAC_num5+SUMAC_num6+SUMAC_num7+SUMAC_num8+SUMAC_num9+SUMAC_num10+SUMAC_num11;
	
endmodule

module Reg26 (Q,AC,BB,clk,rst,Reg26_num);
    input		clk;
	input		rst;
	input [11:0] AC;
	input [13:0] BB;
	
	output [25:0] Q;
	output wire [50:0] Reg26_num;
	
	wire [50:0] Reg26_num0,Reg26_num1,Reg26_num2,Reg26_num3,Reg26_num4,Reg26_num5,Reg26_num6,Reg26_num7;
	wire [50:0] Reg26_num8,Reg26_num9,Reg26_num10,Reg26_num11,Reg26_num12,Reg26_num13,Reg26_num14,Reg26_num15;
	wire [50:0] Reg26_num16,Reg26_num17,Reg26_num18,Reg26_num19,Reg26_num20,Reg26_num21,Reg26_num22,Reg26_num23;
	wire [50:0] Reg26_num24,Reg26_num25;
	FD2 fd0 (Q[0],AC[0],clk,rst,Reg26_num0);
	FD2 fd1 (Q[1],AC[1],clk,rst,Reg26_num1);
	FD2 fd2 (Q[2],AC[2],clk,rst,Reg26_num2);
	FD2 fd3 (Q[3],AC[3],clk,rst,Reg26_num3);
	FD2 fd4 (Q[4],AC[4],clk,rst,Reg26_num4);
	FD2 fd5 (Q[5],AC[5],clk,rst,Reg26_num5);
	FD2 fd6 (Q[6],AC[6],clk,rst,Reg26_num6);
	FD2 fd7 (Q[7],AC[7],clk,rst,Reg26_num7);
	FD2 fd8 (Q[8],AC[8],clk,rst,Reg26_num8);
	FD2 fd9 (Q[9],AC[9],clk,rst,Reg26_num9);
	FD2 fd10 (Q[10],AC[10],clk,rst,Reg26_num10);
	FD2 fd11 (Q[11],AC[11],clk,rst,Reg26_num11);
	FD2 fd12 (Q[12],BB[0],clk,rst,Reg26_num12);
	FD2 fd13 (Q[13],BB[1],clk,rst,Reg26_num13);
	FD2 fd14 (Q[14],BB[2],clk,rst,Reg26_num14);
	FD2 fd15 (Q[15],BB[3],clk,rst,Reg26_num15);
	FD2 fd16 (Q[16],BB[4],clk,rst,Reg26_num16);
	FD2 fd17 (Q[17],BB[5],clk,rst,Reg26_num17);
	FD2 fd18 (Q[18],BB[6],clk,rst,Reg26_num18);
	FD2 fd19 (Q[19],BB[7],clk,rst,Reg26_num19);
	FD2 fd20 (Q[20],BB[8],clk,rst,Reg26_num20);
	FD2 fd21 (Q[21],BB[9],clk,rst,Reg26_num21);
	FD2 fd22 (Q[22],BB[10],clk,rst,Reg26_num22);
	FD2 fd23 (Q[23],BB[11],clk,rst,Reg26_num23);
	FD2 fd24 (Q[24],BB[12],clk,rst,Reg26_num24);
	FD2 fd25 (Q[25],BB[13],clk,rst,Reg26_num25);
	
	assign Reg26_num=Reg26_num0+Reg26_num1+Reg26_num2+Reg26_num3+Reg26_num4+Reg26_num5+Reg26_num6+Reg26_num7+Reg26_num8+Reg26_num9+Reg26_num10+Reg26_num11+Reg26_num12+Reg26_num13+Reg26_num14+Reg26_num15+Reg26_num16+Reg26_num17+Reg26_num18+Reg26_num19+Reg26_num20+Reg26_num21+Reg26_num22+Reg26_num23+Reg26_num24+Reg26_num25;
	

endmodule

module Reg15 (Q,D,clk,rst,Reg15_num);
    input		clk;
	input		rst;
	input [14:0] D;
	output [14:0] Q;
	output wire [50:0] Reg15_num;
	
	wire [50:0] Reg15_num0,Reg15_num1,Reg15_num2,Reg15_num3,Reg15_num4,Reg15_num5,Reg15_num6,Reg15_num7,Reg15_num8;
    wire [50:0] Reg15_num9,Reg15_num10,Reg15_num11,Reg15_num12,Reg15_num13,Reg15_num14;	
	
	FD2 fd0 (Q[0],D[0],clk,rst,Reg15_num0);
	FD2 fd1 (Q[1],D[1],clk,rst,Reg15_num1);
	FD2 fd2 (Q[2],D[2],clk,rst,Reg15_num2);
	FD2 fd3 (Q[3],D[3],clk,rst,Reg15_num3);
	FD2 fd4 (Q[4],D[4],clk,rst,Reg15_num4);
	FD2 fd5 (Q[5],D[5],clk,rst,Reg15_num5);
	FD2 fd6 (Q[6],D[6],clk,rst,Reg15_num6);
	FD2 fd7 (Q[7],D[7],clk,rst,Reg15_num7);
	FD2 fd8 (Q[8],D[8],clk,rst,Reg15_num8);
	FD2 fd9 (Q[9],D[9],clk,rst,Reg15_num9);
	FD2 fd10 (Q[10],D[10],clk,rst,Reg15_num10);
	FD2 fd11 (Q[11],D[11],clk,rst,Reg15_num11);
	FD2 fd12 (Q[12],D[12],clk,rst,Reg15_num12);
	FD2 fd13 (Q[13],D[13],clk,rst,Reg15_num13);
	FD2 fd14 (Q[14],D[14],clk,rst,Reg15_num14);
	
	assign Reg15_num=Reg15_num0+Reg15_num1+Reg15_num2+Reg15_num3+Reg15_num4+Reg15_num5+Reg15_num6+Reg15_num7+Reg15_num8+Reg15_num9+Reg15_num10+Reg15_num11+Reg15_num12+Reg15_num13+Reg15_num14;
	

endmodule
