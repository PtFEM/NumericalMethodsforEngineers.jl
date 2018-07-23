# Continuation of ex 7.13, Least Squares WRM

using NumericalMethodsforEngineers
using Test

@sym begin
  ClearAll(xi, yi, N1, Y, Ydotdot, C11, ytilde1, ytilde2)
  xi = [0, 1//3, 2//3, 1]
  yi = [0, a, b, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  #
  # Can be re-formulated as Y(x) = F(x) + C1(a) * Ψ1(x) + C2(a) * Ψ2(x)
  #
  # F(x_) := (1/2)*(9x^3 - 9x^2 + 2x)
  # C1 = (27/2)*(a-b)
  Ψ1(x_) := x^3 - x^2
  # C2 = -(9/2)*(2a-b)
  Ψ2(x_) := x^2 - x
  #
  # Y(x_) := F(x) + C1(a)*Ψ1(x) + C2(a)*Ψ2(x)
  #
  Ydotdot(x_) = D(Y(x), x, 2)
  R(x_) := Ydotdot(x) - 3*x - 4*Y(x)
  Rdota(x_) = D(R(x), a)
  Rdotb(x_) = D(R(x), b)
  sol = Solve([Integrate(R(x)*Rdota(x), [x, 0, 1]), Integrate(R(x)*Rdotb(x), [x, 0, 1])], [a, b])
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(a, ToString(sol[1][1][2]))
  SetJ(b, ToString(sol[1][2][2]))
  ytilde1 = Simplify(Y(x) ./ (a => sol[1][1][2]))
  ytilde2 = Simplify(ytilde1 ./ (b => sol[1][2][2]))
  SetJ(y, ToString(Simplify(Expand(ytilde2))));
end

println("\n\nExample 7.17b: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("by 2-point least squares Weighted Residual Method")
@sym Println("\nY(x) = $(Simplify(Expand(Y(x))))\n")
@sym Println("R(x) = $(R(x))\n")
@eval a = $(Meta.parse(a))
@eval b = $(Meta.parse(b))
println("(a,b) = $((a, b))\n")
println("C1 = $((27/2*(a-b)))\n")
println("C2 = $(-(9/2*(2a-b)))\n")
@eval rf_2pt_leastsquares(x, a, b) = $(Meta.parse(r))
@eval ytilde_2pt_leastsquares(x) = $(Meta.parse(y))
println()

rf_2pt_leastsquares_1(x) = rf_2pt_leastsquares(x, a, b)
println()

@test r == "-9.0 + (-45.0)*a + 36.0*b + 20.0*x + 45.0*a*x + (-63.0)*b*x + 18.0*x^2 + "*
  "90.0*a*x^2 + (-72.0)*b*x^2 + (-18.0)*x^3 + 54.0*b*x^3 + (-54.0)*a*x^3"
@test y == "x*(0.24966470648920946 + (-0.3415867120602387)*x + 1.0919220055710293*x^2)"
@test (quadgk(rf_2pt_leastsquares_1, 0, 1))[1] < 5*eps()

