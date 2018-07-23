using Symata
using Test

@sym begin
  LagrangePolynomial(xi_, yi_) := Module([N, sum, num, den],
    begin
      N = Length(xi)
      sum = 0
      For( i=1, i <= N, Increment(i),
        begin
          num = 1.0
          den = 1.0
          For( j=1, j <= N, Increment(j),
            begin
              num = If(j != i, num = num * (x-xi[j]), num)
              den = If(j != i, den = den * (xi[i]-xi[j]), den)
            end
          )
          sum = sum + yi[i] * num/den
        end
      ),
      Return(Simplify(sum))
    end
  )
end

@sym begin
  CollocationWeightedResidualMethod(xi_, yi_, doprint_) := Module([Y, R],
    begin
      Y(x_) := LagrangePolynomial(xi, yi)
      If(doprint, Println("\nY(x) = ", Y(x), "\n"))
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
      If(doprint, Println("R(x) = ", R(x), "\n"))
      Return(R(x))
    end
  )
end

function wrm(x1,y1, doprint=true)
    setsymata(:xin, List(x1...))
    setsymata(:yin, List(y1...))
    setsymata(:doprint, doprint ? true : false)
    #symtranseval(Meta.parse("Compile(Evaluate(CollocationWeightedResidualMethod(xin,yin,doprint)))"))
    symparseeval("Compile(Evaluate(CollocationWeightedResidualMethod(xin,yin,doprint)))")
end

println("\nExample 7.13: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("Residual for Weighted Residual Method using 1 point Lagragian Polynomial\n")

#
# A consequence of the Julia function based approach is that Y(x) and R(x) are local
# to the Symata function and are not available for examination, e.g. @sym R(x)
#

lp_eq = @sym ToString(LagrangePolynomial([0.0,0.5,1.0], [0.0,a,1.0]))
println(lp_eq)
@test lp_eq == "x*(-1.0 + 2.0*x + (-4.0)*a*(-1.0 + x))"
wrm_eq = @sym ToString(CollocationWeightedResidualMethod([0.0,0.5,1.0], [0.0,a,1.0], false))
println(wrm_eq)
@test wrm_eq == "4.0 + 2.0*C1 - 3x - 4x*(-1.0 + 2.0*x + C1*(-1.0 + x))"

#
# Another consideration is that below yt is yt(C1::Any, x::Any)
#

yt = wrm([0.0,0.5,1.0], [0.0,:a,1.0], true)

println("( Example 7.13 gives: R = -4x^2*(2 + C1) + x*(1 + 4C1) + 2*(2 + C1) )", "\n")

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
@test ytilde(1.0, 0.0) == -3.0

println("ytilde(0.0, 1.0) = $(ytilde(0.0, 1.0))")
@test ytilde(0.0, 1.0) == 6.0

#
# Tests with @symExpr
#

setsymata(:x1, [0.0,0.5,1.0])
wrm_1pt_col(x, C1) = @symExpr CollocationWeightedResidualMethod(x1, [0.0,a,1.0], false)

#
# The order of the arguments can be chosen. This is nice.
#

println("wrm_1pt_col(1.0, 0.0) = $(wrm_1pt_col(1.0, 0.0))")
@test wrm_1pt_col(1.0, 0.0) == ytilde(1.0, 0.0)

#
# Like @sym, I think @symExpr is not intended to return an expression from a Julia function.
#

function wrm_1(xin, xinval, C1inval)
  setsymata(:x1, xin)
  f(x, C1) = @symExpr CollocationWeightedResidualMethod(x1, [0.0,a,1.0], false)
  f(xinval, C1inval)
end

@test wrm_1([0.0,0.5,1.0], 1.0, 0.0) == ytilde(1.0, 0.0)

