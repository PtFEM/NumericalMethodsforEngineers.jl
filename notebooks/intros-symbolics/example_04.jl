### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 8c925150-4c23-409e-a5a6-b275cd8b1e2c
using Pkg, DrWatson

# ╔═╡ ac8218e1-f8a9-476e-8622-59f4fd2748c2
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Symbolics, SymbolicUtils, ModelingToolkit
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ a52a571a-d590-4540-af19-b57039203d65
begin
	@parameters t
	@variables x y
	@variables γ[1:2]
end;

# ╔═╡ 11d9e598-990e-484f-ba9a-fbe015a4050c
function f(x, y)
    @variables z
    z = x^2 + y
    [x - z, x^2 - y, z + y]
end

# ╔═╡ c3d7eccd-2437-4c4c-b3e2-7be634c68ce2
L.(f(x, y))

# ╔═╡ cd32f519-6a7b-4213-bb77-2e86a51cf55b
v = [4, 4]

# ╔═╡ 534d69c7-7f10-4b02-a589-511a13e8867a
f(v...)

# ╔═╡ 2192bb67-7e70-42aa-bea2-cf1350d4e417
sum(f(v...))

# ╔═╡ 76e59dd6-0d53-4633-aa9d-0536518f6ef1
L.(f(γ...))

# ╔═╡ 10b84a16-9b8f-42d3-988a-7af9f27e0697
SymbolicUtils.istree(f)

# ╔═╡ 86458fb9-3d59-410b-b5b7-2bd7e33e9ccb
begin
	@variables z1
	z1 = x^2 + y
	L(z1)
end

# ╔═╡ 3969d188-b5a0-49ce-8745-0c6c4aa45994
begin
	ex2 = [x - z1, x^2 - y, z1 + y]
	L(ex2)
end

# ╔═╡ bd8e2cab-63f1-4c62-8cdb-f35d1242f789
testf = build_function(ex2, [x, y, z1], expression=Val{false});

# ╔═╡ a74b2190-63e3-4ab8-a8bb-7503b300f597
L(testf[1]([4, 4, z1]))

# ╔═╡ Cell order:
# ╠═8c925150-4c23-409e-a5a6-b275cd8b1e2c
# ╠═ac8218e1-f8a9-476e-8622-59f4fd2748c2
# ╠═a52a571a-d590-4540-af19-b57039203d65
# ╠═11d9e598-990e-484f-ba9a-fbe015a4050c
# ╠═c3d7eccd-2437-4c4c-b3e2-7be634c68ce2
# ╠═cd32f519-6a7b-4213-bb77-2e86a51cf55b
# ╠═534d69c7-7f10-4b02-a589-511a13e8867a
# ╠═2192bb67-7e70-42aa-bea2-cf1350d4e417
# ╠═76e59dd6-0d53-4633-aa9d-0536518f6ef1
# ╠═10b84a16-9b8f-42d3-988a-7af9f27e0697
# ╠═86458fb9-3d59-410b-b5b7-2bd7e33e9ccb
# ╠═3969d188-b5a0-49ce-8745-0c6c4aa45994
# ╠═bd8e2cab-63f1-4c62-8cdb-f35d1242f789
# ╠═a74b2190-63e3-4ab8-a8bb-7503b300f597
