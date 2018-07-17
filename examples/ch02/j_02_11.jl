using NumericalMethodsforEngineers, IterativeSolvers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

upper = chol(a)
lower = upper'
y = lower \ b
c = upper \ y

tol = 1.0e-10
iters = 20
x,ch = cg(a, b;tol=tol,maxiter=iters);

println("\nSolution Vector: $x")
println("Converged: $(ch.isconverged)")
println("Number of iters: $(ch.mvps)")

@assert round(x, 6) == round(c, 6)