using NumericalMethodsforEngineers, IterativeSolvers

a = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]

c = a \ b

# p_2_13 Fortran version

x0 = [1., 1., 1.]
tol = 1.0e-5
limit = 1000

# bicgstab defined in src/ch02/bicgstab.jl
iters, converged, x = bicgstab(a, b, x0; tol=tol, limit=limit, trace=true)
println("\nSolution Vector: $x")
println("Converged: $(iters < limit)")
println("Number of iters: $(iters)")

@test round(x, 9) == round(c, 9)
