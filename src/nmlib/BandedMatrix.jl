using NMfE

type BandedMatrix{Tv,Ti<:Integer} <: AbstractSparseMatrix{Tv,Ti}
    m::Int                      # Number of rows
    n::Int                      # Number of columns
    bw::Int                     # Bandwidth bw = 1 + 2*hbw
    mat::Matrix{Tv, 2}        # Banded matrix
    function BandedMatrix(mat::Matrix{Tv}, bw::Integer)
      m = size(mat, 1)
      n = size(mat, 2)
      hbw = (bw-1)÷2
      matb = tobandedmatrix(mat, hbw)
      new(m, n, bw, matb)
    end
end

function frombandedmatrix(a::Matrix{Float64})
  n = size(a, 1)
  b = zeros(n, n)
  iw = size(a, 2)
  for i in n:-1:1
    b[i, i] = a[i, iw]
    for j in iw-1:-1:1
      if abs(a[i, j]) > eps()
        b[i, i-iw+j] = a[i, j]
        b[i-iw+j, i] = a[i, j]
      end
    end
  end
  b
end

function tobandedmatrix(a::Matrix{Float64}, iw::Int64)
  n = size(a, 1)
  b = zeros(n, iw+1)
  for i in 1:n
    b[i, iw+1] = a[i, i]
    for j in 1:iw
      if i - iw + j > 1
        b[i, j] = a[i, i - iw + j - 1]
      end
    end
  end
  b
end

eb = Float64[0 0 0 16; 0 0 4 5; 0 8 -4 22; 0 1 2 3; 0 0 7 6; 0 11 0 15; 0 0 0 20]

e = frombandedmatrix(eb)

es = sparse(e)

g0 = [1, 2, 3, 4, 5]
g1 = [10, 11, 12, 13, 14]
g2 = [0, 20, 21, 22]
d = (0, 1, -1, 2, -2)

#spdiagm(B, d[, m, n])

spdiagm(g0)

spd = spdiagm((g0, g1, g1, g2, g2), d)

full(spd)