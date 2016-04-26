import Base: full, ==, copy, size, convert

type BandedMatrix{Tv}
    hbw::Int                    # Bandwidth bw = 1 + 2*hbw
    mat::Matrix{Tv}             # Banded matrix
end

size(a::BandedMatrix) = (size(a.mat, 1), size(a.mat, 1))

==(a::BandedMatrix, b::BandedMatrix) = (a.hbw==b.hbw && a.mat==b.mat)

function copy(a::BandedMatrix) 
  Tv = eltype(a.mat)
  BandedMatrix{Tv}(a.hbw, copy(a.mat))
end

function convert(::Type{NMfE.BandedMatrix}, hbw::Int, a::Matrix)
  Tv = eltype(a)
  BandedMatrix{Tv}(hbw, a)
end

function BandedMatrix(mat::Matrix, hbw::Int)
  # hbw = (bw - 1)÷2
  Tv = eltype(mat)
  n = m = size(mat, 1)
  b = zeros(eltype(mat), n, hbw+1)
  for i in 1:n
    b[i, hbw+1] = mat[i, i]
    for j in 1:hbw
      if i - hbw + j > 1
        b[i, j] = mat[i, i - hbw + j - 1]
      end
    end
  end
  BandedMatrix{Tv}(hbw, b)
end

function full(bmat::BandedMatrix)
  n = size(bmat.mat, 1)
  b = zeros(eltype(bmat.mat), n, n)
  hbw = bmat.hbw
  for i in n:-1:1
    b[i, i] = bmat.mat[i, hbw+1]
    for j in hbw:-1:1
      if i-hbw+j-1 >0 && abs(bmat.mat[i, j]) > eps()
        b[i, i-hbw+j-1] = bmat.mat[i, j]
        b[i-hbw+j-1, i] = bmat.mat[i, j]
      end
    end
  end
  b
end
