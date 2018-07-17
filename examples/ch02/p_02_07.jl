using NumericalMethodsforEngineers

println("\n'Fortran' version:\n")
a = [16.; 4.; 5.; 8.; -4.; 22.]
kdiag = [1; 3; 6]

amat = fromSkyline(a, kdiag)
amat |> display
println()

b = [4., 2., 5.]

nfix = 1
no = [2;]
val = [5.0;]
penalty = 1.0e20

a[kdiag[no]] .+= penalty
b[no] = a[kdiag[no]] .* val

sparin!(a, kdiag)
spabac!(a, b, kdiag)
d = copy(b)
println("Solution Vector: \n $d")

#------------------------------------

println("\n'Julia' version:\n")
a = amat
b = [4., 2., 5.]

a[2, 2] += 1.0e20
b[2] = a[2, 2] * 5.0

a = sparse(a)

F = cholfact(a)
upper = F[:U]
upper |> display

lower = F[:L]
lower |> display

y = lower \ b

c = upper \ y
println("Solution Vector: \n $c")

@assert c == a \ b
@assert c == d