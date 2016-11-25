using NMfE

setsymata(:xin, List(0.0,0.5,1.0))
setsymata(:yin, List(0.0,0.6,1.0))

f = @sym Compile(Evaluate(LagrangePolynomial(xin,yin)));

println("\nf(0.75) = ", f(0.75))

function lagrangefunc(x1,y1)
    setsymata(:xin, List(x1...))
    setsymata(:yin, List(y1...))
    symeval(parse("Compile(Evaluate(LagrangePolynomial(xin,yin)))"))
end

f1 = lagrangefunc([0.0,0.5,1.0], [0.0,0.6,1.0])

println("f1(0.75) = ", f1(0.75))

xl1 = [0, 1/3, 2/3, 1]
yl1 = [0, 0.3, 0.6, 1]
f2 = lagrangefunc(xl1, yl1)

println("f2(0.75) = ", f1(0.75))
