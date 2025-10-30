module suraj4 (
    input A, B, Cin,     // A and B are operands, Cin is carry-in or borrow-in
    input mode,          // mode = 0 for addition, mode = 1 for subtraction
    output Sum, Cout     // Sum is result, Cout is carry-out or borrow-out
);
    wire B_xor_mode, temp_sum;

    // XOR B with mode: B' when subtracting (mode=1), B when adding (mode=0)
    assign B_xor_mode = B ^ mode;

    // Perform full adder logic
    assign temp_sum = A ^ B_xor_mode ^ Cin;
    assign Cout = (A & B_xor_mode) | (Cin & (A ^ B_xor_mode));
    assign Sum = temp_sum;
endmodule