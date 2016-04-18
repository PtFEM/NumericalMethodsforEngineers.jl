using NMfE

a = [2. -3. 1.; 1. -1. -2.; 3. 1. -1.]
b = [7., -2., 0.]

(lower, upper) = lufac(a)
println("NMfE lufac(a) - lower:")
println(lower)
println()
println("NMfE lufac(a) - upper:")
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

@show round(c, 14)
@show round(a * c, 14) == b
println()

println("Julia lufact(a):")
f = lufact(a);
println(f[:L])
println()
println(f[:U])
println()

