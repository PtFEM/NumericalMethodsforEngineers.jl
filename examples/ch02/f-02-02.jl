using NumericalMethodsforEngineers

a = [2. -3. 1.; 1. -1. -2.; 3. 1. -1.]
b = [7., -2., 0.]

(lower, upper) = lufac(a)
println("NumericalMethodsforEngineers lufac(a) - lower:")
println(lower)
println()
println("NumericalMethodsforEngineers lufac(a) - upper:")
println(upper)
println()
@show lower * upper
println()

subfor!(lower, b)
println("Updated RHS:")
println(b)
println()

subbac!(upper, b)
println("Solution vector:")
println(b)
println()

c = a\b

@show round.(c; digits=14)
@show round.(a * c; digits=14) == b
println()

println("Julia lu(a):")
f = lu(a);
f |> display
println()
f.U |> display
