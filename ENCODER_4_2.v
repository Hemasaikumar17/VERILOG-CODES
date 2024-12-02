/*************************************** ENCODER *****************************************/

/*               
     
                     
                       ----------------
                      |                |
           I3 --------|                |
                      |                |
           I2 --------|     4 to 2     |-------  Y1
                      |     ENCODER    |
           I1 --------|                |-------  Y0
                      |                |
            I0--------|                |
                      |                | 
                       ----------------



                  ------------------------------------------- 
                 | I3      I2      I1     I0      Y1      Y0 |
                 |-------------------------------------------|
                 |                                           |
                 |  0       0       0      1       0       0 |
                 |                                           |
                 |  0       0       1      0       0       1 |
                 |                                           |
                 |  0       1       0      0       1       0 |
                 |                                           |
                 |  1       0       0      0       1       1 |
                  -------------------------------------------
                  
                  
                  
                  
                      Y1 = I2 + I3 
                      Y0 = I1 + I3
                      
*/
                  
                  
                  
module encoder(I3,I2,I1,I0,Y1,Y0);
  input wire I3,I2,I1,I0;
  output reg Y1,Y0;
  
//DATA FLOW MODELING
  
  /*assign Y0 = I1 | I3;
  assign Y1 = I2 | I3;*/
  
//GATE LEVEL MODELING
  
  /*or gate1 (Y0,I1,I3);
  or gate2 (Y1,I2,I3);*/
  
//BEHAVIORAL MODELING
  
  always @(*)
    begin
      //IF STATEMENT
      /*if(!I3 && !I2 && !I1 && I0)
        begin
          Y1 = 1'b0 ;
          Y0 = 1'b0 ;
        end
      else if(!I3 && !I2 && I1 && !I0)
        begin
          Y1 = 1'b0 ;
          Y0 = 1'b1 ;
        end
      else if(!I3 && I2 && !I1 && !I0)
        begin
          Y1 = 1'b1 ;
          Y0 = 1'b0 ;
        end
      else if(I3 && !I2 && !I1 && !I0)
        begin
          Y1 = 1'b1 ;
          Y0 = 1'b1 ;
        end
      else 
        $display("INVALID INPUT");*/
      
      //CASE STATEMENT
      
      case({I3,I2,I1,I0})
        4'b0001 : begin Y1 = 1'b0 ; Y0 = 1'b0 ; end
        4'b0010 : begin Y1 = 1'b0 ; Y0 = 1'b1 ; end
        4'b0100 : begin Y1 = 1'b1 ; Y0 = 1'b0 ; end
        4'b1000 : begin Y1 = 1'b1 ; Y0 = 1'b1 ; end
        default : $display("INVALID INPUT");
      endcase
    end
endmodule
