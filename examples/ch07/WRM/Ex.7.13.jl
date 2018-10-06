using NumericalMethodsforEngineers, Test

#=
@sym begin
  LagrangePolynomial(xi_, yi_) := Module([N, sum, num, den],
    begin
      N = Length(xi)
      sum = 0
      For( i=1, i <= N, Increment(i),
        begin
          num = 1
          den = 1
          For( j=1, j <= N, Increment(j),
            begin
              If(j != i, num *= (x-xi[j]))
              If(j != i, den *= (xi[i]-xi[j]))
            end
          )
          sum += yi[i] * num/den
        end
      ),
      Return(Simplify(sum))
    end
  )
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  Println(Y(x))
end
=#

@sym begin
  ClearAll(xi, yi, Y, R, sol, ytilde)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
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
end

println("\n\nExample 7.13: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("Residual for Weighted Residual Method using 1 point Lagragian Polynomial")
@sym Println("\nY(x) = ", Y(x), "\n")
@sym Println("R(x) = ", R(x), "\n")
println("( Example 7.13 gives: R = -4x^2*(2 + C1) + x*(1 + 4C1) + 2*(2 + C1) )", "\n")

println(r)

@eval f713(x, C1) = $(Meta.parse(r))

@test f713(1, 2) == 4.0 + 2.0*2 - 3 - 4*(-1.0 + 2.0*1 + 2*(-1 + 1))
