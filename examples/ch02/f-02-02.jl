using NumericalMethodsforEngineers, Test

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

c1 = subfor(lower, b)
c2 = subbac(upper, c1)

subfor!(lower, b)
println("Updated RHS:")
println(b)
println()

@test ≈(c1,  b, atol=1e-10)
println()

c3 = subbac(upper, c1)

subbac!(upper, b)
println("Solution vector:")
println(b)
println()

c = a \ [7., -2., 0.]
c |> display
@test ≈(c2, c, atol=1e-10)
@test ≈(c3, c, atol=1e-10)

@test ≈(a * c, [7., -2., 0.], atol=1e-10)
println()

println("Julia lu(a):")
f = lu(a);
f |> display
println()
f.U |> display
