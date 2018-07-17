using NumericalMethodsforEngineers

b = [16. -24. 18.; 3. -2. 0.; -9. 18. -17.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(b, x0; tol=tol, limit=100)
eb = eig(b)

@assert round.(eigvec[:,1], 5) == round.(eb[2][:,1], 5)
