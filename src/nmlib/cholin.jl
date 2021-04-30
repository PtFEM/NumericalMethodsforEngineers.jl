function cholin!(kb::Matrix{Float64})
  n = size(kb, 1)
  iw = size(kb, 2) - 1
  for i in 1:n
    x = 0.0
    for j in 1:iw
      x += kb[i, j]^2.0
    end
    println([i, iw, iw+1, x, kb[i, iw+1], kb[i, iw+1] - x])
    kb[i, iw+1] = sqrt(kb[i, iw+1] - x)
    for k in 1:iw
      x = 0.0
      if i + k <= n
        if k != iw
          for l in iw - k:-1:1
            x += kb[i+k, l] * kb[i, l+k]
          end
        end
        ia = i + k
        ib = iw - k + 1
        kb[ia, ib] = (kb[ia, ib] - x) / kb[i, iw+1]
      end
    end
  end
end
