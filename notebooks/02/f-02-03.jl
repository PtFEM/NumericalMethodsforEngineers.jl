### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 5c00529c-54cb-4cae-9154-5bad2818314d
using Pkg, DrWatson

# ╔═╡ 63def520-35a3-4bdf-a333-a8f86caba00f
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers
	using Test
end

# ╔═╡ 9c686554-5b34-4929-ae8a-309c33a0cc48
md" ### f-02-03.jl"

# ╔═╡ 2b6b8cd8-f5d1-4ee5-abaa-1eb25369b633
begin
	a = Float64[16 4 8;4 5 -4;8 -4 22]
	b = Float64[4, 2, 5]
	d = zeros(3)
end;

# ╔═╡ 634ecc96-cf0d-44ce-b1d3-10c99e3684d5
begin
	c = a \ b
end

# ╔═╡ b893aebf-2b1c-4e30-a47c-9095f5a8fee8
at, dt = ldlt(a, d)

# ╔═╡ 7ac63cd7-245f-45e3-ab91-0b4ed6fde3df
dt

# ╔═╡ c85a1d6c-8fa6-4992-ac93-ef28eea94828
bt = ldlfor(at, b)

# ╔═╡ 87de1def-6f4a-43c0-b793-0e9562186445
for i in 1:size(a, 1)
  at[i, :] = at[i, :] / dt[i]
end

# ╔═╡ bd666706-7a4d-4330-9061-481fe02110d0
at

# ╔═╡ 119e89db-6e66-413e-9341-063ce1280235
btt = subbac(at, bt)

# ╔═╡ 25cca764-5472-4354-9a86-6bccfe4547c9
@test btt == c

# ╔═╡ a7de228a-f876-485a-9c44-09df62672f41
md" ### End of j-02-03.jl"

# ╔═╡ Cell order:
# ╟─9c686554-5b34-4929-ae8a-309c33a0cc48
# ╠═5c00529c-54cb-4cae-9154-5bad2818314d
# ╠═63def520-35a3-4bdf-a333-a8f86caba00f
# ╠═2b6b8cd8-f5d1-4ee5-abaa-1eb25369b633
# ╠═634ecc96-cf0d-44ce-b1d3-10c99e3684d5
# ╠═b893aebf-2b1c-4e30-a47c-9095f5a8fee8
# ╠═7ac63cd7-245f-45e3-ab91-0b4ed6fde3df
# ╠═c85a1d6c-8fa6-4992-ac93-ef28eea94828
# ╠═87de1def-6f4a-43c0-b793-0e9562186445
# ╠═bd666706-7a4d-4330-9061-481fe02110d0
# ╠═119e89db-6e66-413e-9341-063ce1280235
# ╠═25cca764-5472-4354-9a86-6bccfe4547c9
# ╟─a7de228a-f876-485a-9c44-09df62672f41
