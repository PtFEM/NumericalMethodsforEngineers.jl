using NumericalMethodsforEngineers, Test

A = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]
n = size(A, 1)
x = 0.0

# Convert to upper triang;e
function to_upper(A::Matrix, b::Vector)
  At = deepcopy(A)
  bt = deepcopy(b)  
  r, c = size(At)

  for k in 1:r-1
    if abs(At[k, k]) > 1.0e-6
    for i in k+1:r
      x = At[i, k] / At[k, k]
      At[i, k] = 0.0
      for j in k+1:r
      At[i, j] -= At[k, j] * x
      end
      bt[i] -= bt[k] * x
    end
    else
    md"Zero pivot found in row $k"
    end
  end
  (A=At, b=bt)
end

function direct_solve(A::Matrix, b::Vector)
  At = deepcopy(A)
  bt = deepcopy(b)
  r, c = size(At)

  for i in r:-1:1
    x = bt[i]
    if i < r
    for j in i+1:r
      x -= At[i, j] * bt[j]
    end
    end
    bt[i] = x / At[i, i]
  end
  bt
end

println("Modified lhs matrix and rhs")
At, bt = to_upper(a, b)
At |> display
println()

println("Solution vector:")
bt |> display

c = A\b
c |> display

println()
@test round.(c; digits=14) == d
@test round.(A * c; digits=14) == b
