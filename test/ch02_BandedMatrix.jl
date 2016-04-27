using NMfE

ab = BandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22])
bb = BandedMatrix(3, Float64[0 0 0 16; 0 0 4 2; 0 8 -4 22; 13 5 9 1])
cb = BandedMatrix(4, Float64[0 0 0 0 1; 0 0 0 2 3; 0 0 4 5 6; 0 7 8 9 10; 11 12 13 14 15])
db = BandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22; 1 2 3; 0 7 6 ; 11 0 15])
eb = BandedMatrix(3, Float32[0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebi = BandedMatrix(3, [0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])
ebf = BandedMatrix(3, [0 0 0 16+0.1im; 0 0 4 5; 0 8 -4+9im 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebif = BandedMatrix(3, [0 0 0 16; 0 0 4+im 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])
ebif32 = BandedMatrix(3, Complex{Float32}[0 0 0 16; 0 0 4+im 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])

a = full(ab)
res = tobandedmatrix(2, a)
@assert res == ab

b = full(bb)
res = tobandedmatrix(3, b,)
@assert res == bb

c = full(cb)
res = tobandedmatrix(4, c)
@assert res == cb

d = full(db)
res = tobandedmatrix(2, d)
@assert res == db

e = full(eb)
res = tobandedmatrix(3, e)
@assert res == eb
res2 = tobandedmatrix(e)
@assert res2 == res

ei = full(ebi)
res = tobandedmatrix(3, ei)
@assert res == ebi
res2 = tobandedmatrix(ei)
@assert res2 == res

ef = full(ebf)
res = tobandedmatrix(3, ef)
@assert res == ebf

eif = full(ebif)
res = tobandedmatrix(3, eif)
@assert res == ebif

eif32 = full(ebif32)
res = tobandedmatrix(3, eif32)
@assert res == ebif32

res2 = copy(res)
@assert res == res2
@assert res !== res2

res2.bmat[4, 3] = 8.0+9im
@assert res != res2
@assert res !== res2

res3 = res2
@assert res3 == res2
@assert res3 === res2

f=sprand(6, 6, 0.3)
ff = full(f)
ffs=ff.+ff'
bm = tobandedmatrix(ffs)
@assert full(bm) == ffs


