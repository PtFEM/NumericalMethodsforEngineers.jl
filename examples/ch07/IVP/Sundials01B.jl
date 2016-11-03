using Sundials
pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  ## Define the system residual function.
  function resrob(tres, y, yp, r)
      r[1]  = -0.04*y[1] + 1.0e4*y[2]*y[3]
      r[2]  = -r[1] - 3.0e7*y[2]*y[2] - yp[2]
      r[1] -=  yp[1]
      r[3]  =  y[1] + y[2] + y[3] - 1.0
  end

  #t = [0.0, 4.0 * logspace(-1., 5., 7)]
  t = [0.0, 0.4, 4.0, 40.0, 400.0, 4000.0, 40000.0, 400000.0]
  yout, ypout = Sundials.idasol(resrob, [1.0, 0, 0], [-0.04, 0.04, 0.0], t)
  yout |> display
  println()
  ypout |> display
  println()
  
  p1 = plot(t, yout[:,1], color=:darkblue,
    xlabel="x", ylabel="y[1]",
    title="Example Sundials01A (using Sundials.jl)"
  )
  plot!(t, yout[:,2], color=:red)
  plot!(t, yout[:,3], color=:green)
  
  p2 = plot(t, ypout[:,1], color=:darkred,
    xlabel="x", ylabel="y[2]"
  )
  plot!(t, ypout[:,2], color=:red)
  plot!(t, ypout[:,3], color=:green)
  
  plot(p1, p2, layout=(1, 2))
  savefig("Sundials01B.png")
  gui()
  

end