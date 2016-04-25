function checkit(loads::Vector{Float64}, oldloads::Vector{Float64}, tol::Float64)
  neq = length(loads)
  converged = true
  big = 0.0
  for i in 1:neq
    loads[i] > big && (big = abs(loads[i]))
  end
  for i in 1:neq
    abs(loads[i] - oldloads[i])/big > tol && (converged = false)
  end
  converged
end
