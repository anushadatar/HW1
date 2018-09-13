// Anusha Datar
module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)
  output nAornB,
  output AorB,
  output AandB,
  output nAorB,
  output nAandB
);

  wire nA;
  wire nB;
  wire nAornB;
  wire AorB;
  wire AandB;
  wire nAorB;
  wire nAandB;

  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  or or1(AorB, A, B);
  and and1(AandB, A, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB
  or or2(nAornB, nA, nB); // OR gate produces nAornB from nA and nB
  not andinv(nAandB, AandB);
  not orinv(nAorB, AorB);

endmodule
