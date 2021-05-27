using NumericalMethodsforEngineers, DataFrames, Plots

@sym begin
  LagrangePolynomial(xi_, yi_) := Module([N, sum, num, den],
    begin
      N = Length(xi)
      sum = 0
      For( i=1, i <= N, Increment(i),
        begin
          num = 1
          den = 1
          For( j=1, j <= N, Increment(j),
            begin
              If(j != i, num *= (x-xi[j]))
              If(j != i, den *= (xi[i]-xi[j]))
            end
          )
          sum += yi[i] * num/den
        end
      ),
      Return(Simplify(sum))
    end
  )
end

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
cd(ProjDir) #do
  
  x = [1.0, 3.0, 6.0]
  y = [1.0, 5.0, 10.0]
  xi = [2.0, 4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  @eval f(x) = $(Meta.parse(qs))

  xint = 1:1:10
  p = plot(xint, f.(xint), line=(:path, 1), label="interpolated curve")
  scatter!(p, dfin[:x], dfin[:y], marker=(:circle, 4), label="input points", color=:blue)
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1_symata.png")
  #gui()
  
  #end