function spabac!(a::Vector{Float64}, b::Vector{Float64}, kdiag::Vector{Int64})
  n = size(kdiag, 1)
  b[1] /= a[1]
  for i in 2:n
    ki = kdiag[i] - i
    l = kdiag[i-1] - ki + 1
    x = b[i]
    if l != i
      m = i - 1
      for j in l:m
        x -= a[ki+j] * b[j]
      end
    end
    b[i] = x / a[ki+i]
  end
  for it in 2:n
    i = n + 2 - it
    ki = kdiag[i] - i
    x = b[i] / a[ki+i]
    b[i] = x
    l = kdiag[i-1] - ki + 1
    if l != i
      m = i - 1
      for k in l:m
        b[k] -= x * a[ki+k]
      end
    end
  end
  b[1] /= a[1]
  nothing
end

function spabac(a::Vector{Float64}, b_in::Vector{Float64}, kdiag::Vector{Int64})
  b = deepcopy(b_in)
  n = size(kdiag, 1)
  b[1] /= a[1]
  for i in 2:n
    ki = kdiag[i] - i
    l = kdiag[i-1] - ki + 1
    x = b[i]
    if l != i
      m = i - 1
      for j in l:m
        x -= a[ki+j] * b[j]
      end
    end
    b[i] = x / a[ki+i]
  end
  for it in 2:n
    i = n + 2 - it
    ki = kdiag[i] - i
    x = b[i] / a[ki+i]
    b[i] = x
    l = kdiag[i-1] - ki + 1
    if l != i
      m = i - 1
      for k in l:m
        b[k] -= x * a[ki+k]
      end
    end
  end
  b[1] /= a[1]
  b
end
