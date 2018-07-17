using NumericalMethodsforEngineers
using Test

af = Float64[16, 4, 5, 8, -4, 22]
ai = [16, 4, 5, 8, -4, 22]
ac = [16+2im, 4-2im, 5+0im, 8, -4-4im, 22+9im]
acf = [16.0+2im, 4-2.0im, 5+0.0im, 8.0, -4-4im, 22.0+9im]

kdiag =[1, 3, 6]

sres=SkylineMatrix(kdiag, af)

@test full(sres) == [
  16.0   4.0   8.0;
   4.0   5.0  -4.0;
   8.0  -4.0  22.0
]

@test full(sres) == fromskyline(kdiag, af)

sres=SkylineMatrix(kdiag, ai)
@test full(sres) == fromskyline(kdiag, ai)

sres=SkylineMatrix(kdiag, ac)
@test full(sres) == fromskyline(kdiag, ac)

sres=SkylineMatrix(kdiag, acf)
@test full(sres) == fromskyline(kdiag, acf)
