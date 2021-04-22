using NumericalMethodsforEngineers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

a = sparse(a)

F = cholesky(a)
upper = F.U
upper |> display

lower = F.L
lower |> display

y = lower \ b

c = upper \ y
println("Solution Vector: \n $c")

@test c == a \ b

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

a[2, 2] += 1.0e20
b[2] = a[2, 2] * 5.0

a = sparse(a)

F = cholesky(a)
upper = F.U
upper |> display

lower = F.L
lower |> display

y = lower \ b

c = upper \ y
println("Solution Vector: \n $c")

@test c == a \ b