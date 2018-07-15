using NMfE

a = [16.; 4.; 5.; 8.; -4.; 22.]
kdiag = [1; 3; 6]

amat = fromskyline(kdiag, a)

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
#------------------------------------

a = amat
b = [4., 2., 5.]

a[2, 2] += 1.0e20
b[2] = a[2, 2] * 5.0

a = sparse(a)

F = cholesky(a)
y = F.L \ b
c = F.U \ y

@assert round.(c, digits=4) == round.(a \ b, digits=4)
@assert round.(c, digits=4) == round.(d, digits=4)