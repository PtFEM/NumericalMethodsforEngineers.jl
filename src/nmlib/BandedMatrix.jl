import Base: full, ==, copy, size, convert, sparse

#
# bm:         BandedMatrix
# bmat:       Banded matrix (the field in a BandedMatrix object)
# m:          Regular matix
# sbm:        Semi-banded matrix, e.g.
#               sbm = [0 0 1; 0 2 3; 4 5 6]
# hbw:        Half bandwidth, hbw = (bw - 1)÷2 (notice the \div symbol)
#

type BandedMatrix{Tv}
    hbw::Int                    # Bandwidth bw = 1 + 2*hbw
    bmat::Matrix{Tv}              # Banded matrix
end

size(bm::BandedMatrix) = (size(bm.bmat, 1), size(bm.bmat, 1))

==(bm1::BandedMatrix, bm2::BandedMatrix) = (bm1.hbw==bm2.hbw && bm1.bmat==bm2.bmat)

function copy(bm::BandedMatrix) 
  Tv = eltype(bm.bmat)
  BandedMatrix{Tv}(bm.hbw, copy(bm.bmat))
end

# Conversion routine to turn a regular matrix into a BandedMatrix
function convert(::Type{NMfE.BandedMatrix}, m::Matrix)
  tobandedmatrix(m)
end

# Conversion routine similar to default constructor
function convert(::Type{NMfE.BandedMatrix}, hbw::Int, bmat::Matrix)
  Tv = eltype(a)
  BandedMatrix{Tv}(hbw, a)
end

function sparse(bm::BandedMatrix)
  sparse(full(bm))
end

function tobandedmatrix(m::Matrix)
  if eltype(m) == Complex{Float64} || eltype(m) == Complex{Int}
    m != conj(m') && throw(ArgumentError("Matrix not symmetric"))
  else 
    m != m' && throw(ArgumentError("Matrix not symmetric"))
  end
  hbw = 0
  n = size(m, 1)
  for i in 1:n
    for j in 1:n
      if abs(m[i, j]) > eps()
        if abs(i-j) > hbw
          hbw = abs(i-j)
        end
      end
    end
  end
  tobandedmatrix(hbw, m)
end

function tobandedmatrix(hbw::Int, m::Matrix)
  if eltype(m) <: Complex
    m != conj(m') && throw(ArgumentError("Matrix not conj symmetric"))
  else 
    m != m' && throw(ArgumentError("Matrix not symmetric"))
  end
  Tv = eltype(m)
  n = size(m, 1)
  b = zeros(eltype(m), n, hbw+1)
  for i in 1:n
    b[i, hbw+1] = m[i, i]
    for j in 1:hbw
      if i - hbw + j > 1
        b[i, j] = m[i, i - hbw + j - 1]
      end
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

Docile.@comment """
# Theoretical performance of a BHA
"""

"""
Function to compute the theoretical performance in terms of building or dropping rate.

### Function
```julia
params = theoretical_bha_performance!(data::Dict{Symbol, Any})

or

params = TP.tp!(data::Dict{Symbol, Any})

```
### Arguments
```julia
* `data`      : Dictionary with input (and updated) data. 
```
### Results
```julia
* `params`    : Object with all computational results.
```
"""
function test()
  println("Just a doc reminder")
end