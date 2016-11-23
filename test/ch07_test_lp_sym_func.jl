using Symata
using Base.Test

@sym begin
  lagrangepolynomial(xi_, yi_) := Module([sum, num, den],
    begin
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
      ),
      Return(Simplify(sum))
    end
  )
end

function tf1(x, y)
  Symata.setsymval(:xin, x)
  Symata.setsymval(:yin, y)
  @sym R(x_) := lagrangepolynomial(xin, yin)
  @sym SetJ(r, ToString(R(x)))
end

xl = [0, 0.5, 1]
yl = [0, 0.6, 1]

tf1(xl, yl) |> display
@eval lg1(x) = $(parse(r))

println()
r |> display
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

