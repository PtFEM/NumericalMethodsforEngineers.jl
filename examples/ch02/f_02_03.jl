using NMfE

A = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]
n = size(A, 1)
d = zeros(n)

ldlt!(A, d)
lower = zeros(3, 3)
for i in 1:n
  for j in 1:i
    lower[i, j] = A[i, j] / d[j]
  end
end

println("\nLower Triangular Factors: \n $lower")
println("\nDiagonal Terms: \n $d")

ldlfor!(A, b)
for i in 1:n
  A[i, :] = A[i, :] / d[i]
end

subbac!(A, b)
println("\nSolution Vector: \n $b")
