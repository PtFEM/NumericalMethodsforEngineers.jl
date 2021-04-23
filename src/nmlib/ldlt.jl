function ldlt!(a::Matrix{Float64}, d = Vector{Float64}; small=1.0e-10)
  n = size(a, 1)
  for k in 1:n-1
    d[1] = a[1,1]
    if abs(a[k,k]) > small
      for i in k+1:n
        x = a[i,k] / a[k,k]
        for j = k+1:n
          a[i,j] -= a[k,j] * x
        end
        #println([i, a[i, :]])
        d[i] = a[i,i]
      end
    else
      println("Zero pivot found in row $k")
    end
  end
  #println((a, d))
end

function ldlt(a_in::Matrix{Float64}; small=1.0e-10)
  a = deepcopy(a_in)
  n = size(a, 1)
  d = zeros(n)
  for k in 1:n-1
    d[1] = a[1,1]
    if abs(a[k,k]) > small
      for i in k+1:n
        x = a[i,k] / a[k,k]
        for j = k+1:n
          a[i,j] -= a[k,j] * x
        end
        #println([i, a[i, :]])
        d[i] = a[i,i]
      end
    else
      println("Zero pivot found in row $k")
    end
  end
  lower = zeros(3, 3)
  for i in 1:n
    for j in 1:i
      lower[i, j] = a[i, j] / d[j]
    end
  end
  #println((a, d))
  (lower, d, Matrix(lower'))
end

export
  ldlt!,
  ldlt