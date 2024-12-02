module Multiplexer_4x1_tb;
  reg I0,I1,I2,I3;
  reg S0,S1;
  wire Y;
  
  integer i;
  
  Multiplexer_4x1 DUT (.I0(I0),
                   .I1(I1),
                   .I2(I2),
                   .I3(I3),
                   .S0(S0),
                   .S1(S1),
                   .Y(Y)
                  );
  
  /*initial
    begin
      I0 = 1'b1 ; I1 = 1'b0 ; I2 = 1'b0 ; I3 = 1'b0 ; S0 = 1'b0 ; S1 = 1'b0 ; #10 ;
      I0 = 1'b0 ; I1 = 1'b1 ; I2 = 1'b0 ; I3 = 1'b0 ; S0 = 1'b0 ; S1 = 1'b1 ; #10 ;
      I0 = 1'b0 ; I1 = 1'b0 ; I2 = 1'b1 ; I3 = 1'b0 ; S0 = 1'b1 ; S1 = 1'b0 ; #10 ;
      I0 = 1'b0 ; I1 = 1'b0 ; I2 = 1'b0 ; I3 = 1'b1 ; S0 = 1'b1 ; S1 = 1'b1 ; #10 ;
    end*/
  
  /*initial
    begin
      {I0,I1,I2,I3} = $random;
      for(i = 0 ; i < 4 ; i = i + 1)
        begin
          {S0,S1} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      {I0,I1,I2,I3} = $random;
      i = 0 ;
      while(i < 4)
        begin
          {S0,S1} = i;
          #10 ;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("I0    I1    I2     I3     S0     S1     Y");
      $monitor("%0d     %0d     %0d      %0d      %0d      %0d      %0d",I0,I1,I2,I3,S0,S1,Y);
    end
  
  initial
    begin
      $dumpfile("MULTIPLEXER_4:1.vcd");
      $dumpvars;
    end
endmodule
