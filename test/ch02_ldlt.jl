using NumericalMethodsforEngineers
using Test

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]
n = size(a, 1)

(lower, upper) = lufac(a)
subfor!(lower, b)
subbac!(upper, b)
s = copy(b)

a = Float64[16 4 8;4 5 -4;8 -4 22]
b = Float64[4, 2, 5]
n = size(a, 1)
d = zeros(n)

ldlt!(a, d)
lower = zeros(3, 3)
for i in 1:n
  for j in 1:i
    lower[i, j] = a[i, j] / d[j]
  end
end

ldlfor!(a, b)
for i in 1:n
  a[i, :] = a[i, :] / d[i]
end

subbac!(a, b)

@test b == s
