@sym begin
  testfunc(xi_, yi_) := Module([res],
    (
      res = xi * yi,
      SetJ(r, ToString(res))
    )
  )
end

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
      Return(sum)
    end
  )
end

