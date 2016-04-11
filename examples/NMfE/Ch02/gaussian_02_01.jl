using NMfE

a = [10. 1. -5;-20. 3. 20.;5. 3. 5.]
b = [1., 2., 6.]

c = a\b

println(a\b)
println()

@show round(a * c, 14) == b
println()

f = lufact(a)
println(f)
println()
println(f[:L])
println()
println(f[:U])
println()

(lower, upper) = lufac(a)
println("NMfE lufac(a) - lower:")
println(lower)
println()
println("NMfE lufac(a) - upper:")
println(upper)
println()

subfor!(lower, b)
subbac!(upper, b)
println(b)
println()
