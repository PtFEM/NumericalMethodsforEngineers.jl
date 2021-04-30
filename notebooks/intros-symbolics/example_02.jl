### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ dd4498f1-53c4-48e7-b651-70d48ae91379
using Pkg, DrWatson

# ╔═╡ ac129262-c0a8-47d2-af1a-1e1268096451
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Symbolics, SymbolicUtils, Latexify
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ 33c7c64a-7a2c-4beb-9150-74f6c8444f60
begin
	@variables t α σ(..) β[1:2]
end;

# ╔═╡ 39a8c494-5608-470a-89f6-9f4a68a9a527
@variables x y;

# ╔═╡ d38b1175-04c2-4f15-a100-ec7cda34c1de
begin
	@variables b[1:3]
	@variables w(..) x1(t) y z(t, α, x)
	b = [2, 5, 9]
end;

# ╔═╡ b70e72aa-32b9-4ae7-8b5f-83a770e52ac7
begin
	z1 = x^2 + y
	L(z1)
end

# ╔═╡ 2d01cb71-28b8-4c40-804b-68faf4a19890
begin
	expr = β[1]* x + y^α + σ(3) * (z1 - t) - β[2] * w(t - 1)
	L(expr)
end

# ╔═╡ fb931ec7-1704-4490-a82a-555a644e1bbc
@variables A[1:3, 1:3] B[1:3, 1:3];

# ╔═╡ f0c84794-6ecc-49ff-a769-e163ef8c44dc
x ~ y

# ╔═╡ 90cd94e1-602b-49af-9913-bfbcd134f520
x - y ~ 0

# ╔═╡ 28c312b7-b4a9-4d0d-8988-8ef8a16cb786
A .~ B

# ╔═╡ 076d6d44-a552-458c-b4ce-1351090f5353
A .~ 3x

# ╔═╡ 83feb017-91d9-4363-811b-9c2be8f650a2
A .~ [1 2 3;]' * x

# ╔═╡ 2202ac58-f7c6-49bf-beee-c32737a83b89
A .~ [1, 2, 3] * x

# ╔═╡ 7659d23b-58fc-4528-a42f-7a818b364958
L(A[3,2])

# ╔═╡ Cell order:
# ╠═dd4498f1-53c4-48e7-b651-70d48ae91379
# ╠═ac129262-c0a8-47d2-af1a-1e1268096451
# ╠═d38b1175-04c2-4f15-a100-ec7cda34c1de
# ╠═b70e72aa-32b9-4ae7-8b5f-83a770e52ac7
# ╠═2d01cb71-28b8-4c40-804b-68faf4a19890
# ╠═33c7c64a-7a2c-4beb-9150-74f6c8444f60
# ╠═39a8c494-5608-470a-89f6-9f4a68a9a527
# ╠═fb931ec7-1704-4490-a82a-555a644e1bbc
# ╠═f0c84794-6ecc-49ff-a769-e163ef8c44dc
# ╠═90cd94e1-602b-49af-9913-bfbcd134f520
# ╠═28c312b7-b4a9-4d0d-8988-8ef8a16cb786
# ╠═076d6d44-a552-458c-b4ce-1351090f5353
# ╠═83feb017-91d9-4363-811b-9c2be8f650a2
# ╠═2202ac58-f7c6-49bf-beee-c32737a83b89
# ╠═7659d23b-58fc-4528-a42f-7a818b364958
