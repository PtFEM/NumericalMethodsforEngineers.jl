using NumericalMethodsforEngineers, Test

sv = [16., 4., 5., 8., -4., 22.]
kdiag = [1, 3, 6]

amat = fromskyline(kdiag, sv)
amat |> display
println()

println("\n'Julia' version:\n")
a = amat
b = [4., 2., 5.]

a[2, 2] += 1.0e20
b[2] = a[2, 2] * 5.0

a = sparse(a)

f = cholesky(a)
y = f.L \ b
c = f.U \ y

println("Solution Vector: \n $c")

@test c == a \ b

#------------------------------------

println("\n'Fortran' version:\n")
b = [4., 2., 5.]

nfix = 1
no = [2;]
val = [5.0;]
penalty = 1.0e20

sv[kdiag[no]] .+= penalty
b[no] = sv[kdiag[no]] .* val

sparin!(sv, kdiag)
spabac!(sv, b, kdiag)
println("Solution Vector: \n $b")

sv = [16., 4., 5., 8., -4., 22.]
b = [4., 2., 5.]
sv[kdiag[no]] .+= penalty
b[no] = sv[kdiag[no]] .* val

svt = sparin(sv, kdiag)
bt = spabac(svt, b, kdiag)
println("Solution Vector 2: \n $bt")
