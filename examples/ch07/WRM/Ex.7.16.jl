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
  sol = Solve(Integrate(R(x), [x, 0, 1]), a)
  ytilde(x_) = Y(x) ./ Flatten(sol)
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(s, "$(sol[1][1][2])")
  SetJ(t, ToString(Simplify(Expand(ytilde(x)))));
end

println("\n\nExample 7.16: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("by 1-point subdomain Weighted Residual Method")
@sym Println("\nY(x) = ", Y(x), "\n")
@sym Println("R(x) = ", R(x), "\n")
@sym Println("C1 = $(-4*sol[1][1][2])\n")
@sym Println("ytilde_1pt_subdomain(x) = ", Simplify(ytilde(x)), "\n")
println("( Example 7.16 gives: ytilde = 1/16*x*(21x - 5) )")
println()

@eval rf_1pt_subdomain(x, a) = $(parse(r))
@eval a = $(parse(s))
@eval ytilde_1pt_subdomain(x) = $(parse(t))

rf_1pt_subdomain_1(x) = rf_1pt_subdomain(x, a)
@test r == "4.0 + (-8.0)*a - 3x + 4x*(1.0 + (-2.0)*x + 4.0*a*(-1 + x))"
@test t == "x*(-0.3125 + 1.3125*x)"
@test (quadgk(rf_1pt_subdomain_1, 0, 1))[1] < eps()
