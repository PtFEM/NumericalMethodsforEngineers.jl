using Symata

@sym begin
  ClearAll(f, y0, a, l, x)
  y0(x_) := (e*x)*(l^3 - 2*l*x^2 + x^3)
  #Println(y0(x))
  f(maxiters_, y0_) := Module([i, yder, res=Table(Table( 0.0 , [i,6]), [j,maxiters])],
    (
      res[1,2] = y0(x),
      For(i=1, i<=4, Increment(i),
        [
          yder(x_) = Simplify(D(y0, x, i))
          res[1, 2+i] = yder(x)
        ]
      ),
      For(i=2, i<=maxiters, Increment(i),
        [
          res[i, 6] = Simplify(w/(EI)*(x-l)*res[i-1,4] + w/(EI)*res[i-1,3])
          # Above the basic Euler equation for a pinned-pinned flagpole
          ClearAll(K1, tmpy5, tmpy4)
          tmpy5(x_) = Simplify(Integrate(res[i,6], x) + K1)
          tmpy4(x_) = Simplify(Integrate(tmpy5(x), x))
          res[i,5] = Simplify(ReplaceAll( tmpy4(x), Solve(-tmpy4(l), K1)[1][1] ))
          res[i,4] = Simplify(ReplaceAll( tmpy5(x), K11[1][1] ))
          
          ClearAll(K1, K11, tmpy3, tmpy2)
          tmpy3(x_) = Simplify(Integrate(res[i,4], x) + K1)
          Println("tmpy3: ", tmpy3(x), "\n")
          tmpy2(x_) = Simplify(Integrate(tmpy3(x), x))
          Println("tmpy2: ", tmpy2(x), "\n")
          K11 = Solve(-tmpy2(l), K1)
          Println("K11[1][1]: ",K11[1][1], "\n")
          res[i,3] = Simplify(ReplaceAll( tmpy3(x), K11[1][1] ))
          res[i,2] = Simplify(ReplaceAll( tmpy2(x), K11[1][1] ))
          tmp = Simplify( (((l^3)*w)/EI)*(res[i-1,3]/res[i, 3]) )
          Println("tmp: ", tmp, "\n")
          res[i,1] = N(Simplify(ReplaceAll(tmp, x => l)))
          Println("N[res[i, 1]]: ", res[i,1], "\n")
        ]
      ),
      Return(res)
    )
  )
  #Println(f(2, y0(x)))
  f(4, y0(x))
  Null
end
