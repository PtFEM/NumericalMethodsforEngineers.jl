using DifferentialEquations, Plots

𝞪 = 2.0
u0 = 1/2
f(t,u) = -𝞪*sin(u)
tspan = (0.0, 12.0)

prob = ODEProblem(f, u0, tspan)

sol1 = solve(prob, Euler(), dt=3.0)
sol2 = solve(prob, Euler(), dt=0.5)
sol3 = solve(prob, Euler(), dt=0.1)

#[t+2u for (t,u) in zip(sol1.t,sol.u)]

x = 0.0:0.05:12.0
p = plot(x, sol1(x))
plot!(p, x, sol2(x))
plot!(p, x, sol3(x))

gui()