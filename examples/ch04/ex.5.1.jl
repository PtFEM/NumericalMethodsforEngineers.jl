using NumericalMethodsforEngineers, DataFrames, Plots
pyplot(size=(700,700))

ProjDir = dirname(@__FILE__)
cd(ProjDir) #do
  
  x = [1.0, 3.0, 6.0, 5.0]
  y = [1.0, 5.0, 10.0, 9.0]
  xi = [2.0, 4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  xint = 1:0.1:5
  (dfin, dfxint) = lagrangianpolynomial(length(x), x, y, collect(xint))
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  dfxint |> display
  println()
  
  p = plot(dfxint[:xi], dfxint[:yi], line=(:path, 1), label="interpolated curve")
  scatter!(p, dfin[:x], dfin[:y], marker=(:circle, 4), label="input points", color=:blue)
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1.png")
  gui()
  
#end