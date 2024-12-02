/*************************************** DECODER *****************************************/

/*  
   
       ---> A Decoder is combinational circuit. Which has M input lines and N output lines.
       ---> N = 2 ** M
       ---> A decoder is used to convert binary code to other codes.
       
       
                     
                               -----------------------
                              |                       |
                              |                       |------- Y0
                              |                       |
                              |                       |------- Y1
                    I0 -------|                       |
                              |                       |------- Y2
                              |                       |   
                              |         3 X 8         |------- Y3
      M Input Lines I1 -------|        DECODER        |             N Output Lines
                              |                       |------- Y4
                              |                       |
                              |                       |------- Y5
                    I2 -------|                       | 
                              |                       |------- Y6
                              |                       |
                              |                       |------- Y7
                              |                       |
                               -----------------------
                               
                               
                              
                              
             ------------------------------------------------------------------------------      
            | Decimal     I2    I1    I0     Y7    Y6    Y5    Y4    Y3    Y2    Y1    Y0  |  
            |------------------------------------------------------------------------------|
            |                                                                              |
            |    0        0     0     0      0     0     0     0     0     0     0     1   |
            |                                                                              |
            |    1        0     0     1      0     0     0     0     0     0     1     0   |
            |                                                                              |
            |    2        0     1     0      0     0     0     0     0     1     0     0   |
            |                                                                              |
            |    3        0     1     1      0     0     0     0     1     0     0     0   |
            |                                                                              |
            |    4        1     0     0      0     0     0     1     0     0     0     0   |
            |                                                                              |
            |    5        1     0     1      0     0     1     0     0     0     0     0   |
            |                                                                              |
            |    6        1     1     0      0     1     0     0     0     0     0     0   |
            |                                                                              |
            |    7        1     1     1      1     0     0     0     0     0     0     0   |
             ------------------------------------------------------------------------------
             
             
             
                  Y0 = ~ I0 & ~I1 & ~I2 
                  Y1 =   I0 & ~I1 & ~I2
                  Y2 =  ~I0 &  I1 & ~I2
                  Y3 =   I0 &  I1 & ~I2
                  Y4 =  ~I0 & ~I1 &  I2
                  Y5 =   I0 & ~I1 &  I2
                  Y6 =  ~I0 &  I1 &  I2
                  Y7 =   I0 &  I1 &  I2
             
*/

module decoder(I2,I1,I0,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
  input wire I2,I1,I0;
  output reg Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0;
  
//DATA FLOW MODELING
  
  /*assign Y0 = ~I0 & ~I1 & ~I2 ;
  assign Y1 =  I0 & ~I1 & ~I2 ;
  assign Y2 = ~I0 &  I1 & ~I2 ;
  assign Y3 =  I0 &  I1 & ~I2 ;
  assign Y4 = ~I0 & ~I1 &  I2 ;
  assign Y5 =  I0 & ~I1 &  I2 ;
  assign Y6 = ~I0 &  I1 &  I2 ;
  assign Y7 =  I0 &  I1 &  I2 ;*/
  
//GATE LEVEL MODELING
  
  /*not gate1  (w1,I0);
  not gate2  (w2,I1);
  not gate3  (w3,I2);
  
  and gate4  (Y0,w1,w2,w3);
  and gate5  (Y1,I0,w2,w3);
  and gate6  (Y2,w1,I1,w3);
  and gate7  (Y3,I0,I1,w3);
  and gate8  (Y4,w1,w2,I2);
  and gate9  (Y5,I0,w2,I2);
  and gate10 (Y6,w1,I1,I2);
  and gate11 (Y7,I0,I1,I2);*/
  
//BEHAVIORAL MODELING
  
  always @(*)
    begin
      
      //IF STATEMENT
      /*if(!I0 && !I1 && !I2)
        begin
          Y0 = 1'b1;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(I0 && !I1 && !I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b1;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(!I0 && I1 && !I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b1;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(I0 && I1 && !I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b1;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(!I0 && !I1 && I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b1;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(I0 && !I1 && I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b1;
          Y6 = 1'b0;
          Y7 = 1'b0;
        end
      else if(!I0 && I1 && I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b1;
          Y7 = 1'b0;
        end
      else if(I0 && I1 && I2)
        begin
          Y0 = 1'b0;
          Y1 = 1'b0;
          Y2 = 1'b0;
          Y3 = 1'b0;
          Y4 = 1'b0;
          Y5 = 1'b0;
          Y6 = 1'b0;
          Y7 = 1'b1;
        end
      else
        $display("INVALID INPUT");*/
      
      //CASE STATEMENT
      
      case({I2,I1,I0})
        3'b000 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b1 ; end
        3'b001 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b1 ; Y0 = 1'b0 ; end
        3'b010 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b1 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        3'b011 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b1 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        3'b100 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b1 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        3'b101 : begin Y7 = 1'b0 ; Y6 = 1'b0 ; Y5 = 1'b1 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        3'b110 : begin Y7 = 1'b0 ; Y6 = 1'b1 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        3'b111 : begin Y7 = 1'b1 ; Y6 = 1'b0 ; Y5 = 1'b0 ; Y4 = 1'b0 ; Y3 = 1'b0 ; Y2 = 1'b0 ; Y1 = 1'b0 ; Y0 = 1'b0 ; end
        default : $display("INVALID INPUT");
      endcase
    end
endmodule
