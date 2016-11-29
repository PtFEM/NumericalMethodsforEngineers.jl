using Symata

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

setsymata(:xin, List(0.0,0.5,1.0))
setsymata(:yin, List(0.0,0.6,1.0))

f = @sym Compile(Evaluate(LagrangePolynomial(xin,yin)));

println("\nf(0.75) = ", f(0.75))

function lagrangefunc(x1,y1)
    setsymata(:xin, List(x1...))
    setsymata(:yin, List(y1...))
    symparseeval("Compile(Evaluate(LagrangePolynomial(xin,yin)))")
end

f1 = lagrangefunc([0.0,0.5,1.0], [0.0,0.6,1.0])

println("f1(0.75) = ", f1(0.75))

xl1 = [0, 1/3, 2/3, 1]
yl1 = [0, 0.3, 0.6, 1]
f2 = lagrangefunc(xl1, yl1)

println("f2(0.75) = ", f1(0.75))
