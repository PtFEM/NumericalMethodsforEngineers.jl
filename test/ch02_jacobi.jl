using IterativeSolvers

A = Float64[
  16 4 8;
  4 5 -4;
  8 -4 22;
]
a = Float64[16; 18; -22]
x = Float64[1; 1; 1]
jacobi!(x, A, a, maxiter=100)

@assert round.(A * x, digits=5) == a

x = Float64[1; 1; 1]
gauss_seidel!(x, A, a, maxiter=100)

@assert round.(A * x, digits=5) == a

x = Float64[1; 1; 1]
ω = 1.0
ssor!(x, A, a, ω, maxiter=100)

@assert round.(A * x, digits=5) == a
