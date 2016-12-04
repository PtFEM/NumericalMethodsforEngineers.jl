using DifferentialEquations, Plots

𝞪 = 1
u0 = 1/2
f(t,u) = 𝞪*u
tspan = (0.0, 1.0)

prob = ODEProblem(f, u0, tspan)

sol1 = solve(prob, Euler(), dt=1/2^1)
sol2 = solve(prob, Euler(), dt=1/2^2)
sol3 = solve(prob, Euler(), dt=1/2^4)

#[t+2u for (t,u) in zip(sol1.t,sol.u)]

x = 0.0:0.05:1.0
p = plot(x, sol1(x))
plot!(p, x, sol2(x))
plot!(p, x, sol3(x))

gui()