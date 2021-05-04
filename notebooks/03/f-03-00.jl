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
md" ## f-03-00.jl"

# ╔═╡ 63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
begin
	@variables t z
	z = t^3 - t - 1
	L(z)
end

# ╔═╡ 4640e464-f75c-40fd-a26c-1f90363a6424
L(substitute(z, Dict([t => 2])))

# ╔═╡ 0cdd79ec-8e5c-4861-8b4d-88e1a8a426c8
f_j = build_function(z, [t], expression=Val{false});

# ╔═╡ c2d89d0e-95c2-4b25-8fff-68dca427c87d
f_j(2)

# ╔═╡ e626a4f9-97d5-4213-9f66-a17c24e37148
begin
	x = -2.0:0.01:2.0
	plot(x, f_j.(x))
end

# ╔═╡ d0d36a61-76f8-4017-9919-74bacb62e882
begin
	D = Differential(t) # symbolic representation of derivative
	L(D(z))
end

# ╔═╡ 08be6434-a03d-4167-abac-a54dec3ae240
begin
	fp_s = expand_derivatives(D(z))
	L(fp_s)
end

# ╔═╡ 4caaff50-acc2-438c-929b-68445d1b3d67
fp_j = build_function(fp_s, [t], expression=Val{false});

# ╔═╡ 5595773c-5510-48bf-94fd-216822419b2d
fp_j(2)

# ╔═╡ 7e58479c-48b5-4330-b312-1eb5f7c8796b
begin
	fj_s = Symbolics.jacobian([z], [t]; simplify=true)
	L(fj_s)
end

# ╔═╡ 57abf1cc-b6b5-4bb3-b80b-a3b8e41a8609
fj_j = build_function(fj_s[1], [t], expression=Val{false});

# ╔═╡ fe9b5719-017f-4f3b-b78f-16680a155e44
fj_j(2)

# ╔═╡ 1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
Roots.newton(f_j, fp_j, 8)        # 8.613169456441398

# ╔═╡ 26cd9127-ae9e-4f09-97e4-d10f514e2164
md" ## End of f-03-00.jl"

# ╔═╡ Cell order:
# ╟─c34bdc36-5013-4096-9cb2-581ad9e02239
# ╠═c930a0fa-4ef8-4963-b4b2-0d576ecdde7e
# ╠═919b41e5-7e43-45e0-8676-373b77ac6208
# ╠═63d01a6a-e8ae-4a94-9ecf-ad5768ff9ab0
# ╠═4640e464-f75c-40fd-a26c-1f90363a6424
# ╠═0cdd79ec-8e5c-4861-8b4d-88e1a8a426c8
# ╠═c2d89d0e-95c2-4b25-8fff-68dca427c87d
# ╠═e626a4f9-97d5-4213-9f66-a17c24e37148
# ╠═d0d36a61-76f8-4017-9919-74bacb62e882
# ╠═08be6434-a03d-4167-abac-a54dec3ae240
# ╠═4caaff50-acc2-438c-929b-68445d1b3d67
# ╠═5595773c-5510-48bf-94fd-216822419b2d
# ╠═7e58479c-48b5-4330-b312-1eb5f7c8796b
# ╠═57abf1cc-b6b5-4bb3-b80b-a3b8e41a8609
# ╠═fe9b5719-017f-4f3b-b78f-16680a155e44
# ╠═1dd78a44-b910-4bb2-8af0-9a1ab3ee4a51
# ╟─26cd9127-ae9e-4f09-97e4-d10f514e2164
