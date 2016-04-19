function tobandedmatrix(a::Matrix{Float64})
  n = size(a, 1)
  b = zeros(n, n)
  iw = size(a, 2) - 1
  for i in 1:n
    b[i, n] = a[i, i]
    for j in 1:i
      b[i, j+n-i] = a[i, j]
    end
  end
  b
end
