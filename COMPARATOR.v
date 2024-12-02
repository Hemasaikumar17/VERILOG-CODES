/******************************* COMPARATOR ********************************/

/*
  
                  --------------
                 |              |
        A -------|              |
                 |              |----- A < B
                 |              |
                 |  COMPARATOR  |
                 |              |----- A = B
                 |              |
        B -------|              |
                 |              |----- A > B
                 |              |
                  --------------
                  
                 
           ----------------------------------------- 
          | A      B       A < B     A = B    A > B |
          |-----------------------------------------|
          | 0      0         0         1        0   |
          | 0      1         1         0        0   |
          | 1      0         0         0        1   |
          | 1      1         0         1        0   |
           ----------------------------------------- 
           
           X = A < B  ; Y = A = B ; Z = A > B
           
           X = ~A & B;
           Y = ~A & ~B | A & B;
           Z = A & ~B;
*/


module comparator(A,B,X,Y,Z);
  input wire A,B;
  output reg X,Y,Z;

// DATA FLOW MODELING
  
  /*assign X = ~A & B ;
  assign Y = A ~^ B ;
  assign Z = A & ~B;*/
  
// GATE LEVEL MODELING
  
  /*and  gate1 (X,~A,B);
  xnor gate2 (Y,A,B);
  and  gate3 (Z,A,~B);*/
  
// BEHAVIORAL MODELING
  
  always @(*)
    begin
      /*if(!A && !B)
        begin
          X = 1'b0 ; Y = 1'b1 ; Z = 1'b0 ;
        end
      else if(!A && B)
        begin
          X = 1'b1 ; Y = 1'b0 ; Z = 1'b0 ;
        end
      else if(A && !B)
        begin
          X = 1'b0 ; Y = 1'b0 ; Z = 1'b1 ;
        end
      else if(A && B)
        begin
          X = 1'b0 ; Y = 1'b1 ; Z = 1'b0 ;
        end
      else 
        $display("INVALID INPUTS");*/
      
// CASE STATEMENT
      
      case({A,B})
        2'b00 : begin X = 1'b0 ; Y = 1'b1 ; Z = 1'b0 ; end
        2'b01 : begin X = 1'b1 ; Y = 1'b0 ; Z = 1'b0 ; end
        2'b10 : begin X = 1'b0 ; Y = 1'b0 ; Z = 1'b1 ; end
        2'b11 : begin X = 1'b0 ; Y = 1'b1 ; Z = 1'b0 ; end
      endcase
    end
endmodule
