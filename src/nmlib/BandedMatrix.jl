type BandedMatrix{Tv}
    m::Int                      # Number of rows
    n::Int                      # Number of columns
    bw::Int                     # Bandwidth bw = 1 + 2*hbw
    mat::Matrix{Tv}             # Banded matrix
end

function BandedMatrix(mat::Matrix, bw::Int)
  n = m = size(mat, 1)
  iw = bw - 1
  mat = tobandedmatrix(mat, iw)
  BandedMatrix{eltype(mat)}(m, n, iw, mat)
end

function frombandedmatrix(a::Matrix)
  n = size(a, 1)
  b = zeros(eltype(a), n, n)
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

function tobandedmatrix(a::Matrix, iw::Int64)
  n = size(a, 1)
  b = zeros(eltype(a), n, iw+1)
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

eb = Float64[0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20]
ebi = [0 0 0 16; 0 0 4 5; 0 8 -4 22; 1 2 3 4; 0 0 7 6; 0 11 0 15; 0 0 0 20]

e = frombandedmatrix(eb)
ei = frombandedmatrix(ebi)

ebb = tobandedmatrix(e, 3) |> display
println()

ebbi = tobandedmatrix(ei, 3) |> display
println()

BandedMatrix(e, 4) |> display
println()

BandedMatrix(ei, 4) |> display

