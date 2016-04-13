using NMfE

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

upper = chol(a)
lower = upper'
y = lower \ b
c = upper \ y

x,ch = cg(a, b;tol=tol,maxiter=2*10);

println("\nSolution Vector: $x")
println("Converged: $(ch.isconverged)")
println("Number of iters: $(ch.mvps)")

@assert round(x, 6) == round(c, 6)