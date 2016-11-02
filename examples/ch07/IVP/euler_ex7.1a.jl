using DataFrames, Plots, Calculus
pyplot()

ProjDir = dirname(@__FILE__)
cd(ProjDir) do
  
  function euler_ex71(f::Function, y0::Float64, x::FloatRange{Float64})
    y = Vector{Real}(length(x))
    y[1] = y0
    h = x.step/x.divisor
    for i in 2:length(x)
      y[i] = y[i-1] + h * f(x[i-1], y[i-1])
    end
    columns=[]
    push!(columns, collect(x))
    push!(columns, y)
    df = DataFrame(columns, [:x, :y])
  end

  f(x,y) = 3x^2 + 2x
  fy(x) = x^3+x^2+1
  
  x1 = 1.0:0.25:2.0
  x2 = 1.0:0.1:2.0
  x3 = 0.8:0.1:2.2
  df1 = euler_ex71(f, 3.0, x1)
  df2 = euler_ex71(f, 3.0, x2)

  df1 |> display
  println()
  df2 |> display
  println()

  global p2
  
  p1 = plot(x3, fy.(x3), ylims=(0.8, 13.0))
  plot!(p1, df1[:x], df1[:y], line=(:dash, 1), marker=(:cross))
  plot!(p1, df2[:x], df2[:y], line=(:dash, 1), marker=(:circle))
  show(p1)
  savefig("euler_ex7.1A.png")
  show(p1)
  gui()
end