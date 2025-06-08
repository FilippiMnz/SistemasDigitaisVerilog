module somador_dataflow(
    output Cout,
    output S,
    input A,
    input B,
    input Cin
);

assign S = A^B^Cin;
assign Cout = Cin&(A^B) | (B&A);

endmodule
