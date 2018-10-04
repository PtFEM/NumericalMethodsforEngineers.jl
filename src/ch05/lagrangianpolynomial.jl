using DataFrames

function lagrangianpolynomial(np::Int, x::Vector{Float64}, y::Vector{Float64}, xi::Vector{Float64})
  local yi = Vector{Float64}(undef, length(xi))
  m = sort(hcat(x, y), dims=1)
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