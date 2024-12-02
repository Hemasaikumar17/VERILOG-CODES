module encoder_tb;
  reg I3,I2,I1,I0;
  wire Y1,Y0;
  
  encoder DUT (.I3(I3),
               .I2(I2),
               .I1(I1),
               .I0(I0),
               .Y1(Y1),
               .Y0(Y0)
              );
  
  initial
    begin
      {I3,I2,I1,I0} = 4'b0001 ; #10 ;
      {I3,I2,I1,I0} = 4'b0010 ; #10 ;
      {I3,I2,I1,I0} = 4'b0100 ; #10 ;
      {I3,I2,I1,I0} = 4'b1000 ; #10 ;
      $finish;
    end
  
  initial
    begin
      $display("I3  I2   I1  I0  Y1  Y0");
      $monitor("%0d   %0d    %0d   %0d   %0d   %0d",I3,I2,I1,I0,Y1,Y0);
    end
endmodule
