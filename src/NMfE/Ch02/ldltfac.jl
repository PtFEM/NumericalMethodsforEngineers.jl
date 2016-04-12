function ldltfac(a::Matrix{Float64})
  n = size(a, 1)
  d = zero(n)
  for k in 1:n-1
    d[1] = a[1, 1]
    if abs(a[k, k]) > eps(a[k, k])
      for i in k+1:n
        x = a[i, k] / a[k, k]
        for j in k+1:n
          a[i, j] -= a[k, j] * x
        end
        d[i] = a[i, i]
      end
    else
      println("Zero pivot fund in row $k")
    end
  end
  d
end

function ldlfor(a::Matrix{Float64}, b::Vector{Float64})
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
