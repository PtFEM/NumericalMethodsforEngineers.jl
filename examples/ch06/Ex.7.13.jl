using Symata
using Base.Test

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
  C(a_) := -4a
  Ψ(x_) := x^2 - x
  Y(x_) := F(x) + C(a)*Ψ(x)
  Ydot(x_) = D(Y(x), x)
  Ydotdot(x_) = D(Ydot(x), x)
  R(x_) := Simplify(Expand(Ydotdot(x) - 3*x - 4*Y(x)))
  R(x_) = R(x) ./ (a => -C/4)
  SetJ(r, ToString(Simplify(R(x))))
end

@sym Print("ytilde(x) = ", Simplify(Expand(ytilde(x))))
println()
@sym Print("ytilde1(x) = ", Simplify(Expand(ytilde1(x))))
println()
@sym Println("R(x) = ", R(x))
println()

@eval rf(x) = $(parse(r))

@assert r == "4 + 2C + x + 4C*x - 8(x^2) - 4C*(x^2)"


