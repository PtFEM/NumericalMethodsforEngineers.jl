using NMfE
using Base.Test

@sym begin
  ClearAll(xi, yi, Y, Ydot, Ydotdot, ytilde1, ytilde2, R)
  xi = [0, 1//3, 2//3, 1]
  yi = [0, a, b, 1]
  Y(x_) := lagrangepolynomial(xi, yi)
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

println("\n\nExample 7.14 by Weighted Residual Method using Collocation\n")
@sym Println("\nY(x): ", Y(x))
@sym Println("R(x) = ", R(x))
@sym Println("ytilde(x) = ", ytilde(x))
println()

@eval rf(x, a, b) = $(parse(r))
@eval (a, b) = $(parse(s))

@assert t == "x*(0.2965260545905706 - 0.3126550868486353x + 1.016129032258065x^2)"
@assert rf(1//3, a, b) < eps()
@assert rf(2//3, a, b) < eps()
