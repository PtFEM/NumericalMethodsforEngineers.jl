using NumericalMethodsforEngineers, Test

a = [1. 2. -2.; 2. 5. -4.; -2. -4. 5.]

println("\n|a[1, 1]| = $(det(a[1, 1]))\n")
println("|a[1:2, 1:2]| = $(det(a[1:2, 1:2])))\n")
println("|a| = $(det(a))")
println("\ncholesky(a):")
cholesky(a) |> display

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]

println("\n|a[1, 1]| = $(det(a[1, 1]))\n")
println("|a[1:2, 1:2]| = $(det(a[1:2, 1:2])))\n")
println("|a| = $(det(a))")

println("\ncholesky(a) - upper:")
upper = cholesky(a).U
upper |> display

println("\ncholesky(a) - lower:")
lower = cholesky(a).L
lower |> display

println("\nlower * upper:")
lower * upper |> display

@test a == lower * upper