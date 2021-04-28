using NumericalMethodsforEngineers, Test

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]

det(a[1,1])
det(a[1:2,1:2])
det(a)

isposdef(a) |> display
println()

cholesky(a) |> display

c = a \ b
c |> display

println("\nCholesky factorization using banded storage\n")
println("Banded Coefficient Matrix:")
a |> display

println("\nRight Hand side:")
b |> display

cholin!(a)
println("\nL in Band Form:")
a |> display

chobac!(a, b)
println("\nSolution Vector:")
b |> display

