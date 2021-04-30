using Roots, Plots

f(x) = x^3 - x - 1
@show fzeros(f, -10, 10)
println()

y = -10:0.1:10
plot(y, f.(y))

@show fzero(f, [-2,2])
println()

@show fzero(f, 1.0)
println()

f(x) = exp(x) - x^4
fp(x) = exp(x) - 4x^3
fpp(x) = exp(x) - 12x^2

Roots.newton(f, fp, 8)        # 8.613169456441398

halley(f, fp, fpp, 8)

secant_method(f, [8, 8.5])
