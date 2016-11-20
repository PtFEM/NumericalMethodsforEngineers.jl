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
  SetJ(r, ToString(Simplify(R(x))))
end

println("\n\nExample 7.14: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("Residual for Weighted Residual Method using 2 point Lagragian Polynomial")
@sym Println("\nY(x): ", Expand(Y(x)), "\n")
println("( Example 7.14 gives: ytilde = 1/2*x^3*(27a-27b+9)-x^2*(45a-36b+9)+x*(18a-9b+2) )")
@sym Println("\nR(x) = ", R(x), "\n")

@assert r == "-9.0 - 45.0a + 36.0b + 20.0x + 45.0a*x - 63.0b*x + 18.0x^2 + 90.0a*x^2 - 72.0b*x^2 - 18.0x^3 + 54.0b*x^3 - 54.0a*x^3"