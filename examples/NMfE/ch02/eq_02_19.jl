using NMfE

N = 5
L = 1
a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
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

(lower, upper) = lufac(a)
println("Lower:")
println(lower)
println()
println("Upper:")
println(upper)
println()

println("lower*diagm(diag(upper))*lower':")
lower*diagm(diag(upper))*lower'
