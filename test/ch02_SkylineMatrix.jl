using NMfE

af = Float64[16, 4, 5, 8, -4, 22]
ai = [16, 4, 5, 8, -4, 22]

kdiag =[1, 3, 6]

sres=SkylineMatrix(af, kdiag)

@assert full(sres) == [
  16.0   4.0   8.0;
   4.0   5.0  -4.0;
   8.0  -4.0  22.0
]

@assert full(sres) == fromSkyline(af, kdiag)