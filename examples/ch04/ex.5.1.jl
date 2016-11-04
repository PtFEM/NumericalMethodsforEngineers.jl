using Jacobi, Plots
pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) #do
  
  if !isdefined(Main, :lg)
    function lg(Q, nx, x, z)
      y = zeros(nx, Q)
      for k = 1:Q, i=1:nx
        y[i,k]=lagrange(k,x[i],z)
      end
      (x, y)
    end
  end
  
  Q = 2
  nx = 3
  x=[1.0, 3.0, 6.0]
  z=[1.0, 5.0, 10.0]
  (x, y) = lg(Q, nx, x, z)
  y |> display
  println()
  
  p = plot()
  for k = 1:Q
    plot!(x, y[:, k])
  end
  
  plot(p)
  savefig("ex.5.1.png")
  gui()
  
#end