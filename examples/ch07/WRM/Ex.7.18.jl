# Continuation of ex 7.13, Least Squares WRM

using NMfE
using Base.Test

@sym begin
  ClearAll(xi, yi, N1, Y, Ydotdot, C11, ytilde1, ytilde2)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := lagrangepolynomial(xi, yi)
  #
  # Can be formulated as ytile(x) = F(x) + C1(a) * Ψ(x)
  #
  # F(x_) := 2*x^2 - x
  # C(a_) := -4a
  Ψ(x_) := x^2 - x
  #
  #Y(x_) := F(x) + C(a)*Ψ(x)
  #
  Ydotdot(x_) = D(Y(x), x, 2)
  R(x_) := Simplify(Expand(Ydotdot(x) - 3*x - 4*Y(x)))
  R(x_) = Simplify(Expand(R(x) ./ (a => -C1/4)))
  C11 = Solve(Integrate(R(x)*Ψ(x), [x, 0, 1]), C1)[1]
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(C1, ToString(C11[1][2]))
  ytilde1 = Simplify(Y(x) ./ (a => -C1/4))
  ytilde2 = Simplify(ytilde1 ./ C11)
  SetJ(y, ToString(Simplify(Expand(ytilde2))));
end

println("\n\nExample 7.13 by Weighted Residual Method using Galerkin")
@sym Println("\nY(x) = $(Y(x))\n")
@sym Println("Y(x) = $(Simplify(Expand(Y(x) ./ (a => -C1/4))))\n")
@sym Println("R(x) = $(R(x))\n")
@sym Println("C11 = $(Solve(Integrate(R(x)*Ψ(x), [x, 0, 1]), C1)[1][1][2])\n")
@sym Println("ytilde(x) = $(ytilde2)\n")
println()
@eval ytilde_leastsquares(x) = $(parse(y))
@eval rf_galerkin(x, C1) = $(parse(r))
println()

C1 = parse(C1)
rf_galerkin1(x) = rf_leastsquares(x, C1)
println()

@assert r == "4.0 + 2.0C1 + x + 4.0C1*x - 8.0x^2 - 4.0C1*x^2"
@assert y == "x*(-0.25 + 1.25x)"
@assert (quadgk(rf_galerkin1, 0, 1))[1] < 5*eps()

