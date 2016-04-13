using NMfE

a = [10. 1. -5;-20. 3. 20.;5. 3. 5.]
b = [1., 2., 6.]

c = a\b
f = lufact(a);
(lower, upper) = lufac(a)
subfor!(lower, b)
subbac!(upper, b)

@assert round(b, 10) == round(c, 10)