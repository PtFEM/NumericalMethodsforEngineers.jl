using NumericalMethodsforEngineers

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
end
=#

println("\n\n--------1------------\n")

@sym begin
  ClearAll(xi, yi, Y, R, sol, ytilde)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  Println(Y(x))
end

println("\n---------2-----------\n")

@sym begin
  ClearAll(xi, yi, Y1, R, sol, ytilde)
  Y1(x_) := x^3 -3x^2 +6x - 9
  R(x_) = Simplify(D(Y1(x), x, 2))
  Println(R(x))
end

println("\n----------3----------\n")

@sym begin
  ClearAll(xi, yi, Y, R, sol, ytilde)
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  Y(x_) := LagrangePolynomial(xi, yi)
  R(x_) = Simplify(D(Y(x), x, 2) - 3*x - 4*Y(x))
  R(x_) = Simplify(R(x) ./ (a => -C1/4))
  Println(R(x))
  SetJ(r, ToString(Simplify(R(x))))
end

println("\n----------4----------\n")

println(r)

println("\n----------5----------\n")

println("\n\nExample 7.14: y'' = 3x + 4y, y(0)=0, y(1)=1")
println("Residual for Weighted Residual Method using 2 point Lagragian Polynomial")
@sym Println("\nY(x): ", Expand(Y(x)), "\n")
println("( Example 7.14 gives: ytilde = 1/2*x^3*(27a-27b+9)-x^2*(45a-36b+9)+x*(18a-9b+2) )")
@sym Println("\nR(x) = ", R(x), "\n")
