using NMfE
using Test

ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  function f2(x::Float64, y::Vector{Float64})
    [y[2], 3x^2+4y[1]]
  end

  (iters, nsteps, converged, res) = shootingmethod(f2, [0.0, 0.0, 1.0, 1.0], [0.0, 1.0], 5)

  if !converged
    println("No conversion achieved.")
  elseif iters > 50
    println("Iter limit reached.")
  else
    @test round.(res[:, 2], digits=4)' == [0.0  0.0813  0.1815  0.3313  0.5794  1.0]
    #println()
    #res |> display
  end

end