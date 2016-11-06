using Symata, NMfE, DataFrames, Plots

if !isdefined(Main, :lagrangianpolynomial)
  function lagrangianpolynomial(np::Int, x::Vector{Float64}, y::Vector{Float64}, xi::Vector{Float64})
    local yi = Vector{Float64}(length(xi))
    m = sort(hcat(x, y), 1)
    for l in 1:length(xi)
      for i in 1:np
        term = 1.0
        for j in 1:np
          j !== i && (term *= (xi[l] - m[j, 1])/(m[i, 1] - m[j, 1]))
        end
        yi[l] += term * m[i, 2]
      end
    end
    columns=[]
    push!(columns, m[:,1])
    push!(columns, m[:,2])
    df = DataFrame(columns, [:x, :y])
  
    columns=[]
    push!(columns, xi)
    push!(columns, yi)
    dfxi = DataFrame(columns, [:xi, :yi])
  
    (df, dfxi)
  end
end

#=
# Symata() to programmatically insert ("\u003D") ??

xi = {1, 3, 6}
yi = {1, 5, 10}
L0(x_) := Simplify( Expand( ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3])) ) )
L1(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3])) ) )
L2(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[2]))/((xi[3]-xi[1])*(xi[3]-xi[2])) ) )
Q(x_) := Simplify(yi[1]*L0(x) + yi[2]*L1(x) + yi[3]*L2(x))

Q(x)
Q(4.5)

# Julia() to programmatically insert ("\u008") ??
=#

ProjDir = dirname(@__FILE__)
cd(ProjDir) do
  
  pyplot(size=(700,700))
  
  x = [1.0, 3.0, 6.0]
  y = [1.0, 5.0, 10.0]
  xi = [2.0, 4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  xint = 1:0.1:5
  (dfin, dfxint) = lagrangianpolynomial(length(x), x, y, collect(xint))
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  #dfxint |> display
  #println()
  
  p = plot(dfxint[:xi], dfxint[:yi], line=(:path, 1), label="interpolated curve")
  scatter!(p, dfin[:x], dfin[:y], marker=(:circle, 4), label="input points", color=:blue)
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1.png")
  #gui()
  
end