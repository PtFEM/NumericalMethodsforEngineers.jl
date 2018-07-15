using Sundials

## f2 routine. Compute function f(x,y).

function f(x, y, ydot)
    ydot[1] = y[2]
    ydot[2] = -2.0*y[2]^2 / y[1]
end
x = range(0.0, stop=1.0, length=11)
@show Sundials.cvode(f, [1.0, 1.0], x)
