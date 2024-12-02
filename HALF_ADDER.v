/**************************** HALF ADDER *****************************/

                  
/*                
                  --------------
                 |              |
                 |              |
        A -------|              |------ Sum
                 |  HALF ADDER  |
                 |              |
        B -------|              |------ Carry
                 |              |
                 |              |
                  --------------

        ------------------------------
        |  A      B      SUM     CARRY |
        ------------------------------
           0      0       0        0
           0      1       1        0
           1      0       1        0
           1      1       0        1
        ------------------------------

           SUM = ~A.B + A.(~B)
           SUM =  A ^ B       ---> ^ - xor operation
           CARYY = A.B
           CARRY = A & B      ---> & - and operation
*/
            

module half_adder (A,B,SUM,CARRY);
  input wire A,B;
  output reg SUM,CARRY;
  
  //DATA FLOW MODELING
  
  /*assign SUM = A ^ B;
  assign CARRY = A & B;*/
  
  //GATE LEVEL MODELING
  
  /*xor (SUM,A,B);
  and (CARRY,A,B);*/
  
  //BEHAVIORAL MODELING
  
  always @(A or B)
    begin
      //{CARRY,SUM} = A + B;
      
      //IF STATEMENT
      /*if(A && B)
        begin
          SUM = 0 ; CARRY = 1 ;
        end
      else if(!A && B)
        begin
          SUM = 1 ; CARRY = 0;
        end
      else if(A && !B)
        begin
          SUM = 1 ; CARRY = 0;
        end
      else 
        begin
          SUM = 0 ; CARRY = 0;
        end*/
      
      //CASE STATEMENT
      case ({A,B})
        2'b00 : begin SUM = 1'b0 ; CARRY = 1'b0 ; end
        2'b01 : begin SUM = 1'b1 ; CARRY = 1'b0 ; end
        2'b10 : begin SUM = 1'b1 ; CARRY = 1'b0 ; end
        2'b11 : begin SUM = 1'b0 ; CARRY = 1'b1 ; end
      endcase
    end
endmodule

