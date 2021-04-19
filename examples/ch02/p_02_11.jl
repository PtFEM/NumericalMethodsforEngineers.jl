using NumericalMethodsforEngineers, IterativeSolvers

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

f = cholesky(a)
y = f.L \ b
c = f.U \ y

# p_2_11 version

x0 = [1., 1., 1.]
tol = 1.0e-5
limit = 1000

function steepest_descent(a::Matrix{Float64}, b::Vector{Float64}, x0::Vector{Float64};
  tol=1.0e-10, limit=1000, trace=false)
  
  x = copy(x0)
  trace && println("\nFirst few iterations:")
  r = b - a * x
  iters = 0
  while true
    iters += 1
    u = a * r
    α = r⋅r / dot(r, u)
    xnew = x + α * r
    r -= α * u
    if trace && iters <= 5
      println("After $iters iterations: x = $x")
    end
    (checkit(xnew, x, tol) || (iters == limit)) && break
    x = xnew
  end
  converged = iters <= limit
  iters, converged, x
end

iters, converged, x = steepest_descent(a, b, x0; tol=tol, limit=limit, trace=true)
println("\nSolution Vector: $x")
println("Converged: $(iters < limit)")
println("Number of iters: $(iters)")

@test round.(x; digits=3) == round.(c; digits=3)

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [4., 2., 5.]

tol = 1.0e-10
iters = 20
x = cg(a, b; maxiter=iters);

println("\nSolution Vector: $x")

@test round.(x; digits=6) == round.(c; digits=6)