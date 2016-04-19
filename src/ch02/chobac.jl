function chobac!(kb::Matrix{Float64}, loads::Vector{Float64})
  #local l, m
  n = size(kb, 1)
  iw = size(kb, 2) - 1
  loads[1] = loads[1] / kb[1, iw+1]
  for i in 2:n
    x = 0.0
    k = 1
    if i <= (iw + 1)
      k = iw - i + 2
    end
    for j in k:iw
      x += kb[i, j]*loads[i+j-iw-1]
    end
    loads[i] = (loads[i] - x) / kb[i, iw+1]
  end
  loads[n] = loads[n] / kb[n, iw+1]
  for i in n-1:-1:1
    x = 0.0
    l = i + iw
    m = l - 1
    if i > (n - iw)
      l = n
      m = i + 1
    end
    for j in m:l
      x += kb[j, iw+i-j+1] * loads[j]
    end
    loads[i] = (loads[i] - x) / kb[i, iw+1]
  end
end
  