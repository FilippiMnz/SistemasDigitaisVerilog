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


module somador4bits(
    output [4:0] S,
    input [3:0] A,
    input [3:0] B
);
    wire [2:0] w;

    somador_dataflow s0(
        .Cout(w[0]),
        .S(S[0]),
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0)
    );

    somador_dataflow s1(
        .Cout(w[1]),
        .S(S[1]),
        .A(A[1]),
        .B(B[1]),
        .Cin(w[0])
    );

    somador_dataflow s2(
        .Cout(w[2]),
        .S(S[2]),
        .A(A[2]),
        .B(B[2]),
        .Cin(w[1])
    );

    somador_dataflow s3(
        .Cout(S[4]),
        .S(S[3]),
        .A(A[3]),
        .B(B[3]),
        .Cin(w[2])
    );

    
endmodule

