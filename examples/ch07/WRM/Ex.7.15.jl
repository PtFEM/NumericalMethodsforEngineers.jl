using NumericalMethodsforEngineers
using Test

@sym begin
  ClearAll(xi, yi, Y, R, sol, ytilde)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
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

println("\n\nExample 7.15: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("by 1-point collocation Weighted Residual Method")
@sym Println("\nY(x) = ", Y(x), "\n")
@sym Println("R(x) = ", R(x), "\n")
@sym Println("C1 = $(-4*sol[1][1][2])\n")
@sym Println("ytilde_1pt_collocation(x) = ", Simplify(ytilde(x)), "\n")
println("( Example 7.15 gives: ytilde_collocation = 1/6 * x * (7x - 1) )", "\n")
println()

@eval rf_1pt_collocation(x, a) = $(Meta.parse(r))
@eval a = $(Meta.parse(s))
@eval ytilde_1pt_collocation(x) = $(Meta.parse(t))

@test r == "4 - 8a - 3x + 4x*(1 - 2x + 4a*(-1 + x))"
@test t == "(1/6)*x*(-1 + 7x)"
@test rf_1pt_collocation(0.5, a) < eps()
