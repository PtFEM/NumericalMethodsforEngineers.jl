using NMfE
using Base.Test

@sym begin
  CollocationWeightedResidualMethod(xi_, yi_) := Module([],
    begin
      Y(x_) := LagrangePolynomial(xi, yi)
      Println("\nY(x) = ", Y(x), "\n")
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
      R(x_) = Simplify(R(x) ./ (a => -C1/4))
      SetJ(r, ToString(Simplify(R(x))))
      Println("R(x) = ", R(x), "\n")
      Return(R(x))
    end
  )
end

function wrm(x1,y1)
    setsymata(:xin, List(x1...))
    setsymata(:yin, List(y1...))
    symeval(parse("Compile(Evaluate(CollocationWeightedResidualMethod(xin,yin)))"))
end

println("\nExample 7.13: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("Residual for Weighted Residual Method using 1 point Lagragian Polynomial")

#
# A problem with this approach is that Y(x) and R(x) should really be local to
# the Symata function and won't be available for below Println()
#

yt = wrm([0.0,0.5,1.0], [0.0,:a,1.0])

println("( Example 7.14 gives: R = -4x^2*(2 + C1) + x*(1 + 4C1) + 2*(2 + C1) )", "\n")

@assert r == "4.0 + 2.0C1 - 3x - 4x*(-1.0 + 2.0x + C1*(-1.0 + x))"

#
# Another consideration is that below yt is yt(C1::Any, x::Any)
#

"
```
The function ytilde(x, C1) contains the 1-point Weighted Residual Method
polynomial with parameter C1.
```
Arguments to ytilde(x, C1):

x::Float64          : x value\n
C1::Float64         : Weighted Residual Method constant.

C1 can be estimated by e.g. collocation, subdomain, least squares or Galerkin.
See examples 7.15 through 7.18 and Fig.7.14.jl
"
ytilde(x, C1) = yt(C1, x)
println("ytilde(1.0, 0.0) = $(ytilde(1.0, 0.0))")
@assert ytilde(1.0, 0.0) == -3.0

println("ytilde(0.0, 1.0) = $(ytilde(0.0, 1.0))")
@assert ytilde(0.0, 1.0) == 6.0
#
# For now I will continue to use the E.7.13.jl approach.
#
