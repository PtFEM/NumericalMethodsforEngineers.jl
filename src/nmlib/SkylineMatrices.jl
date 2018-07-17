import Base: full, ==, copy, size, convert, sparse

"""
# SkylineMatrix type for symmetric matrices

Type to hold skyline matrices with element types Tv

- sv:         Skyline vector
- kdiag:      Diagonal elements in sv.
- sm:         SkylineMatrix.

### Constructor
```julia
sm = SkylineMatrix{Tv}(kdiag::Vector{Int}, sv::Vector{Tv})

```
### Arguments
```julia
* `kdiag`           : Vector specifying location of diagonal element in sv. 
* `sv`              : Non-zero values in upper triangular matrix.
```
### Additional methods
```julia
* `size(sm)`        : Return size of full matrix => (n, n).
* `==(sm1, sm2)`    : Compare 2 SkylineMatrices for equality.
* `copy(sm)`        : Create a copy.
* `sparse(sm)`      : Convert to a SparseMatrixCSC.
* `full(sm)`        : Convert to a full matrix.

* `convert(::Type{NumericalMethodsforEngineers.SkylineMatrix}, kdiag::Vector{Int}, sv::Vector{Tv})`
                    : Default constructor

* `fromskyline(kdiag::Vector{Int}, sv::Vector{Tv})`
                    : Convert kdiag,sv to full matrix.
```
"""
type SkylineMatrix{Tv}
    kdiag::Vector{Int}        # Diagonal elements
    sv::Vector{Tv}         # Nonzero values
end

size(sm::SkylineMatrix) = (length(sm.kdiag), length(sm.kdiag))

==(sm1::SkylineMatrix, sm2::SkylineMatrix) = (sm1.kdiag==sm2.kdiag && sm1.sv==sm2.sv)
    
function copy(sm::SkylineMatrix)
  Tv = eltype(sm.sv)
  SkylineMatrix{Tv}(copy(sm.kdiag), copy(sm.sv))
end

function convert(::Type{NumericalMethodsforEngineers.SkylineMatrix}, kdiag::Vector{Int}, sv::Vector)
  Tv = eltype(sv)
  SkylineMatrix{Tv}(kdiag, sv)
end

function full(sm::SkylineMatrix)
  fromskyline(sm.kdiag, sm.sv)
end

function sparse(sm::SkylineMatrix)
	sparse(fromskyline(sm.kdiag, sm.sv))
end

"""
# Convert the pair kdiag, sv to a full matrix

### Function
```julia
m = fromskyline{Tv}(kdiag::Vector{Int}, sv::Vector{Tv})
```
### Arguments
```julia
* `kdiag`           : Vector specifying location of diagonal element in sv. 
* `sv`              : Non-zero values in upper triangular matrix.
```
"""
function fromskyline(kdiag::Vector{Int64}, sv::Vector)
	neq = size(kdiag, 1)
	km = zeros(eltype(sv), neq, neq)
	km[1, 1] = sv[kdiag[1]]
	for i in 2:neq
		km[i, i] = sv[kdiag[i]]
		for j in (kdiag[i-1] + 1):kdiag[i]
			km[i, i - (kdiag[i]-j)] = sv[j]
			km[i - (kdiag[i]-j), i] = sv[j]
    end
  end
	km
end
