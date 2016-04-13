using NMfE

a = [10. 5. 6.; 5. 20. 4.; 6. 4. 30.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(a, x0, tol, limit; show=5)

println("No of iters:                   $iters")
println("Largest eigen value:           $eigval")
println("Corresponding eigen vector:    $eigvec")
println()

eig(a)
