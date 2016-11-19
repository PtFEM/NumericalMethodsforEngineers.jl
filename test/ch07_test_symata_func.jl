using NMfE
using Base.Test

@sym begin
  testfunc(xi_, yi_) := Module([res],
    begin
      res = xi * yi
      SetJ(r, ToString(res))
    end
  )
end

@sym SetJ(r1, testfunc([0, 1//2, 1], [0, a, 1]))
@eval tfr1(a) = $(parse(r1))
println("tfr1(3) = $(tfr1(3))\n")   # => Out(4) = tfr1(3) = [0.0,1.5,1.0]

xi = [0, 0.5, 1]
yi = [0, 6.0, 1]

@sym SetJ(r2, testfunc(Unpack(JVar(xi)), Unpack(JVar(yi))))
@eval tfr2(a) = $(parse(r2))
println("tfr2(6) = $(tfr2(6))\n")   # => Out(5) = tfr2(6) = [0.0,3.0,1.0]

yi1 = [0, :a, 1]    # a needs to be a symbol

@sym SetJ(r3, testfunc(Unpack(JVar(xi)), Unpack(JVar(yi1))))
@eval tfr3(a) = $(parse(r3))
println("tfr3(9) = $(tfr3(9))\n")   # => Out(6) = tfr3(9) = [0.0,4.5,1.0]

function tf1(xi, yi)
  @sym SetJ(r4, testfunc(Unpack(JVar(xi)), Unpack(JVar(yi))))
  @eval f1(a) = $(parse(r4))
  f1
end

# Not correct, will use global value of xi and yi

f1 = tf1(xi, yi1)
println("f1(12) = $(f1(12))\n")   # => Out(7) = f1(12) = [0.0,3.0,1.0]
                                  
# All attempts below will fail.

function tf2(xi, yi)
  @sym SetJ(r5, testfunc(J(copy(xi)), J(copy(yi))))
  @eval f2(a) = $(parse(r5))
  f2
end

f2 = tf2(xi, yi1)
println("f2(12) = $(f2(12))\n")   # => Out(7) = f2(12) = [0.0,3.0,1.0]
                                  
function tf3(xi2, yi2)
  @sym SetJ(r6, testfunc(Unpack(JVar(xi2)), Unpack(JVar(yi2))))
  @eval f3(a) = $(parse(r6))
  f3
end

println("\nNow try a non-global variable:\n")

f3 = tf3(xi, yi1)
println("f3(12) = $(f3(12))\n")   # => Out(8) = f3(12) = [0.0,6.0,1.0]
