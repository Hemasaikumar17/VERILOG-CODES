module comparator_tb;
  reg A,B;
  wire X,Y,Z;
  
  integer i;
  
  comparator DUT (.A(A),
                  .B(B),
                  .X(X),
                  .Y(Y),
                  .Z(Z)
                 );
  
  /*initial
    begin
      A = 1'b0 ; B = 1'b0 ; #10 ;
      A = 1'b0 ; B = 1'b1 ; #10 ;
      A = 1'b1 ; B = 1'b0 ; #10 ;
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
      $finish;
    end*/
  
  initial
    begin
      i = 0 ;
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
      $display("A    B    X    Y    Z");
      $monitor("%0d    %0d    %0d    %0d    %0d",A,B,X,Y,Z);
    end
endmodule
