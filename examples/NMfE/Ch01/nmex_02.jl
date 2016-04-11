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
      abs(x1[i]) > abs(big) && (big = x1[i])
    end
    x1 = x1 / big
    (checkit(x1, x, tol) || (iters == limit)) && break
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
    loads[i] > big && (big = abs(loads[i]))
  end
  for i in 1:neq
    abs(loads[i] - oldloads[i])/big > tol && (converged = false)
  end
  converged
end

b = [16. -24. 18.; 3. -2. 0.; -9. 18. -17.]
x0 = [1., 1., 1.]

tol = 1.0e-5
limit = 100

(iters, eigval, eigvec) = nmex(b, x0, tol, limit)

println("No of iters:                   $iters")
println("Largest eigen value:           $eigval")
println("Corresponding eigen vector:    $eigvec")
println()

eig(b)
