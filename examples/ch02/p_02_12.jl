using NMfE, IterativeSolvers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

upper = chol(a)
lower = upper'
y = lower \ b
c = upper \ y

# p_2_12 Fortran version

x0 = [1., 1., 1.]
tol = 1.0e-5
limit = 1000

function conjugate_gradient_descent(a::Matrix{Float64}, b::Vector{Float64}, x0::Vector{Float64};
  tol=1.0e-10, limit=1000, trace=false)
  
  x = copy(x0)
  trace && println("\nFirst few iterations:")
  r = b - a * x
  p = copy(r)
  iters = 0
  while true
    iters += 1
    u = a * p
    up = r⋅r
    α = up / dot(p, u)
    xnew = x + α * p
    r -= α * u
    β = r⋅r / up
    p = r + β * p
    if trace && iters <= 5
      println("After $iters iterations: x = $x")
    end
    (checkit(xnew, x, tol) || (iters == limit)) && break
    x = xnew
  end
  converged = iters <= limit
  iters, converged, x
end

iters, converged, x = conjugate_gradient_descent(a, b, x0; tol=tol, limit=limit, trace=true)
println("\nSolution Vector: $x")
println("Converged: $(iters < limit)")
println("Number of iters: $(iters)")

@test round(x, 9) == round(c, 9)

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

tol = 1.0e-10
iters = 20
x,ch = cg(a, b;tol=tol,maxiter=iters);

println("\nSolution Vector: $x")
println("Converged: $(ch.isconverged)")
println("Number of iters: $(ch.mvps)")

@test round(x, 9) == round(c, 9)