using NMfE

A = Float64[3 -2 1;-2 3 2;1 2 2]
b = Float64[3, -3, 2]

L, U = lufac(A)
F = lu(A)

@assert round.(U, digits=5) == [3.0 -2.0 1.0;0.0 1.66667 2.66667;0.0 0.0 -2.6]
