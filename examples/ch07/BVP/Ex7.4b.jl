using NMfE

ProjDir = dirname(@__FILE__)
cd(ProjDir) #do

  function f(x::Float64, y::Vector{Float64})
    [y[2], -2y[2]/y[1]]
  end

  res = shootingmethod(f, [0.0, 1.0, 1.0, 2.0], [1.0, 3.0], 10, 0.00001, 40)
  #@show round(res, 4)

  #end