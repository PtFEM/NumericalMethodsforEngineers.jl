import Base: full, ==, copy, size, convert
import SparseArrays: sparse

#
# bm:         SymmetricBandedMatrix
# bmat:       Banded matrix (the field in a SymmetricBandedMatrix object)
# m:          Regular matix
# sbm:        Semi-banded matrix, e.g.
#               sbm = [0 0 1; 0 2 3; 4 5 6]
# hbw:        Half bandwidth, hbw = (bw - 1)÷2 (notice the \div symbol)
#

mutable struct SymmetricBandedMatrix{Tv}
    hbw::Int                          # Bandwidth bw = 1 + 2*hbw
    bmat::Matrix{Tv}            # Banded matrix
end

size(bm::SymmetricBandedMatrix) = (size(bm.bmat, 1), size(bm.bmat, 1))

==(bm1::SymmetricBandedMatrix, bm2::SymmetricBandedMatrix) = (bm1.hbw==bm2.hbw && bm1.bmat==bm2.bmat)

function copy(bm::SymmetricBandedMatrix) 
  Tv = eltype(bm.bmat)
  SymmetricBandedMatrix{Tv}(bm.hbw, copy(bm.bmat))
end

# Conversion routine similar to default constructor
function convert(::Type{NumericalMethodsforEngineers.SymmetricBandedMatrix}, hbw::Int, bmat::AbstractMatrix)
  Tv = eltype(a)
  SymmetricBandedMatrix{Tv}(hbw, a)
end

# Conversion routine to turn a symmetric matrix into a SymmetricBandedMatrix
function convert(::Type{NumericalMethodsforEngineers.SymmetricBandedMatrix}, am::AbstractMatrix)
  tosymmetricbandedmatrix(am)
end

function sparse(bm::SymmetricBandedMatrix)
  sparse(full(bm))
end

"""
# Convert symmetric AbstractMatrix to a SymmetricBandedMatrix

### Function
```julia
bm = tosymmetricbandedmatrix{Tv}(hbw::Int, am::AbstractMatrix{Tv})
or
bm = tosymmetricbandedmatrix{Tv}(am::AbstractMatrix{Tv})
```
### Arguments
```julia
* `hbw`             : Half bandwidth. 
* `am`              : Symmetric AbstractMatrix
                      (if no hbw is specified, hbw will be derived from the matrix)
```
"""
function tosymmetricbandedmatrix(am::AbstractMatrix)
  m = copy(am)
  typeof(m) <: SparseMatrixCSC && (m = Matrix(m))
  (!issymmetric(m)) && throw(ArgumentError("Matrix not symmetric"))
  hbw = 0
  n = size(m, 1)
  for i in 1:n, j in 1:n
      abs(m[i, j]) > eps() && abs(i-j) > hbw && (hbw = abs(i-j))
  end
  tosymmetricbandedmatrix(hbw, m)
end

function tosymmetricbandedmatrix(hbw::Int, am::AbstractMatrix)
  m = copy(am)
  typeof(m) <: SparseMatrixCSC && (m = full(m))
  (!issymmetric(m)) && throw(ArgumentError("Matrix not symmetric"))
  Tv = eltype(m)
  n = size(m, 1)
  b = zeros(eltype(m), n, hbw+1)
  for i in 1:n
    b[i, hbw+1] = m[i, i]
    for j in 1:hbw
      i - hbw + j > 1 && (b[i, j] = m[i, i - hbw + j - 1])
    end
  end
  SymmetricBandedMatrix{Tv}(hbw, b)
end

function full(bm::SymmetricBandedMatrix)
  n = size(bm.bmat, 1)
  b = zeros(eltype(bm.bmat), n, n)
  hbw = bm.hbw
  for i in n:-1:1
    b[i, i] = bm.bmat[i, hbw+1]
    for j in hbw:-1:1
      if i-hbw+j-1 >0 && abs(bm.bmat[i, j]) > eps()
        b[i, i-hbw+j-1] = bm.bmat[i, j]
        b[i-hbw+j-1, i] = bm.bmat[i, j]
      end
    end
  end
  b
end