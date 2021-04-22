### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# ╔═╡ 9f979b0d-bf6f-4d6f-8def-5be5926711a5
using NumericalMethodsforEngineers

# ╔═╡ 32ddb193-70a2-4650-8c67-d5501461cf58
a = [2. -3. 1.; 1. -1. -2.; 3. 1. -1.]

# ╔═╡ 71646ca5-ade4-4e2d-b512-a64cc58c2448
b = [7., -2., 0.]

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

# ╔═╡ f0b8a692-8ad2-4ea9-9dad-9bd5d2cd612b
begin
	subfor!(lower, b)
	b
end

# ╔═╡ c29fed2a-ad84-4873-a550-9d65bd187c83
begin
	subbac!(upper, b)
	b
end

# ╔═╡ a30f098e-4ea3-4ec4-9fa3-373f8c17eb5c
md" ##### Solution vector:"

# ╔═╡ ce325e79-975d-493f-ab8f-93194934b5de
b

# ╔═╡ 3c89317c-1154-49bd-93ce-09c631014bbb
round.(a * c; digits=14) == b

# ╔═╡ Cell order:
# ╠═9f979b0d-bf6f-4d6f-8def-5be5926711a5
# ╠═32ddb193-70a2-4650-8c67-d5501461cf58
# ╠═71646ca5-ade4-4e2d-b512-a64cc58c2448
# ╟─9fa8c5ec-2c7a-49ac-9cf9-7bfdb7650d01
# ╠═bdc5eb8f-07a6-40df-b2ba-08903f896cb0
# ╠═44e675da-00a6-45c9-a47f-ac8195aa87f8
# ╟─25800554-5b76-48bc-96bc-0084a3a9177e
# ╠═af7dba26-b167-4d17-8d94-c8d4accb5d86
# ╠═f0b8a692-8ad2-4ea9-9dad-9bd5d2cd612b
# ╠═c29fed2a-ad84-4873-a550-9d65bd187c83
# ╟─a30f098e-4ea3-4ec4-9fa3-373f8c17eb5c
# ╠═ce325e79-975d-493f-ab8f-93194934b5de
# ╠═3c89317c-1154-49bd-93ce-09c631014bbb
