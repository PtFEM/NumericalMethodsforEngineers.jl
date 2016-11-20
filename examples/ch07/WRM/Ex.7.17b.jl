# Continuation of ex 7.13, Least Squares WRM

using NMfE
using Base.Test

@sym begin
  ClearAll(xi, yi, N1, Y, Ydotdot, C11, ytilde1, ytilde2)
  xi = [0, 1//3, 2//3, 1]
  yi = [0, a, b, 1]
  Y(x_) := lagrangepolynomial(xi, yi)
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
@eval a = $(parse(a))
@eval b = $(parse(b))
println("(a,b) = $((a, b))\n")
println("C1 = $((27/2*(a-b)))\n")
println("C2 = $(-(9/2*(2a-b)))\n")
@eval ytilde_2pt_leastsquares(x) = $(parse(y))
@eval rf_2pt_leastsquares(x, a, b) = $(parse(r))
println()

rf_2pt_leastsquares_1(x) = rf_2pt_leastsquares(x, a, b)
println()

@assert r == "-9.0 - 45.0a + 36.0b + 20.0x + 45.0a*x - 63.0b*x + 18.0x^2 + 90.0a*x^2 -"*
  " 72.0b*x^2 - 18.0x^3 + 54.0b*x^3 - 54.0a*x^3"
@assert y == "x*(0.24966470648920946 - 0.3415867120602387x + 1.0919220055710293x^2)"
@assert (quadgk(rf_2pt_leastsquares_1, 0, 1))[1] < 5*eps()

