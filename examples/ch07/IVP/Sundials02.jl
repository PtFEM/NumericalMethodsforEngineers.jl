using Sundials, Plots
pyplot(size=(800,800))

old = pwd()
ProjDir = dirname(@__FILE__)
cd(ProjDir) #do

  ## f routine. Compute function f(t,y).

  function f(t, y, ydot)
      ydot[1] = -0.04*y[1] + 1.0e4*y[2]*y[3]
      ydot[3] = 3.0e7*y[2]*y[2]
      ydot[2] = -ydot[1] - ydot[3]
  end
  
  #t = [0.0, 4 * logspace(-1., 7., 9)]
  t = [0.01, 0.1, 1.0, 10.0, 100.0, 1000.0, 10000.0, 100000.0, 1.0e6, 1.0e7]
  res = Sundials.cvode(f, [1.0, 0.1, 0.0], t)
  res |> display
  println()

  p1 = plot(t, res[:,1], color=:darkblue,
    xlabel="x", xscale=:log10, ylabel="y[1]",
    title="Example 7.5 (from Sundials.jl)"
    )
  p2 = plot(t, res[:,2], color=:darkred,
    xlabel="x", xscale=:log10, ylabel="y[2]"
    )
  p3 = plot(t, res[:,3], color=:darkgreen,
    xlabel="x", xscale=:log10, ylabel="y[3]"
    )
  
  plot(p1, p2, p3, layout=(3, 1))
  savefig("Sundials02.png")
  gui()

  #end