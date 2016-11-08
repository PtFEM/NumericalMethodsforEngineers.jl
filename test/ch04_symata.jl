using Symata, Plots
pyplot(size=(700,700))

println()
@Symata.ex begin
  xi = {1, 3, 6}
  yi = {1, 5, 10}
  L0(x_) := Simplify( Expand( ((x-xi[2])(x-xi[3]))/((xi[1]-xi[2])(xi[1]-xi[3])) ) )
  L1(x_) := Simplify( Expand( ((x-xi[1])(x-xi[3]))/((xi[2]-xi[1])(xi[2]-xi[3])) ) )
  L2(x_) := Simplify( Expand( ((x-xi[1])(x-xi[2]))/((xi[3]-xi[1])(xi[3]-xi[2])) ) )
  Q(x_) := Simplify(yi[1]L0(x) + yi[2]L1(x) + yi[3]*L2(x))
  SetJ(q, Q(x))
  SetJ(qs, ToString(Q(x)))
  Print("Q(x) = ", Q(x))
end

@Symata.ex Print("Q(4.5) = ", Q(4.5))

q3=parse(qs)
@eval f(x) = $(q3)

xint = 1:0.1:6 # FloatRange
p = plot(xint, f.(xint), line=(:path, 1), label="interpolated curve")