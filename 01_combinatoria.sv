// DESCRIPTION: Verilator: Systemverilog example module
// with interface to switch buttons, LEDs, LCD and register display

parameter NINSTR_BITS = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NINSTR_BITS-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData, 
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);

  always_comb begin
    lcd_WriteData <= SWI;
    lcd_pc <= 'h12;
    lcd_instruction <= 'h34567890;
    lcd_SrcA <= 'hab;
    lcd_SrcB <= 'hcd;
    lcd_ALUResult <= 'hef;
    lcd_Result <= 'h11;
    lcd_ReadData <= 'h33;
    lcd_MemWrite <= SWI[0];
    lcd_Branch <= SWI[1];
    lcd_MemtoReg <= SWI[2];
    lcd_RegWrite <= SWI[3];
    for(int i=0; i<NREGS_TOP; i++) lcd_registrador[i] <= i+i*16;
  end

  //questão 1
  always_comb
    begin  
      LED[0] <= ~(SWI[0] & SWI[1] & SWI[2]);
      LED[1] <= ~(SWI[1] & SWI[2]);
    end

  //questão 2
  always_comb
    begin
      LED[7] <= (SWI[4] & SWI[3]);
      LED[6] <= (~SWI[3] & ~SWI[4]);
      SEG[7] <= (~SWI[3] & SWI[4]);
    end

  //questao 3
  always_comb
    begin
      if((SWI[7] == 1) & (SWI[0] == 0) | (SWI[0] & SWI[1] & ~SWI[2])) 
        begin
          SEG[0] <= 0;
        end
        else
          begin
            SEG[0] <= 1;
          end
    end  

//quarta questao
always_comb
    begin
      if(SWI[7] == 1) 
      	begin
      		LED[0] = 0;
      		LED[1] = 0;
      		LED[2] = 0;
      		LED[3] = 0;
      		LED[4] = 0;
      		LED[5] = 0;
      		LED[6] = 0;
      		LED[7] = 0;
      		if((SWI[3] & SWI[4]) | (SWI[5] & SWI[6] & SWI[4])) 
        	begin
          		LED[2] <= 1;
        	end
        	else
	          begin
	          end
	    end
	  else
		begin
		end
    end  	   

endmodule
