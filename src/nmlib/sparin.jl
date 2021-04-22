function sparin!(a::Vector{Float64}, kdiag::Vector{Int64})
  n = size(kdiag, 1)
  a[1] = sqrt(a[1])
  local x
  for i in 2:n
    ki = kdiag[i] - i
    l = kdiag[i-1] - ki + 1
    for j in l:i
      x = a[ki + j]
      kj = kdiag[j] - j
      if j != 1
        ll = kdiag[j-1] - kj + 1
        ll = max(l, ll)
        if ll != j
          m = j - 1
          for k in ll:m
            x -= a[ki+k] * a[kj+k]
          end
        end
      end
      a[ki+j] = x / a[kj+j]
    end
    a[ki+i] = sqrt(x)
  end
  nothing
end

function sparin(a_in::Vector{Float64}, kdiag_in::Vector{Int64})
  a = deepcopy(a_in)
  kdiag = deepcopy(kdiag_in)
  n = size(kdiag, 1)
  a[1] = sqrt(a[1])
  local x
  for i in 2:n
    ki = kdiag[i] - i
    l = kdiag[i-1] - ki + 1
    for j in l:i
      x = a[ki + j]
      kj = kdiag[j] - j
      if j != 1
        ll = kdiag[j-1] - kj + 1
        ll = max(l, ll)
        if ll != j
          m = j - 1
          for k in ll:m
            x -= a[ki+k] * a[kj+k]
          end
        end
      end
      a[ki+j] = x / a[kj+j]
    end
    a[ki+i] = sqrt(x)
  end
  a
end
