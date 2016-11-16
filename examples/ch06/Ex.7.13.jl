using Symata

println()
@sym begin
  xi = [0, 1//2, 1]
  yi = [0, a, 1]
  L0(x_) := Simplify( Expand( ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3])) ) )
  L1(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3])) ) )
  L2(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[2]))/((xi[3]-xi[1])*(xi[3]-xi[2])) ) )
  ytilde(x_) := Simplify(yi[1]*L0(x) + yi[2]*L1(x) + yi[3]*L2(x));
  #
  # Can be formulated as ytile(x) = F(x) + C1(a) * Ψ(x)
  #
  F(x_) := 2*x^2 - x
  Cone(a_) := -4*a
  Ψ(x_) := x^2 - x
  Y(x_) := F(x)+Cone(a)*Ψ(x)
  Ydot(x_) = D(Y(x), x)
  Ydotdot(x_) = D(Ydot(x), x)
  R(x_) := Ydotdot(x) - 3*x - 4*Y(x) ./ -4a => C1
  SetJ(r, ToString(Simplify(R(x))))
end

@sym Print("ytilde(x) = ", Simplify(Expand(ytilde(x))))
println()
@sym ytilde1(x_) = Simplify(x^2*(2-4*a) - x*(1-4*a))
@sym Print("ytilde1(x) = ", Simplify(Expand(ytilde1(x))))
println()

#@eval rf(x) = $(parse(r))

