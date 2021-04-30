### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ c930a0fa-4ef8-4963-b4b2-0d576ecdde7e
using Pkg, DrWatson

# ╔═╡ 919b41e5-7e43-45e0-8676-373b77ac6208
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Roots, Plots
	using Symbolics, SymbolicUtils, Latexify, LaTeXStrings, ModelingToolkit
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ c34bdc36-5013-4096-9cb2-581ad9e02239
md" ## f-03-01.jl"

# ╔═╡ 90be07f8-6662-4588-b90e-a414016bc8cb
f1(x) = x^3 - x - 1

# ╔═╡ cb915563-8236-476f-b976-17a8d86c634d
fzeros(f1, -10, 10)

# ╔═╡ c0288379-dbbc-429a-a592-f456afd1e1f4
y = -1:0.01:3.0;

# ╔═╡ c7c87623-9c41-4a68-8673-47a71c67f083
begin
	plot(y, f1.(y), leg=false)
	hline!([0.0])
	vline!([fzeros(f1, [-1, 2])])
end

# ╔═╡ 0b1514c5-eded-4f60-ac31-6f27a4deff1d
begin
	@variables f x
	@syms f(x) x::Real
	f = exp(x) - x^4
	D = Differential(f)
end;

# ╔═╡ 68d5fcdc-1606-40a1-a9fc-2babb03e51be
df2(x) = expand_derivatives(D(f2))

# ╔═╡ ff0bd3ee-9790-47ae-a46c-7c4241af62a3
df2(x)

# ╔═╡ 5e74fb35-e823-4eef-8ef1-e20980d4e780
LATEXIFY(x) = md"$(latexify(x))"

# ╔═╡ cb186aab-c595-4280-aca5-3f41412047a1
LATEXIFY(s::AbstractString, x) = md"$(s) $(latexify(x))"

# ╔═╡ ddf09eec-1600-4755-928d-e23b961c340d
L = LATEXIFY

# ╔═╡ 879815f9-8801-4698-80cf-c24b800d310f
L(D(f(x)))

# ╔═╡ 63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
begin
	@variables z
	z = t*t^4 + 3t^5
	D(z) # symbolic representation of derivative(t*t^4 + 15t^4, t)
	L(expand_derivatives(D(z))) # 10t^4
end


# ╔═╡ 66da39bb-e6a2-4e4e-b665-066215d56272
fp(x) = exp(x) - 4x^3

# ╔═╡ 7d6bf6b4-ba81-4a0f-937b-db304a594bb4
fpp(x) = exp(x) - 12x^2

# ╔═╡ 1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
Roots.newton(f2, fp, 8)        # 8.613169456441398

# ╔═╡ 7e2f4bd6-4f9a-4a72-8e70-e5fc56f806ee
halley(f2, fp, fpp, 8)

# ╔═╡ 3e022154-6933-4ba7-8cf9-2d48d3cbb27f
secant_method(f2, [8, 8.5])

# ╔═╡ 26cd9127-ae9e-4f09-97e4-d10f514e2164
md" ## End of f-03-01.jl"

# ╔═╡ Cell order:
# ╟─c34bdc36-5013-4096-9cb2-581ad9e02239
# ╠═c930a0fa-4ef8-4963-b4b2-0d576ecdde7e
# ╠═919b41e5-7e43-45e0-8676-373b77ac6208
# ╠═90be07f8-6662-4588-b90e-a414016bc8cb
# ╠═cb915563-8236-476f-b976-17a8d86c634d
# ╠═c0288379-dbbc-429a-a592-f456afd1e1f4
# ╠═c7c87623-9c41-4a68-8673-47a71c67f083
# ╠═0b1514c5-eded-4f60-ac31-6f27a4deff1d
# ╠═879815f9-8801-4698-80cf-c24b800d310f
# ╠═68d5fcdc-1606-40a1-a9fc-2babb03e51be
# ╠═ff0bd3ee-9790-47ae-a46c-7c4241af62a3
# ╠═5e74fb35-e823-4eef-8ef1-e20980d4e780
# ╠═cb186aab-c595-4280-aca5-3f41412047a1
# ╠═ddf09eec-1600-4755-928d-e23b961c340d
# ╠═63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
# ╠═66da39bb-e6a2-4e4e-b665-066215d56272
# ╠═7d6bf6b4-ba81-4a0f-937b-db304a594bb4
# ╠═1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
# ╠═7e2f4bd6-4f9a-4a72-8e70-e5fc56f806ee
# ╠═3e022154-6933-4ba7-8cf9-2d48d3cbb27f
# ╟─26cd9127-ae9e-4f09-97e4-d10f514e2164
