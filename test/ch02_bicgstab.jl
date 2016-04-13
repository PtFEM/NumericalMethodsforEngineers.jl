using NMfE

N = 10
a = float(rand(1:10 * N, N, N))
x = float(rand(1:10, N))
b = a * x
x0 = ones(N)

(iters, converged, r2) = NMfE.bicgstab(a, b, x0, limit=100)

@assert round(a \ b, 1) == round(r2, 1)

