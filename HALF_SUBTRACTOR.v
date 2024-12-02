/******************** HALF_SUBTRACTOR *****************/

/*                
                  --------------
                 |              |
                 |              |
        A -------|              |------ DIFFERENCE
                 |     HALF     |
                 |  SUBTRACTOR  |
        B -------|              |------ BORROW
                 |              |
                 |              |
                  --------------

        --------------------------------
        |  A      B      DIFF     BORR |
        |------------------------------|
        |  0      0       0        0   |
        |  0      1       1        1   |
        |  1      0       1        0   |
        |  1      1       0        0   |
        --------------------------------
        
        DIFF = A ^ B 
        BORR = ~(A & B)
*/

module half_subtractor(A,B,DIFF,BORR);
  input wire A,B;
  output reg DIFF,BORR;
  
  //DATA FLOW MODELING
  /*assign DIFF = A ^ B;
  assign BORR = ~A & B;*/
  
  //GATE LEVEL MODELING
  /*xor (DIFF,A,B);
  and (BORR,~A,B);*/
  
  //BEHAVIORAL MODELING
  always @(A or B)
    begin
      //{BORR,DIFF} = A - B;
      
      //IF STATEMENT
      /*if(!A && !B)
        begin
          DIFF = 0 ; BORR = 0;
        end
      else if(!A && B)
        begin
          DIFF = 1 ; BORR = 1;
        end
      else if(A && !B)
        begin
          DIFF = 1 ; BORR = 0;
        end
      else if(A && B)
        begin
          DIFF = 0 ; BORR = 0;
        end
      else
        $display("INVALID INPUTS");*/
      
      case({A,B})
        2'b00 : begin DIFF = 0 ; BORR = 0 ; end
        2'b01 : begin DIFF = 1 ; BORR = 1 ; end
        2'b10 : begin DIFF = 1 ; BORR = 0 ; end
        2'b11 : begin DIFF = 0 ; BORR = 0 ; end
      endcase
    end
endmodule
