/************************************************** FULL ADDER *******************************************************/

 
/*                
                  --------------
                 |              |
        A -------|              |
                 |              |------ DIFFERENCE
        B -------|     FULL     |
                 |  SUBTRACTOR  |
      Bin -------|              |------ BORROW
                 |              |
                 |              |
                  --------------
                  
        ---------------------------------------------
          A       B    	 BIN        DIFF       BORR
        --------------------------------------------- 
          0       0       0          0          0
          0       0       1          1          1         
          0       1       0          1          0
          0       1       1          0          1
          1       0       0          1          0
          1       0       1          0          0
          1       1       0          0          0
          1       1       1          1          1
        ---------------------------------------------
   
       
           DIFF = A ^ B ^ Bin
           BORR = ~A & B | ~B & Bin | A & Bin
   
*/   
        
module full_subtractor(A,B,Bin,DIFF,BORR);
  input wire A,B,Bin;
  output reg DIFF,BORR;
  
  wire w1,w2,w3;
  
  //DATA FLOW MODELING
  /*assign DIFF = A ^ B ^ Bin;
  assign BORR = (~A & B) | (~(A ^ B) & Bin);*/
  
  //GATE LEVEL MODELING
  
  /*xor gate1 (w1,A,B);
  xor gate2 (DIFF,w1,Bin);
  
  and gate3 (w2,~A,B);
  and gate4 (w3,~w1,Bin);
  
  or  gate5 (BORR,w2,w3);*/
  
  //BEHAVIORAL MODELING
  
  always @(A or B or Bin)
    begin
     // {BORR,DIFF} = A - B - Bin;
      
     /* if(!A && !B && !Bin)
        begin
          DIFF = 0 ; BORR = 0;
        end
      else if(!A && !B && Bin)
        begin
          DIFF = 1 ; BORR = 1;
        end
      else if(!A && B && !Bin)
        begin
          DIFF = 1 ; BORR = 1;
        end
      else if(!A && B && Bin)
        begin
          DIFF = 0 ; BORR = 1;
        end
      else if(A && !B && !Bin)
        begin
          DIFF = 1 ; BORR = 0;
        end
      else if(A && !B && Bin)
        begin
          DIFF = 0 ; BORR = 0;
        end
      else if(A && B && !Bin)
        begin
          DIFF = 0 ; BORR = 0;
        end
      else if(A && B && Bin)
        begin
          DIFF = 1 ; BORR = 1;
        end
      else
        $display("INVALID INPUTS");*/
      
      //CASE STATEMENT
      
      case({A,B,Bin})
        3'b000 : begin DIFF = 0 ; BORR = 0 ; end
        3'b001 : begin DIFF = 1 ; BORR = 1 ; end
        3'b010 : begin DIFF = 1 ; BORR = 1 ; end
        3'b011 : begin DIFF = 0 ; BORR = 1 ; end
        3'b100 : begin DIFF = 1 ; BORR = 0 ; end
        3'b101 : begin DIFF = 0 ; BORR = 0 ; end
        3'b110 : begin DIFF = 0 ; BORR = 0 ; end
        3'b111 : begin DIFF = 1 ; BORR = 1 ; end
      endcase
    end
endmodule
