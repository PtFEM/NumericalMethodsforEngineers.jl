using Symata
using Base.Test

println()
@sym begin
  xi = [0, 1//3, 2//3, 1]
  yi = [0, a, b, 1]
  N1 = Length(xi)
  sum = 0
  For( i=1, i <= N1, Increment(i),
    begin
      num = 1.0
      den = 1.0
      For( j=1, j <= N1, Increment(j),
        begin
          num = If(j != i, num = num * (x-xi[j]), num)
          den = If(j != i, den = den * (xi[i]-xi[j]), den)
        end
      )
      sum = sum + yi[i] * num/den
    end
  )
  F(x_) := (1/2)*(9x^3 - 9x^2 + 2x
  C1(a_) := (27/2)*(a-b)
  Ψ1(x_) := x^3 - x^2
  C2(a_) := -(9/2)*(2a-b)
  Ψ2(x_) := x^2 - x
  Y(x_) := F(x) + C1(a)*Ψ1(x) + C2(a)*Ψ2(x)
  Ydot(x_) = D(Y(x), x)
  Ydotdot(x_) = D(Ydot(x), x)
  R(x_) := Simplify(Expand(Ydotdot(x) - 3*x - 4*Y(x)))
end

@sym Println("ytilde(sum)
println()

@sym Println("R(x) = ", R(x))
println()

@eval rf(x, C) = $(parse(r))

