### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ cac25d95-5750-4060-8d4b-f61466a997c7
using Pkg, DrWatson

# ╔═╡ 81902a32-f906-450e-ad49-5f5258c82f81
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ 9bc9f18d-5fdf-48e5-a04b-c921a74e5983
md" ### `Ex_02_04.jl`"

# ╔═╡ 5bcab1ab-a649-4c3f-b821-05dea48fb924
a1 = [1. 2. -2.; 2. 5. -4.; -2. -4. 5.]

# ╔═╡ 2797ae90-10e1-4ab0-b6f9-b90c14c0f894
a1[1, 1]

# ╔═╡ a2722d3f-3fb9-4cb1-8831-451a1b00f563
a1[1:2, 1:2]

# ╔═╡ ce79e364-dd29-4f3e-afe3-a3752179d942
det(a1)

# ╔═╡ a1e3f46b-a330-4805-b18b-87e24a851ff8
cholesky(a1)

# ╔═╡ 190c25bf-83d1-4dd7-a969-ff54a1fabee2
cholesky(a1).L

# ╔═╡ dfb294be-22a7-4e98-a482-f5e195d87ccc
a2 = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]

# ╔═╡ c314cc17-e071-4cd4-83ec-da277c18adc8
det(a2[1, 1])

# ╔═╡ 69d90c44-5653-4c54-a935-0e29aa055816
det(a2[1:2, 1:2])

# ╔═╡ c5ee8e48-6523-4b21-82f1-511bacb36847
det(a2)

# ╔═╡ 4a3400e8-1277-45ce-9d1c-8c91004b6098
cholesky(a2)

# ╔═╡ dd26f467-2042-450f-b625-024c2d9ae406
upper = cholesky(a2).U

# ╔═╡ cf259396-c564-4f1b-95d5-e57eb2e45071
lower = cholesky(a2).L

# ╔═╡ 20b2309c-83e5-495f-a7e5-5352f62faf4d
lower * upper

# ╔═╡ 0ea29bc3-539c-407f-8294-4340ba6c7d8d
@test a2 == lower * upper

# ╔═╡ e068b790-c3b3-454c-ad26-d717cb3c6265
md" ### End of ex-02-04.jl"

# ╔═╡ Cell order:
# ╟─9bc9f18d-5fdf-48e5-a04b-c921a74e5983
# ╠═cac25d95-5750-4060-8d4b-f61466a997c7
# ╠═81902a32-f906-450e-ad49-5f5258c82f81
# ╠═5bcab1ab-a649-4c3f-b821-05dea48fb924
# ╠═2797ae90-10e1-4ab0-b6f9-b90c14c0f894
# ╠═a2722d3f-3fb9-4cb1-8831-451a1b00f563
# ╠═ce79e364-dd29-4f3e-afe3-a3752179d942
# ╠═a1e3f46b-a330-4805-b18b-87e24a851ff8
# ╠═190c25bf-83d1-4dd7-a969-ff54a1fabee2
# ╠═dfb294be-22a7-4e98-a482-f5e195d87ccc
# ╠═c314cc17-e071-4cd4-83ec-da277c18adc8
# ╠═69d90c44-5653-4c54-a935-0e29aa055816
# ╠═c5ee8e48-6523-4b21-82f1-511bacb36847
# ╠═4a3400e8-1277-45ce-9d1c-8c91004b6098
# ╠═dd26f467-2042-450f-b625-024c2d9ae406
# ╠═cf259396-c564-4f1b-95d5-e57eb2e45071
# ╠═20b2309c-83e5-495f-a7e5-5352f62faf4d
# ╠═0ea29bc3-539c-407f-8294-4340ba6c7d8d
# ╟─e068b790-c3b3-454c-ad26-d717cb3c6265
