using NumericalMethodsforEngineers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [16., 18., -22.]

a = sparse(a)

F = cholfact(a)
upper = F[:U]
upper |> display

lower = F[:L]
lower |> display

y = lower \ b

c = upper \ y
println("Solution Vector: \n $c")

@assert c == a \ b