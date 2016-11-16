using Symata

@sym begin
  ClearAll(f, y0, a, l, x)
  y0(x_) := (e*x)*(l^3 - 2*l*x^2 + x^3)
  
  # Stodola-Vianello method, e.g. see Den Hartog, Advanced Strength of Materials, pg 268
  f(maxiters_, y0_) := Module([i, yder, res=Table(Table( 0.0 , [i,6]), [j,maxiters])],
    (
      # Initialize the first row of the res matrix
      res[1,2] = y0(x),
      For(i=1, i<=4, Increment(i),
        [
          yder(x_) = Simplify(D(y0, x, i))
          res[1, 2+i] = yder(x)
        ]
      ),
      Println("N[res[1, 1]]: ", res[1,1]),
      # Start the loop to improve accuracy stored in subsequent rows,
      # res[i, 1] contains the Euler ratio.
      For(i=2, i<=maxiters, Increment(i),
        begin
          res[i, 6] = Simplify(w/(EI)*((x-l)*res[i-1,4] + res[i-1,3]))
          # Above the basic Euler equation for a pinned-pinned flagpole
          ClearAll(K1, K11, tmpy5, tmpy4, tmp)
          tmpy5(x_) = Simplify(Integrate(res[i,6], x) + K1)
          tmpy4(x_) = Simplify(Integrate(tmpy5(x), x))
          # Use first pinned constraint at x=l to resolve K1
          K11 = Solve(-tmpy4(l), K1)
          res[i,5] = Simplify( tmpy5(x) ./ Flatten(K11) )
          res[i,4] = Simplify( tmpy4(x) ./ Flatten(K11) )
          ClearAll(K2, K22, tmpy3, tmpy2, tmp)
          tmpy3(x_) = Simplify(Integrate(res[i,4], x) + K2)
          tmpy2(x_) = Simplify(Integrate(tmpy3(x), x))
          # Use second pinned constraint at x=l to resolve K2
          K22 = Solve(-tmpy2(l), K2)
          res[i,3] = Simplify( tmpy3(x) ./ Flatten(K22) )
          res[i,2] = Simplify( tmpy2(x) ./ Flatten(K22) )
          tmp = Simplify( (((l^3)*w)/EI)*(res[i-1,3]/res[i, 3]) )
          res[i,1] = N(Simplify(ReplaceAll(tmp, x => l)))
          Println("N[res[$i, 1]]: ", N(res[i,1], 4))
        end
      ),
      Return(res)
    )
  )
  r = f(8, y0(x))
  Println(N(Transpose(r)[1], 4))
  # Mathematica results (for 9 iterations): 
  # {0, 22.7027, 19.1105, 18.6691, 18.5891, 18.5730, 18.5696, 18.5689}
end
