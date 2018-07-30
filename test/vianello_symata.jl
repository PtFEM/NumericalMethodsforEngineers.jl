using Symata

@sym begin
  ClearAll(f, y0, a, l, x)
  y0(x_) := (e*x)*(l^3 - 2*l*x^2 + x^3)
  
  # Stodola-Vianello method, e.g. see Den Hartog, Advanced Strength of Materials, pg 268
  f(maxiters_, y0_) := Module([i, yder, res=ConstantArray(0.0,[maxiters,6])],
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
          K11 = Solve(-tmpy4(l), K1)[1]
          res[i,5] = Simplify( tmpy5(x) ./ K11 )
          res[i,4] = Simplify( tmpy4(x) ./ K11 )
          ClearAll(K2, K22, tmpy3, tmpy2, tmp)
          tmpy3(x_) = Simplify(Integrate(res[i,4], x) + K2)
          tmpy2(x_) = Simplify(Integrate(tmpy3(x), x))
          # Use second pinned constraint at x=l to resolve K2
          K22 = Solve(-tmpy2(l), K2)[1]
          res[i,3] = Simplify( tmpy3(x) ./ K22 )
          res[i,2] = Simplify( tmpy2(x) ./ K22 )
          tmp = Simplify( (((l^3)*w)/EI)*(res[i-1,3]/res[i, 3]) )
          res[i,1] = N(Simplify(ReplaceAll(tmp, x => l)))
          Println("N[res[$i, 1]]: ", N(res[i,1], 4))
        end
      ),
      Println(),
      Return(res)
    )
  )
  
  # Mathematica results (for 9 iterations): 
  # {0, 22.7027, 19.1105, 18.6691, 18.5891, 18.5730, 18.5696, 18.5689}
  
  # Since Julia-0.7 build >~ 180 it is failing abobe 6 iterations with a spurious PyCall error:
  
  #=
  julia> include("/Users/rob/.julia/dev/NumericalMethodsforEngineers/test/vianello_symata.jl")
  N[res[1, 1]]: 0.0
  N[res[2, 1]]: 22.7027027027027
  N[res[3, 1]]: 19.110473457675752
  N[res[4, 1]]: 18.669080846404874
  N[res[5, 1]]: 18.589113036311467
  N[res[6, 1]]: 18.57300630567659
  MethodError(Rational, (1, PyObject 93666727314800640000), 0x0000000000006bc8)
  ERROR: LoadError: LoadError: MethodError: no method matching Rational(::Int64, ::PyCall.PyObject)
  Closest candidates are:
    Rational(::Integer) at rational.jl:20
    Rational(::T<:Integer, ::T<:Integer) where T<:Integer at rational.jl:18
    Rational(::Integer, ::Integer) at rational.jl:19
    ...
  Stacktrace:
   [1] _pytosj(::PyCall.PyObject) at /Users/rob/.julia/dev/Symata/src/sympy.jl:419
=#  
  
  r = f(6, y0(x))
  Println(N(Transpose(r)[1], 4))
end
