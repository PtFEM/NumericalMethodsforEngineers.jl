using Symata, Plots
pyplot(size=(700,700))

println()
@sym begin
  xi = [1, 3, 6]
  yi = [1, 5, 10]
  L0(x_) := Simplify( Expand( ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3])) ) )
  L1(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3])) ) )
  L2(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[2]))/((xi[3]-xi[1])*(xi[3]-xi[2])) ) )
  Q(x_) := Simplify(yi[1]*L0(x) + yi[2]*L1(x) + yi[3]*L2(x));
  SetJ(q, ToString(Q(x)))
end

@sym Print("Q(x) = ", Q(x))
println()
@sym Print("Q(4.5) = ", Q(4.5))

println()
#q = @sym ToString(Q(x));
@eval f1(x) = $(parse(q))

xint = 1:0.1:6 # FloatRange
p = plot(xint, f1.(xint), line=(:path, 1), label="interpolated curve")
gui()