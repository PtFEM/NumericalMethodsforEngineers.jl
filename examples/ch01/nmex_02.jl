using NMfE

b = [16. -24. 18.; 3. -2. 0.; -9. 18. -17.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(b, x0, tol, limit; show=5)

println("No of iters:                   $iters")
println("Largest eigen value:           $eigval")
println("Corresponding eigen vector:    $eigvec")
println()

eig(b)
