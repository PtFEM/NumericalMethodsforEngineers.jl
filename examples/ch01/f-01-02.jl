using NumericalMethodsforEngineers
using Test

b = [16. -24. 18.; 3. -2. 0.; -9. 18. -17.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(b, x0; show=5)

println("\nNo of iters:                    $iters")
println("Largest eigen value:            $eigval")
println("Corresponding eigen vector:     $eigvec")
println()

jeigval, jeigvec = eigen(b);

println("\nEigen values:                   $jeigval")
println("Corresponding eigen vectors:")
jeigvec |> display
println()

@test round(minimum(jeigval), digits=3) == round(eigval, digits=3)