using Symata, NMfE, DataFrames, Plots

println()
@Symata.ex begin
  xi = {1, 3, 6};
  yi = {1, 5, 10};
  L0(x_) := Simplify( Expand( ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3])) ) );
  L1(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3])) ) );
  L2(x_) := Simplify( Expand( ((x-xi[1])*(x-xi[2]))/((xi[3]-xi[1])*(xi[3]-xi[2])) ) );
  Q(x_) := Simplify(yi[1]*L0(x) + yi[2]*L1(x) + yi[3]*L2(x));
  SetJ(q, Q(x))
  SetJ(qs, ToString(Q(x)))
  Print("Q(x) = ", Q(x), "\n")
end;

@Symata.ex Print("Q(4.5) = ", Q(4.5), "\n");
println("\n")

q3=parse(qs)
@eval f(x) = $(q3)

ProjDir = dirname(@__FILE__)
cd(ProjDir) do
  
  pyplot(size=(700,700))
  
  x = [1.0, 3.0, 6.0]
  y = [1.0, 5.0, 10.0]
  xi = [2.0, 4.5]
  (dfin, dfxi) = lagrangianpolynomial(length(x), x, y, xi)
  
  dfin |> display
  println()
  
  dfxi |> display
  println()
  
  xint = 1:0.1:6
  p = plot(xint, f.(xint), line=(:path, 1), label="interpolated curve")
  scatter!(p, dfin[:x], dfin[:y], marker=(:circle, 4), label="input points", color=:blue)
  scatter!(p, dfxi[:xi], dfxi[:yi], marker=(:star, 8), color=:red, label="interpolated points")
  
  plot(p)
  savefig("ex.5.1.png")
  #gui()
  
end