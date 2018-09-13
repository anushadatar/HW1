// Anusha Datar
`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test.
  reg A, B;                // Primary test inputs.
  wire nA, nB, nAandnB, AorB, nAornB, AandB, nAorB, nAandB;    // Test outputs.
  demorgan dut(A, B, nA, nB, nAandnB, nAornB, AorB, AandB, nAorB, nAandB);  // Module to be tested.

  // Run sequence of test stimuli.
  initial begin
    $display("Anusha Datar"); // Name for results file so I can just pipe the console output to the .txt.
    $display("DeMorgan's Law states that Not A and Not B is equal to Not (A or B), so the following two truth tables should be equivalent."); // Top-Level Header for first set of tests.
    // All tested frameworks follow same general setup as commented below.
    $display("Not A and Not B");
    $display("A B | ~A ~B | ~A~B ");            // Prints header for truth table.
    A=0;B=0; #1                                 // Set A and B, wait for update (.#1).
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                 // Set A and B, wait for new update.
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    
    $display("Not (A or B)");
    $display("A B | A + B | ~(A+B)");
    A=0;B=0; #1           
    $display("%b %b |   %b   |    %b  ", A,B, AorB, nAorB);
    A=0;B=1; #1
    $display("%b %b |   %b   |    %b  ", A,B, AorB, nAorB);
    A=1;B=0; #1
    $display("%b %b |   %b   |    %b  ", A,B, AorB, nAorB);
    A=1;B=1; #1
    $display("%b %b |   %b   |    %b  ", A,B, AorB, nAorB);

    // Header for second set of laws to be tested.
    $display("DeMorgan's Law also states that Not A or Not B is equal to Not (A and B), so the following truth tables should be equivalent as well.");
    $display("Not A or Not B");
	$display("A B | ~A ~B | ~A+~B");
    A=0;B=0; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=0;B=1; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);

    $display("Not (A and B)");
    $display("A B | A*B | ~(AB)");
    A=0;B=0; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=0;B=1; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=0; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=1; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    
  end
endmodule    // End demorgan_test.
