module demux_1x2_tb;
  reg I;
  reg S;
  wire Y0,Y1;
  
  integer i;
  
  demux_1x2 DUT (.I(I),
                 .S(S),
                 .Y0(Y0),
                 .Y1(Y1)
                );
 
  /*initial
    begin
      S = 1'b0 ; I = 1'b0 ; #10 ;
      S = 1'b0 ; I = 1'b1 ; #10 ;
      S = 1'b1 ; I = 1'b0 ; #10 ;
      S = 1'b1 ; I = 1'b1 ; #10 ;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 4 ; i = i + 1)
        begin
          {S,I} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0;
      while(i < 4)
        begin
          {S,I} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("S   I   Y0   Y1");
      $monitor("%0d   %0d   %0d    %0d",S,I,Y0,Y1);
    end
  
  initial
    begin
      $dumpfile("DEMUX_1X2.vcd");
      $dumpvars;
    end
endmodule
