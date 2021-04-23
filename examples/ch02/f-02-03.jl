using NumericalMethodsforEngineers, Test

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]
n = size(a, 1)
d = zeros(n)

c = a \ b
c |> display

ldlt!(a, d)
lower = zeros(3, 3)
for i in 1:n
  for j in 1:i
    lower[i, j] = a[i, j] / d[j]
  end
end

println("\nLower Triangular Factors:")
lower |> display
println("\nDiagonal Terms: \n $d")

at = deepcopy(a)
bt = deepcopy(b)
ldlfor!(at, bt)
println(at)
for i in 1:n
  at[i, :] = at[i, :] / d[i]
end

println("\nScaled ldlfor! results:")
at |> display
println()
bt |> display

subbac!(at, bt)
println("\nSolution Vector:")
bt |> display

println("\nsubbac! results:")
at |> display
println()
bt |> display

@test bt == c
