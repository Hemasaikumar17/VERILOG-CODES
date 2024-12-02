module full_adder_tb;
  reg A,B,Cin;
  reg SUM,CARRY;
  
  integer i;
  
  full_adder DUT (.A(A),
                  .B(B),
                  .Cin(Cin),
                  .SUM(SUM),
                  .CARRY(CARRY)
                 );
  
  /*initial
    begin
      A = 1'b0 ; B = 1'b0 ; Cin = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b0 ; Cin = 1'b1 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; Cin = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; Cin = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; Cin = 1'b0 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; Cin = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b1 ; Cin = 1'b0 ; #10 ;
      A = 1'b1 ; B = 1'b1 ; Cin = 1'b1 ; #10 ;
      $finish;
    end*/
  /*initial
    begin
      for(i = 0 ; i < 8 ; i = i + 1)
        begin
          {A,B,Cin} = i;
          #10;
        end
      $finish;
    end*/
  
  initial
    begin
      i = 0;
      while (i < 8)
        begin
          {A,B,Cin} = i;
          #10;
          i = i + 1;
        end
      $finish;
    end
  
  initial
    begin
      $display("A    B   CIN    SUM    CARRY");
      $monitor("%0d    %0d    %0d      %0d      %0d",A,B,Cin,SUM,CARRY);
    end
  
  initial
    begin
      $dumpfile("FULL_ADDER.vcd");
      $dumpvars;
    end
endmodule
