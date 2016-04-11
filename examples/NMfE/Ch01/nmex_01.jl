function nmex(a::Matrix{Float64}, x::Vector{Float64}, tol::Float64, limit::Int64)
  iters = 0
  n = size(a, 1)
  converged = false
  local big
  while true
    iters += 1
    x1 = a * x
    big = 0.0
    local i
    for i in 1:n
      if abs(x1[i]) > abs(big)
        big = x1[i]
      end
    end
    x1 = x1 / big
    if checkit(x1, x, tol) || (iters == limit)
      break
    end
    x = x1
    iters < 5 && println("$iters $i $big $x")
  end
  println()
  l2 = norm(x1)
  x1 = x1 / l2
  (iters, big, x1)
end

function checkit(loads::Vector{Float64}, oldloads::Vector{Float64}, tol::Float64)
  neq = length(loads)
  converged = true
  big = 0.0
  for i in 1:neq
    if loads[i] > big
      big = abs(loads[i])
    end
  end
  for i in 1:neq
    if (abs(loads[i] - oldloads[i])/big) > tol
      converged = false
    end
  end
  res = [(loads[i] - oldloads[i]) for i in 1:neq]
  #println(res)
  converged
end

a = [10. 5. 6.; 5. 20. 4.; 6. 4. 30.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(a, x0, tol, limit)

println("No of iters:                   $iters")
println("Largest eigen value:           $eigval")
println("Corresponding eigen vector:    $eigvec")
println()

eig(a)
