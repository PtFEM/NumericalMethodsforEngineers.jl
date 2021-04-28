using NumericalMethodsforEngineers, Test

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]
n = size(a, 1)
d = zeros(n)

c = a \ b
c |> display
println()

at, dt = ldlt(a, d)

bt = ldlfor(at, b)
bt |> display
println()

for i in 1:n
  at[i, :] = at[i, :] / dt[i]
end

bt = subbac(at, bt)
bt |> display
println()

@test bt == c
