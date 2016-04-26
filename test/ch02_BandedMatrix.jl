using NMfE

ab = BandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22])
bb = BandedMatrix(3, Float64[0 0 0 16; 0 0 4 2; 0 8 -4 22; 13 5 9 1])
cb = BandedMatrix(4, Float64[0 0 0 0 1; 0 0 0 2 3; 0 0 4 5 6; 0 7 8 9 10; 11 12 13 14 15])
db = BandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22; 1 2 3; 0 7 6 ; 11 0 15])
eb = BandedMatrix(3, Float64[0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebi = BandedMatrix(3, [0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])
ebf = BandedMatrix(3, [0 0 0 16+0.1im; 0 0 4 5; 0 8 -4+9im 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebif = BandedMatrix(3, [0 0 0 16; 0 0 4+im 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])

a = full(ab)
res = BandedMatrix(a, 2)
@assert res == ab

b = full(bb)
res = BandedMatrix(b, 3)
@assert res == bb

c = full(cb)
res = BandedMatrix(c, 4)
@assert res == cb

d = full(db)
res = BandedMatrix(d, 2)
@assert res == db

e = full(eb)
res = BandedMatrix(e, 3)
@assert res == eb

ei = full(ebi)
res = BandedMatrix(ei, 3)
@assert res == ebi

ef = full(ebf)
res = BandedMatrix(ef, 3)
@assert res == ebf

eif = full(ebif)
bres = BandedMatrix(eif, 3)
@assert bres == ebif

bres2 = copy(bres)
@assert bres == bres2
@assert bres !== bres2

bres2.mat[4, 3] = 8.0+9im
@assert bres != bres2
@assert bres !== bres2

bres3 = bres2
@assert bres3 == bres2
@assert bres3 === bres2
