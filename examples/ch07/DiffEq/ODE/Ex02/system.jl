using DifferentialEquations, Plots

A = [
  1. 0 0 -5
  4 -2 4 -3
  -4 0 0 1
  5 -2 2 3
]
u0 = rand(4, 2)
tspan = (0.0, 1.0)
f(t,u) = A*u

prob = ODEProblem(f, u0, tspan)

sol = solve(prob)
plot(sol)
