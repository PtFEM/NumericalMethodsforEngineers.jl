import Base: full, ==, copy, size

type SkylineMatrix{Tv,Ti<:Integer} <: AbstractSparseMatrix{Tv,Ti}
    m::Int                  # Number of rows
    n::Int                  # Number of columns
    colptr::Vector{Ti}      # Column i is in colptr[i]:(colptr[i+1]-1)
    rowval::Vector{Ti}      # Row values of nonzeros
    diag::Vector{Ti}        # Diagonal elements
    nzval::Vector{Tv}       # Nonzero values
    function SkylineMatrix(m::Integer, n::Integer, colptr::Vector{Ti},
      rowval::Vector{Ti}, diag::Vector{Ti}, nzval::Vector{Tv})
      m < 0 && throw(ArgumentError("Number of rows (m) must be >= 0, got $m"))
      n < 0 && throw(ArgumentError("Number of columns (n) must be >= 0, got $n"))
      new(Int(m), Int(n), colptr, rowval, diag, nzval)
    end
end

size(a::SkylineMatrix) = (a.m, a.n)

==(a::SkylineMatrix, b::SkylineMatrix) =
  (a.n==b.n && a.m==b.m && a.colptr==b.colptr && a.rowval==b.rowval && 
    a.diag==b.diag && a.nzval==b.nzval)
    
copy(a::SkylineMatrix) = SkylineMatrix(a.m, a.n, a.diag, a.nzval)

function SkylineMatrix(nzval::Vector, diag::Vector{Int})
  Tv = eltype(nzval)
  Ti = eltype(diag)
  colptr = Vector{Ti}()
  rowval = Vector{Ti}()
  m = n = size(diag, 1)
  SkylineMatrix{Tv, Ti}(m, n, colptr, rowval, diag, nzval)
end

function full(a::SkylineMatrix)
  skyline = a.nzval
  kdiag = a.diag
	neq = size(kdiag, 1)
	km = zeros(neq, neq)
	km[1, 1] = skyline[kdiag[1]]
	for i in 2:neq
		km[i, i] = skyline[kdiag[i]]
		for j in (kdiag[i-1] + 1):kdiag[i]
			km[i, i - (kdiag[i]-j)] = skyline[j]
			km[i - (kdiag[i]-j), i] = skyline[j]
    end
  end
	km
end

function fromSkyline(skyline::Vector{Float64}, kdiag::Vector{Int64})
	neq = size(kdiag, 1)
	km = zeros(neq, neq)
	km[1, 1] = skyline[kdiag[1]]
	for i in 2:neq
		km[i, i] = skyline[kdiag[i]]
		for j in (kdiag[i-1] + 1):kdiag[i]
			km[i, i - (kdiag[i]-j)] = skyline[j]
			km[i - (kdiag[i]-j), i] = skyline[j]
    end
  end
	km
end

function skyline2sparse(skyline::Vector{Float64}, kdiag::Vector{Int64})
	neq = size(kdiag, 1)
	km = zeros(neq, neq)
	km[1, 1] = skyline[kdiag[1]]
	for i in 2:neq
		km[i, i] = skyline[kdiag[i]]
		for j in (kdiag[i-1] + 1):kdiag[i]
			km[i, i - (kdiag[i]-j)] = skyline[j]
			km[i - (kdiag[i]-j), i] = skyline[j]
    end
  end
	sparse(km)
end
