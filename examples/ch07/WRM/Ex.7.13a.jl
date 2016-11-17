using Symata
using Base.Test

println()
@sym begin
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  N1 = Length(xi)
  ClearAll(num, den, sum, Y, Ydot, Ydotdot,T)
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
  Y(x_) := sum
  #
  # Can be formulated as ytile(x) = F(x) + C1(a) * Ψ(x)
  #
  F(x_) := 2*x^2 - x
  C(a_) := -4a
  Ψ(x_) := x^2 - x
  #
  #Y(x_) := F(x) + C(a)*Ψ(x)
  #
  Ydot(x_) = D(Y(x), x)
  Ydotdot(x_) = D(Ydot(x), x)
  R(x_) := Simplify(Expand(Ydotdot(x) - 3*x - 4*Y(x)))
  R(x_) = Simplify(Expand(R(x) ./ (a => -C1/4)))
  C11 = Solve(R(xi[2]), C1)[1]
  SetJ(r, ToString(Simplify(R(x))))
  SetJ(C1, ToString(C11[1][2]))
  ytilde1 = Simplify(Y(x) ./ (a => -C1/4))
  ytilde2 = Simplify(ytilde1 ./ C11)
  SetJ(y, ToString(Simplify(Expand(ytilde2))));
end

println()
@sym Print("Y(x) = ", Y(x))
println()
@sym Print("Y(x) = ", Simplify(Expand(Y(x) ./ (a => -C1/4))))
println()
@sym Println("R(x) = ", R(x))
println()
@sym Print("C11 = ", Solve(R(xi[2]), C1)[1])
println()

@eval rf(x, C1) = $(parse(r))
println()

C1 = parse(C1)
rf1(x) = parse(y)
println()

@assert r == "4.0 + 2.0C1 + x + 4.0C1*x - 8.0(x^2) - 4.0C1*(x^2)"
@assert rf(0.5, C1) < eps()
@assert y == "x*(-0.16666666666666663 + 1.1666666666666665x)"

@show r
@show y
nothing
