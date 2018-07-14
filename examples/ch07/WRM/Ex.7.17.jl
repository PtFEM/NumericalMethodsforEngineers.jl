# Continuation of ex 7.13, Least Squares WRM

using NMfE
using Test

@sym begin
  ClearAll(xi, yi, N1, Y, Ydotdot, C11, ytilde1, ytilde2)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  Ydotdot(x_) = D(Y(x), x, 2)
  R(x_) := Simplify(Expand(Ydotdot(x) - 3*x - 4*Y(x)))
  R(x_) = Simplify(Expand(R(x) ./ (a => -C1/4)))
  Rdot(x_) = D(R(x), C1)
  C11 = Solve(Integrate(R(x)*Rdot(x), [x, 0, 1]), C1)[1]
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(C1, ToString(C11[1][2]))
  ytilde1 = Simplify(Y(x) ./ (a => -C1/4))
  ytilde2 = Simplify(ytilde1 ./ C11)
  SetJ(y, ToString(Simplify(Expand(ytilde2))));
end

println("\n\nExample 7.17: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("by 1-point least squares Weighted Residual Method")
@sym Print("\nY(x) = $(Y(x))\n")
@sym Print("Y(x) = $(Simplify(Expand(Y(x) ./ (a => -C1/4))))\n")
@sym Println("R(x) = $(R(x))\n")
@sym Print("C1 = $(Solve(Integrate(R(x)*Rdot(x), [x, 0, 1]), C1)[1][1][2])\n")
@eval ytilde_1pt_leastsquares(x) = $(parse(y))
@eval rf_1pt_leastsquares(x, C1) = $(parse(r))
println()

C1 = parse(C1)
rf_1pt_leastsquares_1(x) = rf_1pt_leastsquares(x, C1)
println()

@test r == "4.0 + 2.0*C1 + x + 4.0*C1*x + (-8.0)*x^2 + (-4.0)*C1*x^2"
@test y == "x*(-0.2962962962962963 + 1.2962962962962963*x)"
@test (quadgk(rf_1pt_leastsquares_1, 0, 1))[1] < 5*eps()

