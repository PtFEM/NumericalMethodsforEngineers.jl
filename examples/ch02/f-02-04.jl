using NumericalMethodsforEngineers

a = Float64[0 0 16; 0 4 5; 8 -4 22]
b = Float64[4, 2, 5]

println("\nCholesky factorization using banded storage\n")
println("\nBanded Coefficient Matrix:\n$a\n")
println("\nRight Hand side:\n$b\n")

cholin!(a)
println("\nL in Band Form:\n$a\n")

chobac!(a, b)
println("\nSolution Vector:\n$b")

a = Float64[0 0 16; 0 4 5; 8 -4 22]
b = Float64[4, 2, 5]

c = a \ b

@test round.(a * c; digits=14) == b
