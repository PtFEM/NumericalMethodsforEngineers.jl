### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 1dd53841-569e-4501-b791-1fd07d8df47f
using Pkg, DrWatson

# ╔═╡ 3515bef0-6ac0-464a-beb0-087719922e5c
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ ae8610bd-7f9c-4da9-8e51-ec2590cac91f
md" ## f-02-07.jl"

# ╔═╡ 12bdfd3f-3de0-4ed6-af37-c009af54360c
begin
	a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
	b = [4., 2., 5.]
end

# ╔═╡ 0a0eb8e6-8830-4850-84ab-a2ff12574b8f
as = sparse(a)

# ╔═╡ ab5cb4dd-8d90-44aa-84e2-214f10b6b8f2
begin
	f = cholesky(as)
	upper = f.U
end

# ╔═╡ 4093cc75-910d-420e-ac6e-2a7d19108c22
lower = f.L

# ╔═╡ 042eb9b3-0c0b-4a85-96d1-9dd80b733bf1
y = lower \ b

# ╔═╡ 26fce91d-c747-4f9b-9318-432cb33b7296
md" ##### Solution Vector:"

# ╔═╡ 4d09b4a2-4228-4128-a9b7-2a6c5e984c37
begin
	c = upper \ y
	c
end

# ╔═╡ aec7ad54-783f-4fc2-b957-5d6f98ea8deb
@test c == a \ b

# ╔═╡ fa236fb7-a681-4fba-a458-746f183756da
a1 = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]

# ╔═╡ 75dc1c4d-a0cc-4186-92f5-b241f53cf318
b1 = [4., 2., 5.]

# ╔═╡ be9d0599-52ec-4565-a8e6-f78fbe697489
a1[2, 2] += 1.0e20

# ╔═╡ ddd06285-0de7-4df0-8c41-ce2bc9ca71b9
b1[2] = a1[2, 2] * 5.0

# ╔═╡ 86ef4033-d955-450e-97bf-cb00ccea27df
F = cholesky(a1)

# ╔═╡ e1c22dbb-5115-46d1-8e1d-7de8020000fa
F.U

# ╔═╡ fa2d3458-d0c6-4c1c-af5a-4957a8abe29c
F.L

# ╔═╡ f256cf15-ca6d-40d3-9a9e-bd02a0484c4f
y1 = F.L \ b

# ╔═╡ b4887565-0f49-4782-9aae-e527bfb01a44
c1 = F.U \ y1

# ╔═╡ aea18ff7-21b2-4a8a-a953-05b9ad6549e2
md" ##### Solution Vector:"

# ╔═╡ 35fae17c-71ff-4158-a5be-4c3b8b143486
c

# ╔═╡ 0c8f15ce-1ef7-4b8a-b122-5632c0793a93
@test ≈(c, a \ b, atol=1e-5)

# ╔═╡ 9a8af48d-f8f1-434b-9640-024778bb4d0c
md" ### End of f-02-07.jl"

# ╔═╡ Cell order:
# ╟─ae8610bd-7f9c-4da9-8e51-ec2590cac91f
# ╠═1dd53841-569e-4501-b791-1fd07d8df47f
# ╠═3515bef0-6ac0-464a-beb0-087719922e5c
# ╠═12bdfd3f-3de0-4ed6-af37-c009af54360c
# ╠═0a0eb8e6-8830-4850-84ab-a2ff12574b8f
# ╠═ab5cb4dd-8d90-44aa-84e2-214f10b6b8f2
# ╠═4093cc75-910d-420e-ac6e-2a7d19108c22
# ╠═042eb9b3-0c0b-4a85-96d1-9dd80b733bf1
# ╠═26fce91d-c747-4f9b-9318-432cb33b7296
# ╠═4d09b4a2-4228-4128-a9b7-2a6c5e984c37
# ╠═aec7ad54-783f-4fc2-b957-5d6f98ea8deb
# ╠═fa236fb7-a681-4fba-a458-746f183756da
# ╠═75dc1c4d-a0cc-4186-92f5-b241f53cf318
# ╠═be9d0599-52ec-4565-a8e6-f78fbe697489
# ╠═ddd06285-0de7-4df0-8c41-ce2bc9ca71b9
# ╠═86ef4033-d955-450e-97bf-cb00ccea27df
# ╠═e1c22dbb-5115-46d1-8e1d-7de8020000fa
# ╠═fa2d3458-d0c6-4c1c-af5a-4957a8abe29c
# ╠═f256cf15-ca6d-40d3-9a9e-bd02a0484c4f
# ╠═b4887565-0f49-4782-9aae-e527bfb01a44
# ╠═aea18ff7-21b2-4a8a-a953-05b9ad6549e2
# ╠═35fae17c-71ff-4158-a5be-4c3b8b143486
# ╠═0c8f15ce-1ef7-4b8a-b122-5632c0793a93
# ╟─9a8af48d-f8f1-434b-9640-024778bb4d0c
