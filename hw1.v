module demorgan
(
  input  A,          // Single bit inputs.
  input  B,
  output nA,         // Output intermediate complemented inputs.
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B).
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

  // Inverts both elements.
  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA.
  not Binv(nB, B);
  // Standard and/or gates for inputs.
  or orAB(AorB, A, B);
  and andAB(AandB, A, B);
  // Both inverted gates.
  and andnAnB(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB.
  or ornAnB(nAornB, nA, nB); // OR gate produces nAornB from nA and nB.
  // Inversions of standard gates.
  not andABinv(nAandB, AandB);
  not orABinv(nAorB, AorB);

endmodule
