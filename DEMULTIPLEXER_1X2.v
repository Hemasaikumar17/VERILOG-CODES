/*********************** 1 X 2 DEMULTIPLEXER ***********************/

/*                
                  --------------
                 |              |
                 |              |
                 |              |--------Y0
                 |    1 X 2     |
        I--------|              |
                 |    DEMUX     |
                 |              |--------Y1
                 |              |
                 |              |
                  --------------
                        |
                        |
                        |
                        S
                        
                       
               Y0 = ~S & I;
               I1 = S & I;
               
               
          ----------------------
          | S     I    Y0    Y1 |
          |---------------------|
          | 0     0    0     0  |
          | 0     1    1     0  |
          | 1     0    0     0  |
          | 1     1    0     1  |
          ---------------------- 
           
*/

module demux_1x2(I,S,Y0,Y1);
  input wire I;
  input wire S;
  output reg Y0,Y1;
  
//DATA FLOW MODELING
  
  /*assign Y0 = ~S & I;
  assign Y1 = S & I;*/
  
//GATE LEVEL MODELING
  
  /*not gate1 (w1,S);
  
  and gate2 (Y0,w1,I);
  and gate3 (Y1,S,I);*/
  
//BEHAVIORAL MODELING
  
  always @(S or I)
    begin
      
//IF STATEMENT
      
      /*if(!S)
        begin
          Y0 = I;
          Y1 = 0;
        end
      else if(S)
        begin
          Y1 = I;
          Y0 = 0;
        end
      else 
        $display("INVALID INPUTS OR SELECTION LINE");*/
      
//CASE STATEMENT
      
      case(S)
        1'b0 : begin Y0 = I ; Y1 = 1'b0 ; end
        1'b1 : begin Y0 = 1'b0 ; Y1 = I ; end
      endcase
    end
endmodule
