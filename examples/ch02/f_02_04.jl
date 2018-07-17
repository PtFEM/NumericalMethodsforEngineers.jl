using NumericalMethodsforEngineers

A = Float64[0 0 16; 0 4 5; 8 -4 22]
b = Float64[4, 2, 5]

println("\nCholesky factorization using banded storage\n")
println("\nBanded Coefficient Matrix:\n$A\n")
println("\nRight Hand side:\n$b\n")

cholin!(A)
println("\nL in Band Form:\n$A\n")

chobac!(A, b)
println("\nSolution Vector:\n$b")

A = Float64[0 0 16; 0 4 5; 8 -4 22]
b = Float64[4, 2, 5]

c = A \ b

@test round(c, 14) == b
