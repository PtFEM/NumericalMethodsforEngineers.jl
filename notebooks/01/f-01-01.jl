### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 7dfe963f-3601-4515-a636-4930816a4e6c
using Pkg, DrWatson

# ╔═╡ 73d28c7f-8426-4c5a-b166-23dcac5c16ce
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers
	using Test
end

# ╔═╡ ac233fe5-a00f-412f-ad4a-a1d39ee20517
md" ### f-01-01.jl"

# ╔═╡ d82838e5-1591-41d9-b5e0-0c49f48d7814
begin
	a = [10. 5. 6.; 5. 20. 4.; 6. 4. 30.]
	x0 = [1., 1., 1.]

	tol = 1.0e-5
	limit = 100
end;

# ╔═╡ 570d9517-14d8-4d40-8e29-039269a5e37d
(iters, eigval, eigvec) = nmex(a, x0; tol=tol, limit=limit, show=8)

# ╔═╡ 1614c806-1bdc-40bb-ae8c-e02d29d128fe
jeigval, jeigvec = eigen(a)

# ╔═╡ 90c91c6a-1b9b-4d34-858a-7535b1090fee
@test round(maximum(jeigval), digits=3) == round(eigval, digits=3)

# ╔═╡ 47256683-e6b6-4fae-916c-f80ba57a232f
md" ### End of f-01-01.jl"

# ╔═╡ Cell order:
# ╟─ac233fe5-a00f-412f-ad4a-a1d39ee20517
# ╠═7dfe963f-3601-4515-a636-4930816a4e6c
# ╠═73d28c7f-8426-4c5a-b166-23dcac5c16ce
# ╠═d82838e5-1591-41d9-b5e0-0c49f48d7814
# ╠═570d9517-14d8-4d40-8e29-039269a5e37d
# ╠═1614c806-1bdc-40bb-ae8c-e02d29d128fe
# ╠═90c91c6a-1b9b-4d34-858a-7535b1090fee
# ╟─47256683-e6b6-4fae-916c-f80ba57a232f
