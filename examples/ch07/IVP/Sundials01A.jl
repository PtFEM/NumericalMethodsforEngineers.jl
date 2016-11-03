using Sundials, Plots
pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  ## f2 routine. Compute function f(x,y).

  function f2(x, y, ydot)
      ydot[1] = y[2]
      ydot[2] = 2.0*y[1] - 3.0*y[2] + 3.0*x^2
  end

  x = 0.0:0.2:5
  res = Sundials.cvode(f2, [1.0, 0.0], collect(x))
  res |> display
  println()

  p1 = plot(x, res[:,1], color=:darkblue,
    xlabel="x", ylabel="y[1]",
    title="Example Sundials01A (using Sundials.jl)"
    )
  p2 = plot(x, res[:,2], color=:darkred,
    xlabel="x", ylabel="y[2]"
    )
  plot(p1, p2, layout=(2, 1))
  savefig("Sundials01A.png")
  gui()

end