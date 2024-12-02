module mux_2x1_tb;
  reg I0,I1;
  reg S;
  wire Y;
  
  integer i;
  
  mux_2x1 DUT (.I0(I0),
               .I1(I1),
               .S(S),
               .Y(Y)
              );
  
  
  /*initial
    begin
      for(i = 0 ; i < 8 ; i = i + 1)
        begin
          {S,I0,I1} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0;
      while(i < 8)
        begin
          {S,I0,I1} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  /*initial
    begin
      S = 0 ; I0 = 0 ; I1 = 0 ; #10 ;
      S = 0 ; I0 = 0 ; I1 = 1 ; #10 ;
      S = 0 ; I0 = 1 ; I1 = 0 ; #10 ;
      S = 0 ; I0 = 1 ; I1 = 1 ; #10 ;
      S = 1 ; I0 = 0 ; I1 = 0 ; #10 ;
      S = 1 ; I0 = 0 ; I1 = 1 ; #10 ;
      S = 1 ; I0 = 1 ; I1 = 0 ; #10 ;
      S = 1 ; I0 = 1 ; I1 = 1 ; #10 ;
      $
      finish;
    end*/
  
  initial
    begin
      $display("S    I0     I1     Y");
      $monitor("%0d    %0d      %0d      %0d",S,I0,I1,Y);
    end
  
  initial
    begin
      $dumpfile("2x1_MULTIPLEXER.vcd");
      $dumpvars;
    end
endmodule
