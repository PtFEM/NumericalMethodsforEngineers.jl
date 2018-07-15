using NMfE, DataFrames, Plots
pyplot(size=(700,700))

println()
@sym begin
  xi = [1, 3, 6]
  yi = [1, 5, 10]
  # LagrangePolynomial defined in ../../src/ch07/sym_fcns.jl
  Q(x_) = LagrangePolynomial(xi, yi)
  SetJ(qs, ToString(Q(x)))
  Print("Q(x) = $(Q(x))\n")
end

@sym Print("Q(4.5) = $(N(Q(4.5)))\n");
println("\n")

ProjDir = dirname(@__FILE__)
cd(ProjDir) do
  
  x = [1.0, 3.0, 6.0]
  y = [1.0, 5.0, 10.0]
  xi = [2.0, 4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  q3=Meta.parse(qs)
  @eval f(x) = $(q3)

  xint = 1:0.1:6
  p = plot(xint, f.(xint), line=(:path, 1), label="interpolated curve")
  scatter!(p, dfin[:x], dfin[:y], marker=(:circle, 4), label="input points", color=:blue)
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1_symata.png")
  #gui()
  
end