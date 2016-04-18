using NMfE

a = [3. -2. 1.; -2. 3. 2.; 1. 2. 2.]
b = [3., -3., 2.]
n = size(a, 1)

d = ldlt!(a)
lower = zeros(3, 3)
for i in 1:n
  for j in 1:i
    lower[i, j] = a[i, j] / d[j]
  end
end

println("\nLower Triangular Factors: \n $lower")
println("\nDiagonal Terms: \n $d")

ldlfor!(a, b)
for i in 1:n
  a[i, :] = a[i, :] / d[i]
end

subbac!(a, b)
println("\nSolution Vector: \n $b")
