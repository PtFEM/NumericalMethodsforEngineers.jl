using Symata
using Base.Test

@sym begin
  LagrangePolynomial(xin_, yin_) := Module([N, sum, num, den, xi=xin, yi=yin],
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

function tf1(x, y)
  @sym ClearAll(xin, yin, R)
  setsymata(:xin, x)
  setsymata(:yin, y)
  @sym R(x_) := LagrangePolynomial(xin, yin)
  @sym SetJ(r, ToString(R(x)))
end

xl = [0, 0.5, 1]
yl = [0, 0.6, 1]

Symata.setsymval(:xin, xl)
Symata.setsymval(:yin, yl)
@sym R(x_) := LagrangePolynomial(xin, yin)
@sym SetJ(r1, ToString(R(x)))
@eval lg1(x) = $(parse(r1))

println()
r1 |> display
lg1(0.75) |> display
println()

xl1 = [0, 1/3, 2/3, 1]
yl1 = [0, 0.3, 0.6, 1]

tf1(xl1, yl1)
@eval lg2(x) = $(parse(r))

println()
r |> display
lg2(0.75) |> display
println()

xl1 = [0, 1/3, 2/3, 1]
yl1 = [0, 0.42222, 0.75556, 1]

Symata.setsymval(:xin, xl1)
Symata.setsymval(:yin, yl1)
@sym R(x_) := LagrangePolynomial(xin, yin)
@sym SetJ(r2, ToString(R(x)))
@eval lg3(x) = $(parse(r2))

println()
r2 |> display
lg3(0.75) |> display
println()
