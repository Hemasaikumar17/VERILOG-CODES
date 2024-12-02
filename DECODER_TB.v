module decoder_tb;
  reg I2,I1,I0;
  wire Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0;
  
  integer i;
  
  decoder DUT (.I2(I2),
               .I1(I1),
               .I0(I0),
               .Y7(Y7),
               .Y6(Y6),
               .Y5(Y5),
               .Y4(Y4),
               .Y3(Y3),
               .Y2(Y2),
               .Y1(Y1),
               .Y0(Y0)
              );
  
  /*initial
    begin
      {I2,I1,I0} = 3'b000 ; #10 ;
      {I2,I1,I0} = 3'b001 ; #10 ;
      {I2,I1,I0} = 3'b010 ; #10 ;
      {I2,I1,I0} = 3'b011 ; #10 ;
      {I2,I1,I0} = 3'b100 ; #10 ;
      {I2,I1,I0} = 3'b101 ; #10 ;
      {I2,I1,I0} = 3'b110 ; #10 ;
      {I2,I1,I0} = 3'b111 ; #10 ;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 8 ; i = i + 1)
        begin
          {I2,I1,I0} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0 ;
      while(i < 8)
        begin
          {I2,I1,I0} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("I2    I1    I0     Y7    Y6    Y5    Y4    Y3    Y2    Y1    Y0");
      $monitor("%0d     %0d     %0d      %0d     %0d     %0d     %0d     %0d     %0d     %0d     %0d",I2,I1,I0,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
    end
  
  initial
    begin
      $dumpfile("DECODER.vcd");
      $dumpvars;
    end
endmodule
