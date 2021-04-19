using IterativeSolvers

A = Float64[
  16 4 8;
  4 5 -4;
  8 -4 22;
]
a = Float64[16; 18; -22]
r = vcat(collect(1:6), collect(10:10:100))
println()

x_j = [(i=i, j=jacobi(A, a; maxiter=i)) for i in r]
A * x_j[11].j |> display
println()

x_gs = [(i=i, gs=gauss_seidel(A, a; maxiter=i)) for i in r]
A * x_gs[11].gs |> display
println()

ω = 1.0
x_sor = [(i=i, sor=sor(A, a, ω; maxiter=i)) for i in r]
A * x_sor[11].sor |> display
println()

x_ssor = [(i=i, ssor=ssor(A, a, ω; maxiter=i)) for i in r]
x_ssor |> display
println()
A * x_ssor[11].ssor |> display
println()
