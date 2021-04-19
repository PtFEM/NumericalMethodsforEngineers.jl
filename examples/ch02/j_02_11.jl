using NumericalMethodsforEngineers, IterativeSolvers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

upper = cholesky(a).U
lower = upper'
lower |> display
y = lower \ b
c = upper \ y

tol = 1.0e-10
maxiters = 5
x = [(i=i, cg=cg(a, b; maxiter=i)) for i in 1:maxiters]
x|> display

println("\nSolution Vector:")
x[3].cg |> display
println()

@test round.(x[3].cg; digits=6) == round.(c; digits=6)
