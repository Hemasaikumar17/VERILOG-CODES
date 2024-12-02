module demultiplexer_4x1_tb;
  reg I;
  reg S0,S1;
  wire Y0,Y1,Y2,Y3;
  
  integer i;
  
  demultiplexer_4x1 DUT (.I(I),
                         .S0(S0),
                         .S1(S1),
                         .Y0(Y0),
                         .Y1(Y1),
                         .Y2(Y2),
                         .Y3(Y3)
                        );
  
  /*initial
    begin
      {S0,S1,I} = 3'b000 ; #10 ;
      {S0,S1,I} = 3'b001 ; #10 ;
      {S0,S1,I} = 3'b010 ; #10 ;
      {S0,S1,I} = 3'b011 ; #10 ;
      {S0,S1,I} = 3'b100 ; #10 ;
      {S0,S1,I} = 3'b101 ; #10 ;
      {S0,S1,I} = 3'b110 ; #10 ;
      {S0,S1,I} = 3'b111 ; #10 ;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 8 ; i = i + 1)
        begin
          {S0,S1,I} = i ;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0 ;
      while(i < 8)
        begin
          {S0,S1,I} = i ;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("S0   S1    I    Y0    Y1    Y2    Y3");
      $monitor("%0d    %0d     %0d    %0d     %0d     %0d    %0d",S0,S1,I,Y0,Y1,Y2,Y3);
    end
  
  initial
    begin
      $dumpfile("DEMULTIPLEXER_1X4.vcd");
      $dumpvars;
    end
endmodule
