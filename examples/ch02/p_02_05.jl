using NumericalMethodsforEngineers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

f = cholesky(a)
f.U |> display

y = f.L \ b
c = f.U \ y

maxiters = 5
x = [(i=i, cg=cg(a, b; maxiter=i)) for i in 1:maxiters]
x |> display

@test round.(x[3].cg; digits=9) == round.(c; digits=9)
