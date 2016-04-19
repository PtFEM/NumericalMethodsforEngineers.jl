function frombandedmatrix(a::Matrix{Float64})
  n = size(a, 1)
  b = zeros(n, n)
  iw = size(a, 2) - 1
  for i in n:-1:1
    b[i, i] = a[i, n]
    for j in n-1:-1:n-iw
      if abs(a[i, j]) > eps()
        if i == n
          b[i, j] = a[i, j]
          b[j, i] = a[i, j]
        else
            b[i, i-n+j] = a[i, j]
            b[i-n+j, i] = a[i, j]
        end
      end
    end
  end
  b
end
