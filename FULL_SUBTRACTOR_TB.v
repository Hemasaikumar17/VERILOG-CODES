module full_subtractor_tb;
  reg A,B,Bin;
  wire DIFF,BORR;
  
  integer i;
  
  full_subtractor DUT (.A(A),
                       .B(B),
                       .Bin(Bin),
                       .DIFF(DIFF),
                       .BORR(BORR)
                      );
  
  /*initial
    begin
      A = 1'b0 ; B = 1'b0 ; Bin = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b0 ; Bin = 1'b1 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; Bin = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; Bin = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; Bin = 1'b0 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; Bin = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b1 ; Bin = 1'b0 ; #10 ;
      A = 1'b1 ; B = 1'b1 ; Bin = 1'b1 ; #10 ;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 8 ; i = i + 1)
        begin
          {A,B,Bin} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0;
      while(i < 8)
        begin
          {A,B,Bin} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
      
  initial
    begin
      $display("A    B    BIN    DIFF    BORR");
      $monitor("%0d    %0d     %0d      %0d      %0d",A,B,Bin,DIFF,BORR);
    end
  
  initial
    begin
      $dumpfile("FULL_SUBTRACTOR.vcd");
      $dumpvars;
    end
endmodule
