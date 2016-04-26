using NMfE

af = Float64[16, 4, 5, 8, -4, 22]
ai = [16, 4, 5, 8, -4, 22]
ac = [16+2im, 4-2im, 5+0im, 8, -4-4im, 22+9im]
acf = [16.+2im, 4-2.im, 5+0.im, 8., -4-4im, 22.+9im]

kdiag =[1, 3, 6]

sres=SkylineMatrix(af, kdiag)

@assert full(sres) == [
  16.0   4.0   8.0;
   4.0   5.0  -4.0;
   8.0  -4.0  22.0
]

@assert full(sres) == fromSkyline(af, kdiag)

sres=SkylineMatrix(ai, kdiag)
@assert full(sres) == fromSkyline(ai, kdiag)

sres=SkylineMatrix(ac, kdiag)
@assert full(sres) == fromSkyline(ac, kdiag)

sres=SkylineMatrix(acf, kdiag)
@assert full(sres) == fromSkyline(acf, kdiag)

sres2 = copy(sres)
@assert sres == sres2
@assert sres !== sres2

sres2.nzval[4] = 8.1
@assert sres != sres2
@assert sres !== sres2

sres3 = sres2
@assert sres3 == sres2
@assert sres3 === sres2
