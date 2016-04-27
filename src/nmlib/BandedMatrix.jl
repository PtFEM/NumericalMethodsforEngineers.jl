import Base: full, ==, copy, size, convert, sparse

#
# bm:         BandedMatrix
# bmat:       Banded matrix (the field in a BandedMatrix object)
# m:          Regular matix
# sbm:        Semi-banded matrix, e.g.
#               sbm = [0 0 1; 0 2 3; 4 5 6]
# hbw:        Half bandwidth, hbw = (bw - 1)÷2 (notice the \div symbol)
#

Docile.@comment """
# BandedMatrix type for symmetric full matrices
"""

"""
Type to hold banded matrices with element types Tv

- bm:         BandedMatrix
- bmat:       Banded matrix (the field in a BandedMatrix object)
- am:         Subtype of AbstractMatrix
- sbm:        Semi-banded matrix
- hbw:        Half bandwidth, hbw = (bw - 1)÷2 (notice the \div symbol)

### Constructor
```julia
bm = BandedMatrix{Tv}(hbw::Int, bmat::Matrix{Tv})

```
### Arguments
```julia
* `hbw`             : Half bandwidth. 
* `bmat`            : Banded matrix, e.g.
                      bmat = [0 0 1; 0 2 3; 4 5 6]
                      (for a hbw of 2 and 1, 3, 6 as diagonal elements).
```
### Additional methods
```julia
* `size(bm)`        : Return size of full matrix => (n, n).
* `==(bm1, bm2)`    : Compare 2 BandedMatrices for equality.
* `copy(bm)`        : Create a copy.
* `sparse(bm)`      : Convert to a SparseMatrixCSC.
* `full(bm)`        : Convert to a full matrix.

* `convert(::Type{NMfE.BandedMatrix}, hbw::Int, bmat::AbstractMatrix)` (Default constructor)
* `convert(::Type{NMfE.BandedMatrix}, am::AbstractMatrix)`

* `tobandedmatrix(am::AbstractMatrix)`           : Convert to BandedMatrix, compute hbw.
* `tobandedmatrix(hbw::Int, am::AbstractMatrix)` : Convert to BandedMatrix.
```
"""
type BandedMatrix{Tv}
    hbw::Int                    # Bandwidth bw = 1 + 2*hbw
    bmat::Matrix{Tv}            # Banded matrix
end

size(bm::BandedMatrix) = (size(bm.bmat, 1), size(bm.bmat, 1))

==(bm1::BandedMatrix, bm2::BandedMatrix) = (bm1.hbw==bm2.hbw && bm1.bmat==bm2.bmat)

function copy(bm::BandedMatrix) 
  Tv = eltype(bm.bmat)
  BandedMatrix{Tv}(bm.hbw, copy(bm.bmat))
end

# Conversion routine similar to default constructor
function convert(::Type{NMfE.BandedMatrix}, hbw::Int, bmat::AbstractMatrix)
  Tv = eltype(a)
  BandedMatrix{Tv}(hbw, a)
end

# Conversion routine to turn a symmetric matrix into a BandedMatrix
function convert(::Type{NMfE.BandedMatrix}, am::AbstractMatrix)
  tobandedmatrix(am)
end

function sparse(bm::BandedMatrix)
  sparse(full(bm))
end

Docile.@comment """
# Convert symmetric AbstractMatrix to a BandedMatrix
"""

"""

### Function
```julia
bm = tobandedmatrix{Tv}(hbw::Int, am::AbstractMatrix{Tv})

or

bm = tobandedmatrix{Tv}(am::AbstractMatrix{Tv})
```
### Arguments
```julia
* `hbw`             : Half bandwidth. 
* `am`              : Symmetric AbstractMatrix
                      (if no hbw is specified, hbw will be derived from the matrix)
```
"""
function tobandedmatrix(am::AbstractMatrix)
  m = copy(am)
  typeof(m) <: SparseMatrixCSC && (m = full(m))
  (!issym(m)) && throw(ArgumentError("Matrix not symmetric"))
  hbw = 0
  n = size(m, 1)
  for i in 1:n, j in 1:n
      abs(m[i, j]) > eps() && abs(i-j) > hbw && (hbw = abs(i-j))
  end
  tobandedmatrix(hbw, m)
end

function tobandedmatrix(hbw::Int, am::AbstractMatrix)
  m = copy(am)
  typeof(m) <: SparseMatrixCSC && (m = full(m))
  (!issym(m)) && throw(ArgumentError("Matrix not symmetric"))
  Tv = eltype(m)
  n = size(m, 1)
  b = zeros(eltype(m), n, hbw+1)
  for i in 1:n
    b[i, hbw+1] = m[i, i]
    for j in 1:hbw
      i - hbw + j > 1 && (b[i, j] = m[i, i - hbw + j - 1])
    end
  end
  BandedMatrix{Tv}(hbw, b)
end

function full(bm::BandedMatrix)
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
