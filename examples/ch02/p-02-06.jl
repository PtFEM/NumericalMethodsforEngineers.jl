using NumericalMethodsforEngineers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [16., 18., -22.]

a = sparse(a)

f = cholesky(a)
f |> display

y = f.L \ b
c = f.U \ y
println("Solution Vector: \n $c")

@test c == a \ b
