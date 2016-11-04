using NMfE, DataFrames, Plots
pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) #do
  
  x = [1.0, 3.0, 6.0, 5.0]
  y = [1.0, 5.0, 10.0, 9.0]
  xi = [4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  lab=", interpolated points, interpolated input points"
  p = plot(dfin[:x], dfin[:y], marker=(:circle, 4), label="input points")
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1.png")
  gui()
  
#end