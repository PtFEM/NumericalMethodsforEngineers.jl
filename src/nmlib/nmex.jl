function nmex(a::Matrix{Float64}, x::Vector{Float64};
    tol::Float64=1.0e-10, limit::Int64=1000, show=0)
    
  iters = 0
  n = size(a, 1)
  converged = false
  local big
  while true
    iters += 1
    x1 = a * x
    big = 0.0
    for i in 1:n
      abs(x1[i]) > abs(big) && (big = x1[i])
    end
    x1 = x1 / big
    (checkit(x1, x, tol) || (iters == limit)) && break
    x = x1
    iters <= show && println("$iters $big $x")
  end
  l2 = norm(x1)
  x1 = x1 / l2
  (iters, big, x1)
end
