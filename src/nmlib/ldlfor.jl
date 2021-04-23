function ldlfor!(a::Matrix{Float64}, b::Vector{Float64})
  n = size(a, 1)
  for i in 1:n
    total = b[i]
    if i > 1
      for j in 1:(i-1)
        total -= a[j, i] * b[j]
      end
    end
    b[i] = total / a[i, i]
  end
end

export
  ldlfor!
