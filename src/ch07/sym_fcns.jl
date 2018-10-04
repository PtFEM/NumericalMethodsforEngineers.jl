# My formulation

#=
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
=#

# John's better formulation, much better, need to update tests


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

