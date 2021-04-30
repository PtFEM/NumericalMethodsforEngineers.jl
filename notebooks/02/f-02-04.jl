### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 8bf5ade3-3bd9-425a-a9e1-3c1cf749e1c1
using Pkg, DrWatson

# ╔═╡ 8ea8eabf-b063-40d1-b83c-4ed24cea4ef6
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ 0fbfaf77-6389-4ac1-8c9e-ae80d339336a
md" ### j-02-04.jl"

# ╔═╡ d0fbe0f6-d839-48f7-a1e0-14c785e4625d
begin
	a = Float64[0 0 16; 0 4 5; 8 -4 22]
	b = Float64[4, 2, 5]
end

# ╔═╡ d89b625f-aa4c-4e39-af34-b8a1dfcdaa3b
md" ##### Cholesky factorization using banded storage"

# ╔═╡ 3b0869a9-ae43-42d8-b8e6-cb21107aeef3
md" ##### Banded Coefficient Matrix:"

# ╔═╡ ca47bbfe-a36f-4214-98a3-7b72c1041980
a

# ╔═╡ 7b594403-1a12-46eb-ba83-d0c8dfdef682
md" ##### Right Hand side:"

# ╔═╡ 00fa6a6f-297f-4fd7-8b2c-8c0f7a1571d5
b

# ╔═╡ 44d0ef6b-9a6a-4e40-8f96-fbc4f33e468e
cholin!(a)

# ╔═╡ 59b640c3-e769-42d2-aa48-a6a00a0bd0cf
md" ##### L in Band Form:"

# ╔═╡ 5f3f4836-8270-4ba2-9eab-1b83816b56f4
a

# ╔═╡ f072e05c-9086-4f9c-bd2f-fe2bd9d262ec
chobac!(a, b)

# ╔═╡ f9b02427-0328-42e5-831b-23c77194b56f
md" ##### Solution Vector:"

# ╔═╡ 4c504c4e-7804-44af-ba2e-8f4cb84956c7
b

# ╔═╡ 15bac539-5e4f-4baa-b001-799feaf0f9a5
md" ### End of j-02-04.jl"

# ╔═╡ Cell order:
# ╟─0fbfaf77-6389-4ac1-8c9e-ae80d339336a
# ╠═8bf5ade3-3bd9-425a-a9e1-3c1cf749e1c1
# ╠═8ea8eabf-b063-40d1-b83c-4ed24cea4ef6
# ╠═d0fbe0f6-d839-48f7-a1e0-14c785e4625d
# ╠═d89b625f-aa4c-4e39-af34-b8a1dfcdaa3b
# ╠═3b0869a9-ae43-42d8-b8e6-cb21107aeef3
# ╠═ca47bbfe-a36f-4214-98a3-7b72c1041980
# ╠═7b594403-1a12-46eb-ba83-d0c8dfdef682
# ╠═00fa6a6f-297f-4fd7-8b2c-8c0f7a1571d5
# ╠═44d0ef6b-9a6a-4e40-8f96-fbc4f33e468e
# ╠═59b640c3-e769-42d2-aa48-a6a00a0bd0cf
# ╠═5f3f4836-8270-4ba2-9eab-1b83816b56f4
# ╠═f072e05c-9086-4f9c-bd2f-fe2bd9d262ec
# ╠═f9b02427-0328-42e5-831b-23c77194b56f
# ╠═4c504c4e-7804-44af-ba2e-8f4cb84956c7
# ╟─15bac539-5e4f-4baa-b001-799feaf0f9a5
