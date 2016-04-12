using NMfE

N = 5
L = 100
a = [10. 1. -5;-20. 3. 20.;5. 3. 5.]
b = [1., 2., 6.]

function f1(a, b, L)
  local c
  for i in 1:L
    c = a\b
  end
  c
end

function f2(a, b, L)
  local c
  for i in 1:L
    c = copy(b)
    (lower, upper) = lufac(a)
    subfor!(lower, c)
    subbac!(upper, c)
  end
  c
end

println(f1(a, b, L))
@time f1(a, b, L)
println()

println(f2(a, b, L))
@time f2(a, b, L)
println()

lufac(a)