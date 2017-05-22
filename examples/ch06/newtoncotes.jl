using Calculus, QuadGK

rhs(h, o) = QuadGK.quadgk((x)-> x^o, -h, h)[1]

h3 = pi/8
x3 = [pi/4, 3pi/8, pi/2]

m3 = [
  (-h3)^0 (0)^0 (h3)^0;
  (-h3)^1 (0)^1 (h3)^1;
  (-h3)^2 (0)^2 (h3)^2
]
rhs3 = [2*(h3)^0, 0*(h3)^1, 2*(h3)^2/3]
rhs3 = [2*h3, 0, 2/3*h3^3]
w3 = m3 \ rhs3
println("Three point = $(h3 * w3'*sin.(x3))\n")

println("QuadGK.quadgk = $(QuadGK.quadgk(f, pi/4, pi/2)[1])\n")

function nc(func, lb, ub, order)
  mp = (ub + lb) / 2
  h = mp - lb
  hs = [-h + i*h for i in 0:order-1]
  x = collect(linspace(lb, ub, order))
  m = ones(order, order)
  for i in 0:order-1
    for j in 1:order
      m[i+1, j] = (hs[j])^i
    end
  end
  v = [rhs(h, o) for o in 0:order-1]
  w = m \ v
  res = h * w'*sin.(x)
  (h, hs, x, m, v, w, res)
end

h, hs, x, m, v, w, res = nc(sin, pi/4, pi/2, 3)

m