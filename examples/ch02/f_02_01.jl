using NMfE

A = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]
n = size(A, 1)
x = 0.0

# Convert to upper triang;e
for k in 1:n-1
  if abs(A[k, k]) > 1.0e-6
    for i in k+1:n
      x = A[i, k] / A[k, k]
      A[i, k] = 0.0
      for j in k+1:n
        A[i, j] -= A[k, j] * x
      end
      b[i] -= b[k] * x
    end
  else
    println("Zero pivot found in row $k")
  end
end

println("Modified Matrix")
A |> display
println()

for i in n:-1:1
  x = b[i]
  if i < n
    for j in i+1:n
      x -= A[i, j] * b[j]
    end
  end
  b[i] = x / A[i, i]
end

println("Solution vector:")
b |> display
d = copy(b)

# Restore A and b
A = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]

c = A\b

println()
@test round(c, 14) == d
@test round(A * c, 14) == b
