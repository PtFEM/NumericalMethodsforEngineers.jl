### A Pluto.jl notebook ###
# v0.14.2

using NumericalMethodsforEngineers

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]

c = a \ b
println()

lower, d, upper = ldlt(a)
println("\nLower Triangular Factors:")
lower |> display
println("\nDiagonal Terms: \n $d")

at = deepcopy(a)
bt = deepcopy(b)
ldlfor!(at, bt)
for i in 1:n
  at[i, :] = at[i, :] / d[i]
end

at = deepcopy(a)
bt = ldlfor(at, b)
bt |> display
println()

#=

bt = subbac(u, bt)
bt |> display
=#