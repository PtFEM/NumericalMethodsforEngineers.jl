using Sundials, Plots
using Test

pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  function sysfn(y, fy)
      fy[1] = y[1]^2 + y[2]^2 - 1.0
      fy[2] = y[2] - y[1]^2
  end

  res = Sundials.kinsol(sysfn, ones(2))
  res |> display
  println()

  @test round(res, digits=4) == round([0.786153, 0.618035], digits=4)

end