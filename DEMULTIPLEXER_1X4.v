/*********************** 1 X 4 DEMULTIPLEXER ***********************/

/*                
                  --------------
                 |              |
                 |              |------- Y0
                 |              |
                 |    1 X 4     |------- Y1
       I --------|              |
                 |    DEMUX     |------- Y2
                 |              |
                 |              |------- Y3
                 |              |
                  --------------
                     |      |  
                     |      |
                     |      |
                     S0     S1
                     
                     
                   
                  ---------------------------------------------- 
                 |  S0     S1      Y0      Y1       Y2       Y3 |
                 |----------------------------------------------|
                 |  0      0       I       0        0        0  |
                 |                                              |
                 |  0      1       0       I        0        0  |
                 |                                              |
                 |  1      0       0       0        I        0  |
                 |                                              |
                 |  1      1       0       0        0        I  |
                  ----------------------------------------------
                  
                             Y0 = ~S0 & ~S1 & I
                             Y1 = ~S0 &  S1 & I
                             Y2 =  S0 & ~S1 & I
                             Y3 =  S0 &  S1 & I
*/


module demultiplexer_4x1(I,S0,S1,Y0,Y1,Y2,Y3);
  input wire I;
  input wire S0,S1;
  output reg Y0,Y1,Y2,Y3;
  
//DATA FLOW MODELING
  
  /*assign Y0 = ~S0 & ~S1 & I ;
  assign Y1 = ~S0 &  S1 & I ;
  assign Y2 =  S0 & ~S1 & I ;
  assign Y3 =  S0 &  S1 & I ;*/
  
//GATE LEVEL MODELING
  
  /*not gate1 (w1,S0);
  not gate2 (w2,S1);
  
  and gate3 (Y0,I,w1,w2);
  and gate4 (Y1,I,w1,S1);
  and gate5 (Y2,I,S0,w2);
  and gate6 (Y3,I,S0,S1);*/
  
//BEHAVIORAL MODELING
  
  always @(*)
    begin
      
      //IF STATEMENT
      /*if(!S0 && !S1)
        begin
          Y0 = I ;
          Y1 = 0 ;
          Y2 = 0 ;
          Y3 = 0 ;
        end
      else if(!S0 && S1)
        begin
          Y0 = 0 ;
          Y1 = I ;
          Y2 = 0 ;
          Y3 = 0 ;
        end
      else if(S0 && !S1)
        begin
          Y0 = 0 ;
          Y1 = 0 ;
          Y2 = I ;
          Y3 = 0 ;
        end
      else if(S0 && S1)
        begin
          Y0 = 0 ;
          Y1 = 0 ;
          Y2 = 0 ;
          Y3 = I ;
        end
      else 
        $display("INVALID SELECTION LINE");*/
      
      //CASE STATEMENT
      case({S0,S1})
        2'b00 : begin Y0 = I    ; Y1 = 1'b0 ; Y2 = 1'b0 ; Y3 = 1'b0 ; end
        2'b01 : begin Y0 = 1'b0 ; Y1 = I    ; Y2 = 1'b0 ; Y3 = 1'b0 ; end
        2'b10 : begin Y0 = 1'b0 ; Y1 = 1'b0 ; Y2 = I    ; Y3 = 1'b0 ; end
        2'b11 : begin Y0 = 1'b0 ; Y1 = 1'b0 ; Y2 = 1'b0 ; Y3 = I    ; end
        default : $display("INVALID SELECTION LINE");
      endcase
    end
endmodule
