using NMfE
using Test

@sym begin
  ClearAll(x, y, sol)
  sol1 = DSolve(D(y(t),t) - y(t) + Sin(t), y(t))
  Print("DSolve(D(y(t),t) - y(t) + Sin(t), y(t)) = $(sol1)\n")
  #sol2 = Roots(D(x^4+1,x,2),x)
  #Println(sol2)
end

