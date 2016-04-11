function subbac!(u::Matrix{Float64}, b::Vector{Float64})
# Back-substitution on an Upper Triangle
  n = size(u, 1)
  for i in n:-1:1
    total = b[i]
    if i < n
      for j in (i+1):n
        total -= u[i, j] * b[j]
      end
    end
    b[i] = total / u[i, i]
  end
end
