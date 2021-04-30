using NumericalMethodsforEngineers, Test

a = [0. 0. 16.; 0. 4. 5.; 8. -4. 22.]
b = Float64[4, 2, 5]

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
