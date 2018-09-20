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
      logic[3:0] result;

      w <= SWI[0];
      x <= SWI[1];  
      y <= SWI[2];
      z <= SWI[3];

      result <= ((w*1) + (x*2) + (y*4) + (z*8));
    
      w <= SWI[0];
      x <= SWI[1];  
      y <= SWI[2];
      z <= SWI[3];

      result <= ((w*1) + (x*2) + (y*4) + (z*8));
    
      case (result)
        0 :
            begin
                if(SWI[7] == 1)
                    begin  
                        SEG[0] <= 1;
                        SEG[1] <= 1;
                        SEG[2] <= 0;
                        SEG[3] <= 0;
                        SEG[4] <= 1;
                        SEG[5] <= 1;
                        SEG[6] <= 1;
                        SEG[7] <= 0;
                    end
                else
                    begin
                        SEG[0] <= 1;
                        SEG[1] <= 1;
                        SEG[2] <= 1;
                        SEG[3] <= 1;
                        SEG[4] <= 1;
                        SEG[5] <= 1;
                        SEG[6] <= 0;
                    end
            end            
        
        1 :
            begin
                if(SWI[7] == 1)
                    begin
                        SEG[0] <= 1;
                        SEG[1] <= 1;
                        SEG[2] <= 0;
                        SEG[3] <= 0;
                        SEG[4] <= 1;
                        SEG[5] <= 1;
                        SEG[6] <= 1;
                        SEG[7] <= 0;
                    end
                else
                  begin
                    SEG[0] <= 0;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 0;
                    SEG[4] <= 0;
                    SEG[5] <= 0;
                    SEG[6] <= 0;
                    end
            end
        
        2 :
            begin
                if(SWI[7] == 1)
                  begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 0;
                    SEG[3] <= 0;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                    SEG[7] <= 0;
                  end 
                else
                  begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 0;
                    SEG[3] <= 1;
                    SEG[4] <= 1;
                    SEG[5] <= 0;
                    SEG[6] <= 1;
                  end  
            end     

        3 :
          begin
            if(SWI[7] == 1)
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 0;
                    SEG[3] <= 0;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                    SEG[7] <= 0;
                end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 1;
                    SEG[4] <= 0;
                    SEG[5] <= 0;
                    SEG[6] <= 1;
                end
          end

        4 :
          begin
            if(SWI[7] == 1)
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 0;
                    SEG[2] <= 0;
                    SEG[3] <= 0;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                    SEG[7] <= 0;
                end
            else
                begin
                    SEG[0] <= 0;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 0;
                    SEG[4] <= 0;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                end
          end
        5 :
          begin
            if(SWI[7] == 1)
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 0;
                    SEG[2] <= 0;
                    SEG[3] <= 0;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                    SEG[7] <= 0;
                end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 0;
                    SEG[2] <= 1;
                    SEG[3] <= 1;
                    SEG[4] <= 0;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                end
            end

        6 :
          begin
            if(SWI[7] == 1)
                begin
                  SEG[0] <= 1;
                  SEG[1] <= 0;
                  SEG[2] <= 0;
                  SEG[3] <= 0;
                  SEG[4] <= 1;
                  SEG[5] <= 1;
                  SEG[6] <= 1;
                  SEG[7] <= 0;
                end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 0;
                    SEG[2] <= 1;
                    SEG[3] <= 1;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                  end
            end    

        7 :
          begin
            if(SWI[7] == 1)
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 0;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                    SEG[7] <= 0;
                  end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 0;
                    SEG[4] <= 0;
                    SEG[5] <= 0;
                    SEG[6] <= 0;
                end
            end  

        8 :
          begin
            if(SWI[7] == 1)
              begin
                SEG[0] <= 1;
                SEG[1] <= 1;
                SEG[2] <= 1;
                SEG[3] <= 0;
                SEG[4] <= 1;
                SEG[5] <= 1;
                SEG[6] <= 1;
                SEG[7] <= 0;
              end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 1;
                    SEG[4] <= 1;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                end 
            end       

        9 :
          begin
            if(SWI[7] == 1)
              begin
                SEG[0] <= 1;
                SEG[1] <= 1;
                SEG[2] <= 1;
                SEG[3] <= 0;
                SEG[4] <= 1;
                SEG[5] <= 1;
                SEG[6] <= 1;
                SEG[7] <= 0;
              end
            else
                begin
                    SEG[0] <= 1;
                    SEG[1] <= 1;
                    SEG[2] <= 1;
                    SEG[3] <= 0;
                    SEG[4] <= 0;
                    SEG[5] <= 1;
                    SEG[6] <= 1;
                end
            end

        default :
          begin            
            SEG[0] <= 0;
            SEG[1] <= 0;
            SEG[2] <= 0;
            SEG[3] <= 0;
            SEG[4] <= 0;
            SEG[5] <= 0;
            SEG[6] <= 0;
            SEG[7] <= 1;
          end
    endcase
    end

endmodule
