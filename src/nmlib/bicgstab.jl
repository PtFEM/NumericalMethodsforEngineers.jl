function bicgstab(a::Matrix{Float64}, b::Vector{Float64}, x0::Vector{Float64};
  tol=1.0e-10, limit=1000, trace=false)
  
  n = size(a, 1)
  x = copy(x0)
  local converged
  
  r = b - a * x
  r0_hat = copy(r)
  rho0 = w = α = 1.0
  v = zeros(n)
  p = zeros(n)
  rho1 = dot(r0_hat, r)
  trace && println("\nFirst few iterations:")
  iters = 0
  while true
    iters += 1
    converged = norm(r) < tol * norm(b)
    (converged || (iters == limit)) && break
    β = (rho1 / rho0) * (α / w)
    p = r + β * (p - w * v)
    v = a * p
    α = rho1 / dot(r0_hat, v)
    s = r - α * v
    t = a * s
    w = dot(t, s) / dot(t, t)
    rho0 = rho1
    rho1 = -w * dot(r0_hat, t)
    x += α * p + w * s
    r = s - w * t
    if trace && iters <= 5
      println("After $iters iterations: x = $x")
    end
  end
  iters, converged, x
end
