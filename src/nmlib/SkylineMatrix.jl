#=
type BandedMatrix{Tv,Ti<:Integer} <: AbstractSparseMatrix{Tv,Ti}
    m::Int                      # Number of rows
    n::Int                      # Number of columns
    bw::Int                     [1.0;zeros(N-1)]# Bandwidth
    mat::Matrix{Tv, m, }        # Banded matrix
    function BandedMatrix(mat::Matrix{Tv}, bw::Integer)
      m = size(mat, 1)
      n = size(mat, 2)
      hbw = (bw-1)÷2
      matb = tobandedmatrix(mat, hbw)
      new(m, n, bw, matb)
end
=#

type SkylineMatrix{Tv,Ti<:Integer} <: AbstractSparseMatrix{Tv,Ti}
    m::Int                  # Number of rows
    n::Int                  # Number of columns
    diag::Vector{Ti}        # Diagonal elements
    nzval::Vector{Tv}       # Nonzero values
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
