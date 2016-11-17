using NMfE
using Base.Test

@sym begin
  ClearAll(xi, yi, Y, R, sol, ytilde)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := lagrangepolynomial(xi, yi)
  #
  # Can be formulated as ytile(x) = F(x) + C1(a) * Ψ(x)
  #
  # F(x_) := 2*x^2 - x
  # C(a_) := -4a
  # Ψ(x_) := x^2 - x
  #
  #Y(x_) := F(x) + C(a)*Ψ(x)
  #
  R(x_) = Simplify(D(Y(x), x, 2) - 3*x - 4*Y(x))
  sol = Solve(R(xi[2]), a)
  ytilde(x_) = Y(x) ./ Flatten(sol)
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(s, "$(sol[1][1][2])")
  SetJ(t, ToString(Simplify(Expand(ytilde(x)))));
end

println()
@sym Println("\nY(x) = ", Y(x))
@sym Println("R(x) = ", R(x))
@sym Println("ytilde(x) = ", ytilde(x))
println()

@eval rf(x, a) = $(parse(r))
@eval a = $(parse(s))
@eval ytilde(x) = $(parse(t))

@assert r == "4.0 - 8.0a - 3x - 4.0x*(-1 + 2x) + 16.0a*x*(-1 + x)"
@assert t == "x*(-0.16666666666666663 + 1.1666666666666665x)"
@assert rf(0.5, a) < eps()
