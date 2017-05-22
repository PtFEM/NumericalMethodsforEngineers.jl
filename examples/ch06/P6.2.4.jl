using Calculus, QuadGK

g(x::Float64, a::Float64, b::Float64) = (a+b)/2 + (b-a)*x/2
scal(a, b) = (b - a)/2

x1, w1 = QuadGK.gauss(Float64, 2)
x2, w2 = QuadGK.gauss(Float64, 7)

f(x) = sin(x)
f1 = [f(g(xi, pi/4, pi/2)) for xi in x1]

@show f1
@show x1
@show w1
println()

@show scal(pi/4, pi/2)*dot(f1, w1)
println()

f2 = [f(g(xi, pi/4, pi/2)) for xi in x2]

@show f2
@show x2
@show w2
println()

@show scal(pi/4, pi/2)*dot(f2, w2)
println()

println("Rectangle rule = $(pi/4 * sin(pi/4))\n")
println("Trapezoid rule = $(1/2 * pi/4 * (sin(pi/4) + sin(pi/2)))\n")

rhs(x, h, o) = QuadGK.quadgk((x)-> x^o, -h, h)

h3 = pi/8
x3 = [pi/4, 3pi/8, pi/2]

m3 = [
  (-h3)^0 (0)^0 (h3)^0;
  (-h3)^1 (0)^1 (h3)^1;
  (-h3)^2 (0)^2 (h3)^2
]
rhs3 = [2*(h3)^0, 0*(h3)^1, 2*(h3)^2/3]
w3 = m3 \ rhs3
println("Three point = $(h3 * w3'*sin.(x3))\n")

h4 = pi/24
x4 = [3pi/12, 4pi/12, 5pi/12, 6pi/12]
m4 = [
  (-3h4)^0 (-1h4)^0 (1h4)^0 (3h4)^0;
  (-3h4)^1 (-1h4)^1 (1h4)^1 (3h4)^1;
  (-3h4)^2 (-1h4)^2 (1h4)^2 (3h4)^2;
  (-3h4)^3 (-1h4)^3 (1h4)^3 (3h4)^3
]
rhs4 = [2*3*(h4)^0, 0*(h4)^1, 2*3^2*(h4^2), 0*(h4)^3]
w4 = m4 \ rhs4
println("Four point = $(h4 * w4'*sin.(x4))\n")

println("QuadGK.quadgk = $(QuadGK.quadgk(f, pi/4, pi/2)[1])\n")
