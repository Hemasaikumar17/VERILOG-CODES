/***************************** 2X1_MUX ********************************/


/*                
                  --------------
                 |              |
        I0-------|              |
                 |              |
                 |    2 : 1     |
                 |     MUX      |-------Y
        I1-------|              |
                 |              |
                 |              |
                  --------------
                        |
                        |
                        |
                        S
                  
        --------------------      
       |  S      |      Y   |
        --------------------
       |  0      |     I0   |
       |         |          |
       |  1      |     I1   |
        --------------------
        
          Y = ~S.I0 + S.I1
          
*/

module mux_2x1(I0,I1,S,Y);
  input wire I0,I1;
  input wire S;
  output reg Y;
  
  wire w1,w2,w3;
  
//DATA FLOW MODELING
  
  //assign Y = (!S & I0) | (S & I1);
  
//GATE LEVEL MODELING
  
  /*not gate1 (w1,S);
  
  and gate2 (w2,w1,I0);
  and gate3 (w3,S,I1);
  
  or  gate5 (Y,w2,w3);*/
  
//BEHAVIORAL MODELING
  
  always @(I0 or I1 or S)
    begin
  
//IF STATEMENT
      
      /*if(!S)
        Y = I0;
        else if(S)
          Y = I1;
      else
        $display("INVALID INPUTS OR SELECTION LINE");*/
      
//CASE STATEMENT
      
      case(S)
        1'b0 : Y = I0;
        1'b1 : Y = I1;
      endcase
    end
endmodule
