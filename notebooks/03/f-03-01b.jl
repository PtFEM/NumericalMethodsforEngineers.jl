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

# ╔═╡ 63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
begin
	@variables t z
	z = 4t^5 + 3t^3
	D = Differential(t)
	L(D(z)) # symbolic representation of derivative(t*t^4 + 15t^4, t)
end

# ╔═╡ 35e3cc9c-5510-4e26-a885-8ee934d68c63
L(D(D(z)))

# ╔═╡ 2708dfb1-09dd-458c-8b5f-2e2ec3d800c4
L(expand_derivatives(D(z)))

# ╔═╡ 2b8c3ddf-cee0-47cb-9fa9-b465e886a55d
L(expand_derivatives(D(D(z))))

# ╔═╡ bf26f87a-7dcc-4f16-869d-55ae9b16b7e0
L(expand_derivatives(D(D(D(z)))))

# ╔═╡ 0cdd79ec-8e5c-4861-8b4d-88e1a8a426c8
f_j = build_function(z, [t], expression=Val{false});

# ╔═╡ 0c5d2834-8689-4e7f-82d6-6ed4fbf3808f
f_j(2)

# ╔═╡ 4640e464-f75c-40fd-a26c-1f90363a6424
L(substitute(z, Dict([t => 2])))

# ╔═╡ 66da39bb-e6a2-4e4e-b665-066215d56272
fp_j = build_function(D(z), [t], expression=Val{false});

# ╔═╡ 0e12f883-21a0-4532-83d1-fa47f7d97c97
L(substitute(D(z), Dict([t => 2])))

# ╔═╡ 7d6bf6b4-ba81-4a0f-937b-db304a594bb4
fp_j(2)

# ╔═╡ 1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
Roots.newton(f_j[1], fp_j[1], 8)        # 8.613169456441398

# ╔═╡ 26cd9127-ae9e-4f09-97e4-d10f514e2164
md" ## End of f-03-01.jl"

# ╔═╡ Cell order:
# ╟─c34bdc36-5013-4096-9cb2-581ad9e02239
# ╠═c930a0fa-4ef8-4963-b4b2-0d576ecdde7e
# ╠═919b41e5-7e43-45e0-8676-373b77ac6208
# ╠═63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
# ╠═35e3cc9c-5510-4e26-a885-8ee934d68c63
# ╠═2708dfb1-09dd-458c-8b5f-2e2ec3d800c4
# ╠═2b8c3ddf-cee0-47cb-9fa9-b465e886a55d
# ╠═bf26f87a-7dcc-4f16-869d-55ae9b16b7e0
# ╠═0cdd79ec-8e5c-4861-8b4d-88e1a8a426c8
# ╠═0c5d2834-8689-4e7f-82d6-6ed4fbf3808f
# ╠═4640e464-f75c-40fd-a26c-1f90363a6424
# ╠═66da39bb-e6a2-4e4e-b665-066215d56272
# ╠═0e12f883-21a0-4532-83d1-fa47f7d97c97
# ╠═7d6bf6b4-ba81-4a0f-937b-db304a594bb4
# ╠═1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
# ╟─26cd9127-ae9e-4f09-97e4-d10f514e2164
