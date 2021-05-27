using Jacobi, Plots
gr(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) #do
  
  if !isdefined(Main, :lgt)
    function lgt(Q, nx, lb, ub)
      z = zglj(Q)
      x = collect(linspace(lb, ub, nx))
      y = zeros(nx, Q)
      for k = 1:Q, i=1:nx
        y[i,k]=lagrange(k,x[i],z)
      end
      (x, y)
    end
  end
  
  Q = 5
  nx = 201
  lb = -1
  ub = 1
  (x, y) = lgt(Q, nx, lb, ub)
  
  p = plot()
  for k = 1:Q
    plot!(x, y[:, k], label="Q = $k")
  end
  
  plot(p)
  savefig("lagrange_n201.png")
  gui()
  
  Q = 5
  nx = 3
  lb = -1
  ub = 1
  (x, y) = lgt(Q, nx, lb, ub)
  x |> display
  println()
  y |> display
  println()
  
  p = plot()
  for k = 1:Q
    plot!(x, y[:, k], label="Q = $k")
  end
  
  plot(p)
  savefig("lagrange_n3.png")
  gui()
  
#end