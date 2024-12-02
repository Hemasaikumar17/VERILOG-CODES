/************************************************** FULL ADDER *******************************************************/

 
/*                
                  --------------
                 |              |
        A -------|              |
                 |              |------ Sum
        B -------|  FULL ADDER  |
                 |              |
      Cin -------|              |------ Carry
                 |              |
                 |              |
                  --------------
                  
        --------------------------------------------
          A       B      CIN        SUM       CARRY
        -------------------------------------------- 
          0       0       0          0          0
          0       0       1          1          0         
          0       1       0          1          0
          0       1       1          0          1
          1       0       0          1          0
          1       0       1          0          1
          1       1       0          0          1
          1       1       1          1          1
        ---------------------------------------------
        
        
        SUM = A ^ B ^ C
        CARRY = (A & B) | (B & Cin) | (A & Cin) 
        */

module full_adder(A,B,Cin,SUM,CARRY);
  input wire A,B,Cin;
  output reg SUM,CARRY;
  
  wire w1,w2,w3;
  
  //DATA FLOW MODELING
  /*assign SUM = A ^ B ^ Cin;
  assign CARRY = (A & B) | (B & Cin) | (A & Cin);*/
  
  //GATE LEVEL MODELING
  
  /*xor gate1 (w1,A,B);
  xor gate2 (SUM,w1,Cin);
  and gate3 (w2,A,B);
  and gate4 (w3,w1,Cin);
  or  gate5 (CARRY,w2,w3);*/
  
  //BEHAVIORAL MODELING
  always @(A or B or Cin)
    begin
      //{CARRY,SUM} = A + B + Cin;
      
      //IF STATEMENT
      /*if(!A && !B && !Cin)
        begin
          SUM = 1'b0 ; CARRY = 1'b0;
        end
      else if(!A && !B && Cin)
        begin
          SUM = 1'b1 ; CARRY = 1'b0;
        end
      else if(!A && B && !Cin)
        begin
          SUM = 1'b1 ; CARRY = 1'b0;
        end
      else if(!A && B && Cin)
        begin
          SUM = 1'b0 ; CARRY = 1'b1;
        end
      else if(A && !B && !Cin)
        begin
          SUM = 1'b1 ; CARRY = 1'b0;
        end
      else if(A && !B && Cin)
        begin
          SUM = 1'b0 ; CARRY = 1'b1;
        end
      else if(A && B && !Cin)
        begin
          SUM = 1'b0 ; CARRY = 1'b1;
        end
      else if(A && B && Cin)
        begin
          SUM = 1'b1 ; CARRY = 1'b1;
        end
      else 
        $display("INVALID INPUT");*/
      
      //CASE STATEMENT
      case({A,B,Cin})
        3'b000 : begin SUM = 1'b0 ; CARRY = 1'b0 ; end
        3'b001 : begin SUM = 1'b1 ; CARRY = 1'b0 ; end
        3'b010 : begin SUM = 1'b1 ; CARRY = 1'b0 ; end
        3'b011 : begin SUM = 1'b0 ; CARRY = 1'b1 ; end
        3'b100 : begin SUM = 1'b1 ; CARRY = 1'b0 ; end
        3'b101 : begin SUM = 1'b0 ; CARRY = 1'b1 ; end
        3'b110 : begin SUM = 1'b0 ; CARRY = 1'b1 ; end
        3'b111 : begin SUM = 1'b1 ; CARRY = 1'b1 ; end
      endcase
    end
endmodule
