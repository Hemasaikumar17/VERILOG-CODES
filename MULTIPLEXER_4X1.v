/***************************** 4X1_MUX ********************************/


/*                
                  --------------
                 |              |
       I0 -------|              |
                 |              |
       I1 -------|              |
                 |    4 : 1     |------- Y
       I2 -------|     MUX      |
                 |              |
       I3 -------|              |
                 |              |
                  --------------
                     |      |
                     |      |
                     |      |
                    S0     S1
                        
                        
                  
       ----------------      
      |  S0  S1  |  Y  |
      |----------------|
      |  0   0   |  I0 |
      |          |     |
      |  0   1   |  I1 |
      |          |     |
      |  1   0   |  I2 |
      |          |     |
      |  1   1   |  I3 |
       ----------------
       
       Y = ~S0 & S1 & I0 | ~S0 & S1 & I1 | S0 & ~S1 & I2 | S0 & S1 & I3
       
*/


module Multiplexer_4x1(I0,I1,I2,I3,S0,S1,Y);
  input wire I0,I1,I2,I3;
  input wire S0,S1;
  output reg Y;
  
//DATA FLOW
  
  //assign Y = (~S0 & ~S1 & I0) | (~S0 & S1 & I1) | (S0 & ~S1 & I2) | (S0 & S1 & I3) ;
  
//GATE LEVEL MODELING
  
  /*not gate1 (w1,S0);
  not gate2 (w2,S1);
  
  and gate3 (w3,w1,w2,I0);
  and gate4 (w4,w1,S1,I1);
  and gate5 (w5,S0,w2,I2);
  and gate6 (w6,S0,S1,I3);
  
  or  gate7 (Y,w3,w4,w5,w6);*/
  
//BEHAVIORAL MODELING
  
  always @(*)
    begin
      
      //IF STATEMENT
      /*if(!S0 && !S1)
        Y = I0;
      else if(!S0 && S1)
        Y = I1;
      else if(S0 && !S1)
        Y = I2;
      else if(S0 && S1)
        Y = I3;
      else
        $display("INVALID SELECTION LINE");*/
      
      //CASE STATEMENT
      case({S0,S1})
        2'b00 : Y = I0 ;
        2'b01 : Y = I1 ;
        2'b10 : Y = I2 ;
        2'b11 : Y = I3 ;
        default : $display("INVALID SELECTION LINE");
      endcase
    end
endmodule
