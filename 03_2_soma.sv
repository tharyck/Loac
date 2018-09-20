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

      logic[1:0] w;
      logic[1:0] x;
      logic[1:0] y;
      logic[1:0] z;
      logic[3:0] result_a;
      logic[1:0] a;
      logic[1:0] b;
      logic[1:0] c;
      logic[1:0] d;
      logic[3:0] result_b;
      logic[4:0] result;

      w <= SWI[0];
      x <= SWI[1];  
      y <= SWI[2];
      z <= SWI[3];

      result_a <= ((w*1) + (x*2) + (y*4) + (z*8));
    
      w <= SWI[0];
      x <= SWI[1];  
      y <= SWI[2];
      z <= SWI[3];
      a <= SWI[4];
      b <= SWI[5];
      c <= SWI[6];
      d <= SWI[7];


      result_a <= ((w*1) + (x*2) + (y*4) + (z*8));
      result_b <= ((a*1) + (b*2) + (c*4) + (d*8));
      result <= (result_a + result_b);

    
      case (result)
        0 :
          begin
            LED[0] <= 0;
            LED[1] <= 0;
            LED[2] <= 0;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 0;
          end
        1 :
          begin
            LED[0] <= 1;
            LED[1] <= 0;
            LED[2] <= 0;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 0;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 0;
            SEG[6] <= 0;
            SEG[7] <= 0;
          end
        2    :
          begin
            LED[0] <= 0;
            LED[1] <= 1;
            LED[2] <= 0;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 0;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 0;
            SEG[6] <= 1;
            SEG[7] <= 0;

          end
         3:
          begin
            LED[0] <= 1;
            LED[1] <= 1;
            LED[2] <= 0;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 0;
            SEG[5] <= 0;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        4:
          begin
            LED[0] <= 0;
            LED[1] <= 0;
            LED[2] <= 1;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 0;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 1;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        5:
          begin
            LED[0] <= 1;
            LED[1] <= 0;
            LED[2] <= 1;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 0;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 0;
            SEG[5] <= 1;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        6:
          begin
            LED[0] <= 0;
            LED[1] <= 1;
            LED[2] <= 1;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 0;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        7:
          begin
            LED[0] <= 1;
            LED[1] <= 1;
            LED[2] <= 1;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 0;
            SEG[6] <= 0;
            SEG[7] <= 0;
          end
        8:
          begin
            LED[0] <= 0;
            LED[1] <= 0;
            LED[2] <= 0;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        9:
          begin
            LED[0] <= 1;
            LED[1] <= 0;
            LED[2] <= 0;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 1;
            SEG[6] <= 1;
            SEG[7] <= 0;
          end
        10:
          begin
            LED[0] <= 0;
            LED[1] <= 1;
            LED[2] <= 0;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        11:
          begin
            LED[0] <= 1;
            LED[1] <= 1;
            LED[2] <= 0;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        12:
          begin
            LED[0] <= 0;
            LED[1] <= 0;
            LED[2] <= 1;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        13:
          begin
            LED[0] <= 1;
            LED[1] <= 0;
            LED[2] <= 1;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        14:
          begin
            LED[0] <= 0;
            LED[1] <= 1;
            LED[2] <= 1;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        15:
          begin
            LED[0] <= 1;
            LED[1] <= 1;
            LED[2] <= 1;
            LED[3] <= 1;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 0;
            SEG[0] <= 1;
            SEG[1] <= 1;
            SEG[2] <= 1;
            SEG[3] <= 1;
            SEG[4] <= 1;
            SEG[5] <= 1;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
        default :
          begin
            LED[0] <= 0;
            LED[1] <= 0;
            LED[2] <= 0;
            LED[3] <= 0;
            LED[4] <= 0;
            LED[5] <= 0;
            LED[6] <= 0;
            LED[7] <= 1;
            
            SEG[0] <= 0;
            SEG[1] <= 0;
            SEG[2] <= 0;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 0;
            SEG[6] <= 0;
            SEG[7] <= 0;
          end
    endcase
    end

endmodule
