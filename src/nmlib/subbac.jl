function subbac!(u::Matrix{Float64}, b::Vector{Float64})
# Back-substitution on an Upper Triangle
  n = size(u, 1)
  for i in n:-1:1
    total = b[i]
    if i < n
      for j in i+1:n
        total -= u[i, j] * b[j]
      end
    end
    b[i] = total / u[i, i]
  end
end

# Back-substitution on an Upper Triangle
function subbac(u::Matrix{Float64}, b::Vector{Float64})
  bt = deepcopy(b)
  n = size(u, 1)
  for i in n:-1:1
    total = bt[i]
    if i < n
      for j in i+1:n
        total -= u[i, j] * bt[j]
      end
    end
    bt[i] = total / u[i, i]
  end
  bt
end

export
  subbac!,
  subbac