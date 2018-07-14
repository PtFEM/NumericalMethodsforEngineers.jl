using NMfE
using Test

a = [10. 1. -5;-20. 3. 20.;5. 3. 5.]
b = [1., 2., 6.]

c = a\b
f = lu(a);
(lower, upper) = lufac(a)
subfor!(lower, b)
subbac!(upper, b)

@test round.(b, digits=10) == round.(c, digits=10)