import Base: full, ==, copy, size, convert

type SkylineMatrix{Tv}
    kdiag::Vector{Int}        # Diagonal elements
    nzval::Vector{Tv}       # Nonzero values
    function SkylineMatrix(kdiag::Vector{Int}, nzval::Vector{Tv})
      new(kdiag, nzval)
    end
end

size(a::SkylineMatrix) = (length(a.kdiag), length(a.kdiag))

==(a::SkylineMatrix, b::SkylineMatrix) = (a.kdiag==b.kdiag && a.nzval==b.nzval)
    
function copy(a::SkylineMatrix)
  Tv = eltype(a.nzval)
  SkylineMatrix{Tv}(copy(a.kdiag), copy(a.nzval))
end

function convert(::Type{NMfE.SkylineMatrix}, kdiag::Vector{Int}, a::Matrix)
  Tv = eltype(a)
  SkylineMatrix{Tv}(kdiag, a)
end

function SkylineMatrix(nzval::Vector, kdiag::Vector{Int})
  Tv = eltype(nzval)
  m = n = size(kdiag, 1)
  SkylineMatrix{Tv}(kdiag, nzval)
end

function full(a::SkylineMatrix)
  fromSkyline(a.nzval, a.kdiag)
end

function fromSkyline(skyline::Vector, kdiag::Vector{Int64})
	neq = size(kdiag, 1)
	km = zeros(eltype(skyline), neq, neq)
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

function skyline2sparse(skyline::Vector, kdiag::Vector{Int64})
	neq = size(kdiag, 1)
	km = zeros(eltype(skyline), neq, neq)
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
