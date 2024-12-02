module half_subtractor_tb;
  reg A,B;
  wire DIFF,BORR;
  
  integer i;
  
  half_subtractor DUT (.A(A),
                       .B(B),
                       .DIFF(DIFF),
                       .BORR(BORR)
                      );
  
  /*initial
    begin
      A = 1'b0 ; B = 1'b0 ; #10;
      A = 1'b0 ; B = 1'b1 ; #10;
      A = 1'b1 ; B = 1'b0 ; #10;
      A = 1'b1 ; B = 1'b1 ; #10;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 4 ; i = i + 1)
        begin
          {A,B} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0;
      while(i < 4)
        begin
          {A,B} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("A    B    DIFF    BORR");
      $monitor("%0d    %0d     %0d       %0d",A,B,DIFF,BORR);
    end
  
  initial
    begin
      $dumpfile("HALF_SUBTRACTOR.vcd");
      $dumpvars;
    end
endmodule
