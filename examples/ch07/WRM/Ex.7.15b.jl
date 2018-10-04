using NumericalMethodsforEngineers
using Test

@sym begin
  ClearAll(xi, yi, Y, Ydot, Ydotdot, ytilde1, ytilde2, R)
  xi = [0, 1//3, 2//3, 1]
  yi = [0, a, b, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  #
  # Can be re-formulated as Y(x) = F(x) + C1(a) * Ψ1(x) + C2(a) * Ψ2(x)
  #
  # F(x_) := (1/2)*(9x^3 - 9x^2 + 2x)
  # C1(a_) := (27/2)*(a-b)
  # Ψ1(x_) := x^3 - x^2
  # C2(a_) := -(9/2)*(2a-b)
  # Ψ2(x_) := x^2 - x
  #
  # Y(x_) := F(x) + C1(a)*Ψ1(x) + C2(a)*Ψ2(x)
  #
  R(x_) = Simplify(D(Y(x), x, 2) - 3*x - 4*Y(x))
  sol = Solve([R(xi[2]), R(xi[3])], [a, b])
  ytilde(x_) = Y(x) ./ Flatten(sol)
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(s, "[$(sol[1][1][2]), $(sol[1][2][2])]")
  SetJ(t, ToString(Simplify(ytilde(x))))
end

println("\n\nExample 7.15b: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("by 2-point collocation Weighted Residual Method")
@sym Println("\nY(x): ", Y(x), "\n")
@sym Println("R(x) = ", R(x), "\n")
println("(a, b) = $(s)\n")
@sym Println("ytilde_2pt_collocation(x) = ", Simplify(ytilde(x)), "\n")
println()

@eval rf_2pt_collocation_2(x, a, b) = $(Meta.parse(r))
@eval ytilde_2pt_collocation(x) = $(Meta.parse(t))
@eval (a, b) = $(Meta.parse(s))

@test t == "(1/806)*x*(239 - 252x + 819*x^2)"
@test rf_2pt_collocation_2(1//3, a, b) <= eps()
@test rf_2pt_collocation_2(2//3, a, b) <= eps()
