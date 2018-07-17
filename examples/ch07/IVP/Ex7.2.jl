using DataFrames, Plots, NumericalMethodsforEngineers
pyplot()

old = pwd()
ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  f(x::Float64, y::Vector{Float64}) = (x + y[1])^2
  steps = 25
  h = 0.02

  x = 0.0
  y = [1.0]

  # y(3.0) = 4.2165

  r = Array{Float64,2}[]
  push!(r, euler(f, x, y, steps, h))
  push!(r, modified_euler(f, x, y, steps, h))
  push!(r, mid_point_euler(f, x, y, steps, h))
  push!(r, runga_kutta_4(f, x, y, steps, h))
  rr = hcat(r[1], r[2], r[3], r[4])
  println()
  rr[21:26,:] |> display
  println()

  xs = Float64[(i-1)*h for i in 1:steps+1]
  titles = ["Euler", "Modified_Euler", "Mid_Point_Euler", "Runga_Kutta_4"]

  p1 = plot(xs, r[1][:, 2])
  plot!(p1, xs, r[2][:, 2])
  plot!(p1, xs, r[3][:, 2])
  plot!(p1, xs, r[4][:, 2])
  show(p1)
  savefig("Ex7.2.png")
  gui()

end