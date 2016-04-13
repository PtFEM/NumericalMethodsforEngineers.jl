using NMfE

old = pwd()
ProjDir = Pkg.dir("NMfE", "examples", "NMfE", "Ch07", "BVP")
cd(ProjDir)

function f2(x::Float64, y::Vector{Float64})
  [y[2], -2y[2]/y[1]]
end

(iters, nsteps, converged, res) = shootingmethod(f2, [0.0, 1.0, 1.0, 2.0], [1.0, 3.0], 
  10, 0.000001, 80)

if !converged
  println("No conversion achieved.")
elseif iters > 50
  println("Iter limit reached.")
else
  @assert round(res[:, 2], 4)' == 
    [1.0  1.1742  1.321  1.4471  1.5569  1.6534  1.7389  1.8151  1.8833  1.9446  2.0]
  #println()
  #res |> display
end
println("\n")

cd(old)