using NMfE

ab = SymmetricBandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22])
bb = SymmetricBandedMatrix(3, Float64[0 0 0 16; 0 0 4 2; 0 8 -4 22; 13 5 9 1])
cb = SymmetricBandedMatrix(4, Float64[0 0 0 0 1; 0 0 0 2 3; 0 0 4 5 6; 0 7 8 9 10; 11 12 13 14 15])
db = SymmetricBandedMatrix(2, Float64[0 0 16; 0 4 5; 8 -4 22; 1 2 3; 0 7 6 ; 11 0 15])
eb = SymmetricBandedMatrix(3, Float32[0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebi = SymmetricBandedMatrix(3, [0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])
ebf = SymmetricBandedMatrix(3, [0 0 0 16+0.1im; 0 0 4 5; 0 8 -4+9im 22; 1 2 3 4; 0 0 7 6 ; 0 11 0 15; 0 0 0 20])
ebif = SymmetricBandedMatrix(3, [0 0 0 16; 0 0 4+im 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])
ebif32 = SymmetricBandedMatrix(3, Complex{Float32}[0 0 0 16; 0 0 4+im 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20])

a = full(ab)
res = tosymmetricbandedmatrix(2, a)
@assert res == ab

b = full(bb)
res = tosymmetricbandedmatrix(3, b,)
@assert res == bb

c = full(cb)
res = tosymmetricbandedmatrix(4, c)
@assert res == cb

d = full(db)
res = tosymmetricbandedmatrix(2, d)
@assert res == db

e = full(eb)
res = tosymmetricbandedmatrix(3, e)
@assert res == eb
res2 = tosymmetricbandedmatrix(e)
@assert res2 == res

ei = full(ebi)
res = tosymmetricbandedmatrix(3, ei)
@assert res == ebi
res2 = tosymmetricbandedmatrix(ei)
@assert res2 == res

ef = full(ebf)
res = tosymmetricbandedmatrix(3, ef)
@assert res == ebf

eif = full(ebif)
res = tosymmetricbandedmatrix(3, eif)
@assert res == ebif

eif32 = full(ebif32)
res = tosymmetricbandedmatrix(3, eif32)
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
bm = tosymmetricbandedmatrix(ffs)
@assert full(bm) == ffs

ms = sprand(5, 5, 0.1)
# Make sure it is symmetric
sms = issym(ms) ? ms : ms .+ ms'
bms = issym(sms) ? convert(SymmetricBandedMatrix, sms) : convert(SymmetricBandedMatrix, round(sms, 8))
@assert full(bms) == sms

