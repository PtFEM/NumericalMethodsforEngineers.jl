### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 40650588-5eb8-450d-824b-ac509bf7894f
using Pkg, DrWatson

# ╔═╡ 9f979b0d-bf6f-4d6f-8def-5be5926711a5
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers
	using Test
end

# ╔═╡ fadae5bc-da5d-49c2-9e1b-fa239bf6577b
md" ### f-02-02.jl"

# ╔═╡ 32ddb193-70a2-4650-8c67-d5501461cf58
begin
	a = [2. -3. 1.; 1. -1. -2.; 3. 1. -1.]
	b = [7., -2., 0.]
end

# ╔═╡ 9fa8c5ec-2c7a-49ac-9cf9-7bfdb7650d01
md" ##### Julia version:"

# ╔═╡ bdc5eb8f-07a6-40df-b2ba-08903f896cb0
c = a\b

# ╔═╡ 44e675da-00a6-45c9-a47f-ac8195aa87f8
f = lu(a)

# ╔═╡ 25800554-5b76-48bc-96bc-0084a3a9177e
md" ##### Fortran version:"

# ╔═╡ af7dba26-b167-4d17-8d94-c8d4accb5d86
lower, upper = lufac(a)

# ╔═╡ 60b977ad-8e1a-49f1-b0d1-51c4f61037dc
subfor(lower, b)

# ╔═╡ f0b8a692-8ad2-4ea9-9dad-9bd5d2cd612b
begin
	subfor!(lower, b)
	b
end

# ╔═╡ 96f0435c-9b8d-48d5-97eb-1c434208c184
subbac(upper, b)

# ╔═╡ c29fed2a-ad84-4873-a550-9d65bd187c83
begin
	subbac!(upper, b)
	b
end

# ╔═╡ a30f098e-4ea3-4ec4-9fa3-373f8c17eb5c
md" ##### Solution vector:"

# ╔═╡ 3c89317c-1154-49bd-93ce-09c631014bbb
round.(a * c; digits=14) == b

# ╔═╡ f9921b74-c79a-4e2a-8375-03e983462875
md" ### End of f-02-02.jl"

# ╔═╡ Cell order:
# ╟─fadae5bc-da5d-49c2-9e1b-fa239bf6577b
# ╠═40650588-5eb8-450d-824b-ac509bf7894f
# ╠═9f979b0d-bf6f-4d6f-8def-5be5926711a5
# ╠═32ddb193-70a2-4650-8c67-d5501461cf58
# ╟─9fa8c5ec-2c7a-49ac-9cf9-7bfdb7650d01
# ╠═bdc5eb8f-07a6-40df-b2ba-08903f896cb0
# ╠═44e675da-00a6-45c9-a47f-ac8195aa87f8
# ╟─25800554-5b76-48bc-96bc-0084a3a9177e
# ╠═af7dba26-b167-4d17-8d94-c8d4accb5d86
# ╠═60b977ad-8e1a-49f1-b0d1-51c4f61037dc
# ╠═f0b8a692-8ad2-4ea9-9dad-9bd5d2cd612b
# ╟─a30f098e-4ea3-4ec4-9fa3-373f8c17eb5c
# ╠═96f0435c-9b8d-48d5-97eb-1c434208c184
# ╠═c29fed2a-ad84-4873-a550-9d65bd187c83
# ╠═3c89317c-1154-49bd-93ce-09c631014bbb
# ╟─f9921b74-c79a-4e2a-8375-03e983462875
