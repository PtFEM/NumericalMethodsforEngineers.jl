using NMfE

af = Float64[16, 4, 5, 8, -4, 22]
ai = [16, 4, 5, 8, -4, 22]
ac = [16+2im, 4-2im, 5+0im, 8, -4-4im, 22+9im]
acf = [16.+2im, 4-2.im, 5+0.im, 8., -4-4im, 22.+9im]

kdiag =[1, 3, 6]

sres=SkylineMatrix(kdiag, af)

@assert full(sres) == [
  16.0   4.0   8.0;
   4.0   5.0  -4.0;
   8.0  -4.0  22.0
]

@assert full(sres) == fromskyline(kdiag, af)

sres=SkylineMatrix(kdiag, ai)
@assert full(sres) == fromskyline(kdiag, ai)

sres=SkylineMatrix(kdiag, ac)
@assert full(sres) == fromskyline(kdiag, ac)

sres=SkylineMatrix(kdiag, acf)
@assert full(sres) == fromskyline(kdiag, acf)
