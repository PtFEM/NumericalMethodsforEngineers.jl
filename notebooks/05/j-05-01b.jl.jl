### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 2c554897-e486-418f-9cd4-a3bb3f00fc31
using Pkg, DrWatson

# ╔═╡ 19cc5ec6-f7cb-4736-98c3-498d91eb2414
begin
	@quickactivate "NumericalMethodsforEngineers"
	using BarycentricInterpolation
end

# ╔═╡ 53285b2c-3704-4adc-9bdd-9dea619b5140
md" ## BarycentricInterpolation.jl"

# ╔═╡ 74272021-5f45-4161-bea4-8386697de280
begin
	x = [1.0, 3.0, 6.0, 5.0]
	y = [1.0, 5.0, 10.0, 9.0]
	xi = [2.0, 4.5]
end

# ╔═╡ 587d934e-161e-403c-831b-a61f313f5ecc
indxs = sortperm(x)

# ╔═╡ 7ba7dd56-4ee9-4c5c-97a8-5f99a9ba507e
p = ArbitraryPolynomial(x[indxs]);

# ╔═╡ 880d1ae8-5a5a-463a-8e35-a73bdc40208a
interpolate(p, y[indxs], xi)

# ╔═╡ c2fcf437-bd86-4b24-8c77-29702cf5373d
md" ## End of BarycentricInterpolation.jl"

# ╔═╡ Cell order:
# ╟─53285b2c-3704-4adc-9bdd-9dea619b5140
# ╠═2c554897-e486-418f-9cd4-a3bb3f00fc31
# ╠═19cc5ec6-f7cb-4736-98c3-498d91eb2414
# ╠═74272021-5f45-4161-bea4-8386697de280
# ╠═587d934e-161e-403c-831b-a61f313f5ecc
# ╠═7ba7dd56-4ee9-4c5c-97a8-5f99a9ba507e
# ╠═880d1ae8-5a5a-463a-8e35-a73bdc40208a
# ╟─c2fcf437-bd86-4b24-8c77-29702cf5373d
