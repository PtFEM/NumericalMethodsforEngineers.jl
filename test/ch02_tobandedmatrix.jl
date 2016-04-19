using NMfE

a = Float64[0 0 16; 0 4 5; 8 -4 22]
b = Float64[0 0 0 16; 0 0 4 2; 0 8 -4 22; 13 5 9 1]
c = Float64[0 0 0 0 1; 0 0 0 2 3; 0 0 4 5 6; 0 7 8 9 10; 11 12 13 14 15]

res = tobandedmatrix(frombandedmatrix(a))
@assert res == a

res = tobandedmatrix(frombandedmatrix(b))
@assert res == b

res = tobandedmatrix(frombandedmatrix(c))
@assert res == c
