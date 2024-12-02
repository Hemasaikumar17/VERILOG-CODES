/********************************* OCTAL TO BINARY ENCODER *********************************/

/*
   
   ---> It is a combinational circuit which has M inputs lines and N output lines
   ---> M = 2**N
   ---> It is used to convert other codes to binary codes.
   
   
                       -------------
                      |             |
                      |             |
               -------|             |
               -------|             |
               -------|             |-------
               -------|    8 X 3    |
 M input lines -------|   ENCODER   |-------   N output lines
               -------|             |
               -------|             |-------
               -------|             |
                      |             |
                      |             |
                       -------------
                       
                       
                       
                       
         -------------------------------------------------------------------------------
        | Decimal     I7     I6     I5    I4    I3    I2     I1    I0    Y2    Y1    Y0 |
        |-------------------------------------------------------------------------------|
        |    0        0      0      0     0     0     0      0     1     0     0     0  |
        |                                                                               |
        |    1        0      0      0     0     0     0      1     0     0     0     1  |
        |                                                                               |
        |    2        0      0      0     0     0     1      0     0     0     1     0  |
        |                                                                               |
        |    3        0      0      0     0     1     0      0     0     0     1     1  |
        |                                                                               |
        |    4        0      0      0     1     0     0      0     0     1     0     0  |
        |                                                                               |
        |    5        0      0      1     0     0     0      0     0     1     0     1  |
        |                                                                               |
        |    6        0      1      0     0     0     0      0     0     1     1     0  |
        |                                                                               |
        |    7        1      0      0     0     0     0      0     0     1     1     1  |
         -------------------------------------------------------------------------------
         
                     
                       Y2 = I4 + I5 + I6 + I7 
                       Y1 = I2 + I3 + I6 + I7
                       Y0 = I1 + I3 + I5 + I7
                       
*/                       
    

module encoder_8x3(I7,I6,I5,I4,I3,I2,I1,I0,Y2,Y1,Y0);
  input wire I7,I6,I5,I4,I3,I2,I1,I0;
  output reg Y2,Y1,Y0;
  
//DATA FLOW MODELING
  
  /*assign Y2 = I4 | I5 | I6 | I7 ;
  assign Y1 = I2 | I3 | I6 | I7 ;
  assign Y0 = I1 | I3 | I5 | I7 ;*/
  
//GATE LEVEL MODELING
  
  /*or gate1 (Y2,I4,I5,I6,I7);
  or gate2 (Y1,I2,I3,I6,I7);
  or gate3 (Y0,I1,I3,I5,I7);*/
  
//BEHAVIORAL MODELING
  
  always @(*)
 
//IF STATEMENT    
    
    /*if(I0)
      begin
        Y2 = 1'b0 ;
        Y1 = 1'b0 ;
        Y0 = 1'b0 ;
      end
  else if(I1)
    begin
      Y2 = 1'b0 ;
      Y1 = 1'b0 ;
      Y0 = 1'b1 ;
    end
  else if(I2)
    begin
      Y2 = 1'b0 ;
      Y1 = 1'b1 ;
      Y0 = 1'b0 ;
    end
  else if(I3)
    begin
      Y2 = 1'b0 ;
      Y1 = 1'b1 ;
      Y0 = 1'b1 ;
    end
  else if(I4)
    begin
      Y2 = 1'b1 ;
      Y1 = 1'b0 ;
      Y0 = 1'b0 ;
    end
  else if(I5)
    begin
      Y2 = 1'b1 ;
      Y1 = 1'b0 ;
      Y0 = 1'b1 ;
    end
  else if(I6)
    begin
      Y2 = 1'b1 ;
      Y1 = 1'b1 ;
      Y0 = 1'b0 ;
    end
  else if(I7)
    begin
      Y2 = 1'b1 ;
      Y1 = 1'b1 ;
      Y0 = 1'b1 ;
    end
  else
    $display("INVALID INPUT");*/
    
//CASE STATEMENT
    
    case({I7,I6,I5,I4,I3,I2,I1,I0})
      8'b00000001 : begin Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
      8'b00000010 : begin Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b1 ; end
      8'b00000100 : begin Y2 = 1'b0 ; Y1 = 1'b1 ; Y0 = 1'b0 ; end
      8'b00001000 : begin Y2 = 1'b0 ; Y1 = 1'b1 ; Y0 = 1'b1 ; end
      8'b00010000 : begin Y2 = 1'b1 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
      8'b00100000 : begin Y2 = 1'b1 ; Y1 = 1'b0 ; Y0 = 1'b1 ; end
      8'b01000000 : begin Y2 = 1'b1 ; Y1 = 1'b1 ; Y0 = 1'b0 ; end
      8'b10000000 : begin Y2 = 1'b1 ; Y1 = 1'b1 ; Y0 = 1'b1 ; end
      default : $display("INVALID INPUT");
    endcase
  
endmodule
