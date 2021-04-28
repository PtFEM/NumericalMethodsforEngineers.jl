using NumericalMethodsforEngineers, Test

a = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]
n = size(A, 1)
x = 0.0

# Convert to upper triang;e
function to_upper(a::Matrix, b::Vector)
  at = deepcopy(a)
  bt = deepcopy(b)  
  r, c = size(at)

  for k in 1:r-1
    if abs(at[k, k]) > 1.0e-6
    for i in k+1:r
      x = at[i, k] / at[k, k]
      at[i, k] = 0.0
      for j in k+1:r
      at[i, j] -= at[k, j] * x
      end
      bt[i] -= bt[k] * x
    end
    else
    md"Zero pivot found in row $k"
    end
  end
  (at, bt)
end

function direct_solve(a::Matrix, b::Vector)
  at = deepcopy(a)
  bt = deepcopy(b)
  r, c = size(at)

  for i in r:-1:1
    x = bt[i]
    if i < r
    for j in i+1:r
      x -= at[i, j] * bt[j]
    end
    end
    bt[i] = x / at[i, i]
  end
  bt
end

println("Modified lhs matrix and rhs")
at, bt = to_upper(a, b)
at |> display
println()
bt |> display
println()

println("Solution vector:")
c_nmfe = direct_solve(at, bt)
c_nmfe |> display
println()

c = a \ [1., 2., 6.]
c |> display

println()
@test ≈(c, c_nmfe, atol=1e-10)
@test round.(a * c; digits=14) == b
