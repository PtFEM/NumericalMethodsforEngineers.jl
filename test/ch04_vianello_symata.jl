using Symata

@sym begin
  ClearAll(f0, fc, f1, x, y0, a, f2, fy)
  y0(x_) := (a*x)/2 - (3*a*x^3)/2 + a*x^4
  #Println(y0(x))
  f(maxiters_, y0_) := Module([i, yder, res=Table(Table( 0.0 , [i,6]), [j,maxiters])],
    (
      res[1,2] = y0(x),
      For(i=1, i<=4, Increment(i),
        [
          yder(x_) = D(y0, x, i)
          #Println(yder)
          res[1, 2+i] = yder(x)
        ]
      ),
      Return(res)
    )
  )
  Println(f(4, y0(x)))
end
