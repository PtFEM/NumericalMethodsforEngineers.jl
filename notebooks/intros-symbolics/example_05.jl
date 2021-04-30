### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ f0a762cf-fd95-4350-8078-bab36104831c
using Pkg, DrWatson

# ╔═╡ 41d572f9-8e02-4751-a3a3-3a93f55eb418
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Symbolics, SymbolicUtils, ModelingToolkit, LaTeXStrings
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ b2c90da5-9f4b-4580-a4e4-7802fb8e827d
function lotka_volterra!(du1, u1, p1, t1)
  x, y = u1
  α, β, δ, γ = p1
  du1[1] = dx = α*x - β*x*y
  du1[2] = dy = -δ*y + γ*x*y
end

# ╔═╡ 8f0d514c-8d3e-4810-97ac-264317186c6c
begin
	@variables t du[1:2] u[1:2] p[1:4]
	lotka_volterra!(du, u, p, t)
	du = Num[
		p[1] * u[1] - (p[2] * u[1]) * u[2],
		-p[3] * u[2] + (p[4] * u[1]) * u[2]
	]
end;

# ╔═╡ f3513df2-c301-4581-ace2-b250eec62b72
D = Differential(t);

# ╔═╡ 7ff6f706-c7a7-4cbe-a8f9-12b1460e3bb3
eqs = @. D(u) ~ du

# ╔═╡ 1cdf03b5-fbac-44ff-b128-0771d9f9e1f7
build_function(eqs, u, p, t, target=Symbolics.CTarget());

# ╔═╡ 3a58c1e6-2bf7-494d-bae8-836d2482aba7
f = build_function(eqs, u, p, t, target=Symbolics.CTarget(),
	expression=Val{false});

# ╔═╡ 8c4074bc-8d24-4d4b-88f6-f753542abd05
du1 = rand(2)

# ╔═╡ dacbad6c-5fe5-4959-9ebe-b29a93f4237c
u1 = rand(2)

# ╔═╡ 183abe62-0e93-4ea5-9ff4-13afc6236e03
p1 = rand(4)

# ╔═╡ 79799876-9444-44d5-939b-4b6149add315
t1 = rand()

# ╔═╡ 99e6e2ca-0a7a-4cf9-b587-312486e1fc45
f(du1, u1, p1, t1)

# ╔═╡ 4e19a394-cd7b-41ee-91c5-357c7f0bf117
du1

# ╔═╡ aad3f488-7185-473c-948a-ff155bc81c2f
du3 = zeros(2)

# ╔═╡ f25c0f0f-6c38-4bf4-b18e-c1f6dd129d86
lotka_volterra!(du3, u1, p1, t1)

# ╔═╡ 3fde3bc3-94cd-4bb7-953d-1126d498d2ef
du3

# ╔═╡ c0b776a6-2e37-4b08-a9a7-e66576e10254
@test du1 == du3

# ╔═╡ Cell order:
# ╠═f0a762cf-fd95-4350-8078-bab36104831c
# ╠═41d572f9-8e02-4751-a3a3-3a93f55eb418
# ╠═b2c90da5-9f4b-4580-a4e4-7802fb8e827d
# ╠═8f0d514c-8d3e-4810-97ac-264317186c6c
# ╠═f3513df2-c301-4581-ace2-b250eec62b72
# ╠═7ff6f706-c7a7-4cbe-a8f9-12b1460e3bb3
# ╠═1cdf03b5-fbac-44ff-b128-0771d9f9e1f7
# ╠═3a58c1e6-2bf7-494d-bae8-836d2482aba7
# ╠═8c4074bc-8d24-4d4b-88f6-f753542abd05
# ╠═dacbad6c-5fe5-4959-9ebe-b29a93f4237c
# ╠═183abe62-0e93-4ea5-9ff4-13afc6236e03
# ╠═79799876-9444-44d5-939b-4b6149add315
# ╠═99e6e2ca-0a7a-4cf9-b587-312486e1fc45
# ╠═4e19a394-cd7b-41ee-91c5-357c7f0bf117
# ╠═aad3f488-7185-473c-948a-ff155bc81c2f
# ╠═f25c0f0f-6c38-4bf4-b18e-c1f6dd129d86
# ╠═3fde3bc3-94cd-4bb7-953d-1126d498d2ef
# ╠═c0b776a6-2e37-4b08-a9a7-e66576e10254
