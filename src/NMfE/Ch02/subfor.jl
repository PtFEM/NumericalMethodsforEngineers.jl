function subfor!(l::Matrix{Float64}, b::Vector{Float64})
# Forward-substitution on a Lower Triangle
  n = size(l, 1)
  for i in 1:n
    total = b[i]
    if i > 1
      for j in 1:(i-1)
        total -= l[i, j] * b[j]
      end
    end
    b[i] = total / l[i, i]
  end
end
