module half_adder_tb;
  reg A,B;
  wire SUM,CARRY;
  integer i;
  
  half_adder DUT (.A(A),
                  .B(B),
                  .SUM(SUM),
                  .CARRY(CARRY)
                 );
  
  /*initial
    begin
      A = 1'b0 ; B = 1'b0 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b1 ; #10 ;
      $finish;
    end*/
  
  /*initial
    begin
      for(i = 0 ; i < 4 ; i = i + 1)
        begin
          {A,B} = i;
          #10;
        end
    end*/
  
  initial
    begin
      i = 0;
      while(i < 4)
        begin
          {A,B} = i ;
          i = i + 1;
          #10;
        end
      $finish;
    end
  
  initial
    begin
      $display("A     B    SUM     CARRY");
      $monitor("%0d     %0d     %0d       %0d",A,B,SUM,CARRY);
    end
  
  initial
    begin
      $dumpfile("HALF_ADDER.vcd");
      $dumpvars;
    end
endmodule
