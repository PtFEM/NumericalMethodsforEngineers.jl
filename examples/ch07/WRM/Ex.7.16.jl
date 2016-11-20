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
  sol = Solve(Integrate(R(x), [x, 0, 1]), a)
  ytilde(x_) = Y(x) ./ Flatten(sol)
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(s, "$(sol[1][1][2])")
  SetJ(t, ToString(Simplify(Expand(ytilde(x)))));
end

println("\n\nExample 7.13 by Weighted Residual Method using Domains\n")
@sym Println("\nY(x) = ", Y(x))
@sym Println("R(x) = ", R(x))
@sym Println("ytilde(x) = ", Simplify(ytilde(x)))
println("Example 7.16 gives: ytilde = 1/16*x*(21x - 5)")
println()

@eval rf(x, a) = $(parse(r))
@eval a = $(parse(s))
@eval ytilde(x) = $(parse(t))

rf1(x) = rf(x, a)
@assert r == "4.0 - 8.0a - 3x + 4x*(1.0 - 2.0x + 4.0a*(-1 + x))"
@assert t == "x*(-0.3125 + 1.3125x)"
@assert (quadgk(rf1, 0, 1))[1] < eps()
