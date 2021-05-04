### A Pluto.jl notebook ###
# v0.14.5

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

# ╔═╡ 0b1514c5-eded-4f60-ac31-6f27a4deff1d
begin
	@variables f x
	f = exp(x) - x^4
	L(f)
end

# ╔═╡ 7c4288f0-38d9-4c39-b6b1-789aba5465b6
f_j = build_function(f, [x], expression=Val{false});

# ╔═╡ c7c87623-9c41-4a68-8673-47a71c67f083
begin
	y = -10.0:0.1:10.0
	plot(y, f_j.(y), leg=false)
	hline!([0.0])
	vline!([fzeros(f_j, [-1, 2])])
end

# ╔═╡ 2708dfb1-09dd-458c-8b5f-2e2ec3d800c4
begin
	D = Differential(x)
	fp_s = expand_derivatives(D(f))
	fp_j = build_function(fp_s, [x], expression=Val{false})
	L(fp_s)
end

# ╔═╡ 1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
Roots.newton(f_j, fp_j, 8)        # 8.6131694564414

# ╔═╡ 8054c3fd-3ecb-4c2a-b606-7fd518d750a3
begin
	fpp_s = expand_derivatives(D(D(f)))
	fpp_j = build_function(fpp_s, [x], expression=Val{false})
	L(fpp_s)
end

# ╔═╡ 7e2f4bd6-4f9a-4a72-8e70-e5fc56f806ee
halley(f_j, fp_j, fpp_j, 8)

# ╔═╡ 3e022154-6933-4ba7-8cf9-2d48d3cbb27f
secant_method(f_j, [8, 8.5])

# ╔═╡ 26cd9127-ae9e-4f09-97e4-d10f514e2164
md" ## End of f-03-01.jl"

# ╔═╡ Cell order:
# ╟─c34bdc36-5013-4096-9cb2-581ad9e02239
# ╠═c930a0fa-4ef8-4963-b4b2-0d576ecdde7e
# ╠═919b41e5-7e43-45e0-8676-373b77ac6208
# ╠═0b1514c5-eded-4f60-ac31-6f27a4deff1d
# ╠═7c4288f0-38d9-4c39-b6b1-789aba5465b6
# ╠═c7c87623-9c41-4a68-8673-47a71c67f083
# ╠═2708dfb1-09dd-458c-8b5f-2e2ec3d800c4
# ╠═1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
# ╠═8054c3fd-3ecb-4c2a-b606-7fd518d750a3
# ╠═7e2f4bd6-4f9a-4a72-8e70-e5fc56f806ee
# ╠═3e022154-6933-4ba7-8cf9-2d48d3cbb27f
# ╟─26cd9127-ae9e-4f09-97e4-d10f514e2164
