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
@test res == ab

b = full(bb)
res = tosymmetricbandedmatrix(3, b,)
@test res == bb

c = full(cb)
res = tosymmetricbandedmatrix(4, c)
@test res == cb

d = full(db)
res = tosymmetricbandedmatrix(2, d)
@test res == db

e = full(eb)
res = tosymmetricbandedmatrix(3, e)
@test res == eb
res2 = tosymmetricbandedmatrix(e)
@test res2 == res

ei = full(ebi)
res = tosymmetricbandedmatrix(3, ei)
@test res == ebi
res2 = tosymmetricbandedmatrix(ei)
@test res2 == res

ef = full(ebf)
res = tosymmetricbandedmatrix(3, ef)
@test res == ebf

eif = full(ebif)
res = tosymmetricbandedmatrix(3, eif)
@test res == ebif

eif32 = full(ebif32)
res = tosymmetricbandedmatrix(3, eif32)
@test res == ebif32

res2 = copy(res)
@test res == res2
@test res !== res2

res2.bmat[4, 3] = 8.0+9im
@test res != res2
@test res !== res2

res3 = res2
@test res3 == res2
@test res3 === res2

f=sprand(6, 6, 0.3)
ff = Matrix(f)
ffs=ff.+ff'
bm = tosymmetricbandedmatrix(ffs)
@test full(bm) == ffs

ms = sprand(5, 5, 0.1)
# Make sure it is symmetric
sms = issymmetric(ms) ? ms : ms .+ ms'
bms = issymmetric(sms) ? convert(SymmetricBandedMatrix, sms) : convert(SymmetricBandedMatrix, round(sms, digits=8))
@test full(bms) == sms

