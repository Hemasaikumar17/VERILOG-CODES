module encoder_8x3_tb;
  reg I7,I6,I5,I4,I3,I2,I1,I0;
  wire Y2,Y1,Y0;
  
  integer i;
  
  encoder_8x3 DUT (.I7(I7),
                   .I6(I6),
                   .I5(I5),
                   .I4(I4),
                   .I3(I3),
                   .I2(I2),
                   .I1(I1),
                   .I0(I0),
                   .Y2(Y2),
                   .Y1(Y1),
                   .Y0(Y0)
                  );
  
  initial
    begin
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00000001 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00000010 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00000100 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00001000 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00010000 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b00100000 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b01000000 ; #10 ;
      {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b10000000 ; #10 ;
      $finish;
    end
  
  initial
    begin
      $display("I7   I6   I5   I4   I3   I2   I1   I0   Y2   Y1   Y0");
      $monitor("%0d    %0d    %0d    %0d    %0d    %0d    %0d    %0d    %0d    %0d    %0d",I7,I6,I5,I4,I3,I2,I1,I0,Y2,Y1,Y0);
    end
endmodule
