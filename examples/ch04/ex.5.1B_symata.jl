using Symata

println()
@sym begin
  ClearAll(x, xi, yi, L0, L1, L2, L, Q)
  xi = [1, 3, 6]
  yi = [1, 5, 10]
  L0(x_) = Simplify( Expand( ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3])) ) )
  L1(x_) = Simplify( Expand( ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3])) ) )
  L2(x_) = Simplify( Expand( ((x-xi[1])*(x-xi[2]))/((xi[3]-xi[1])*(xi[3]-xi[2])) ) )
  L = [L0(x), L1(x), L2(x)]
  Q(x_) = Simplify( yi ⋅ L )
  SetJ(qs, ToString(Q(x)))
  Print("Q(x) = ", Q(x), "\n")
end

@sym Print("Q(4.5) = ", N(Q(4.5)), "\n");

@sym begin
  ClearAll(x, xi, yi, L, Q, den, num)
  xi = [1, 3, 6]
  yi = [1, 5, 10]
  For(i=1, i<=Length(xi), Increment(i), 
    [
      den = 1.0,
      num = 1.0,
      For(j=1, j<=Length(xi), Increment(j),
        [
          If(j != i, 
            [
              den *= (x - xi[j])
              num *= (xi[i] - xi[j])
            ]
          )
        ]
      ),
      L = If(i==1, [Simplify(Expand(den/num))], Join(L,[Simplify(Expand(den/num))]))
    ]
  )
  Q(x_) = Simplify( yi ⋅ L )
  SetJ(qs, ToString(Q(x)))
  Println("Q(x) = ", Q(x))
end

@sym Println("Q(4.5) = ", N(Q(4.5)))
