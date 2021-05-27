### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ dcab9a18-5d58-4632-a325-d16af9c79344
using Pkg, DrWatson

# ╔═╡ c95f3f02-f179-4f81-9c53-6e6b87f25613
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Symbolics, SymbolicUtils
	using StaticArrays
end

# ╔═╡ 75361cb8-3c45-4475-94dc-bf8093114613
md" ##### How to build a Lagrangian polynomial in expression form."

# ╔═╡ c9036632-adb9-11eb-33d1-c5193729e72a
function lagrangianpolynomial1(x::Vector{Float64},
		y::Vector{Float64}, xi::Vector{Float64})

	np = length(x)
 	yi = Vector{Float64}(undef, length(xi))
 	m = sort(hcat(x, y), dims=1)
	for l in 1:length(xi)
		for i in 1:np
			term = 1.0
			for j in 1:np
				j !== i && (term *= (xi[l] - m[j, 1])/(m[i, 1] - m[j, 1]))
			end
			yi[l] += term * m[i, 2]
		end
	end
	columns=[]
	push!(columns, m[:,1])
	push!(columns, m[:,2])
	df = DataFrame(columns, [:x, :y])

	columns=[]
	push!(columns, xi)
	push!(columns, yi)
	dfxi = DataFrame(columns, [:xi, :yi])

	(df, dfxi)
end

# ╔═╡ 3d35a281-d906-495f-8534-a6379493665a
md" ##### Expressions from Strings:"

# ╔═╡ 298bbd55-d7b6-4229-8848-f0ea11f6448e
s = "var" * '_' * "t1"

# ╔═╡ 822ad40e-c9c1-4de9-bec4-6533f0d7ea8f
e = Meta.parse(s)

# ╔═╡ d2ade179-b33b-4c73-bebe-b362007a0221
ex = :(a+b*c+1)

# ╔═╡ 8dab1a23-9db4-46b9-bbf8-106d76de570a
typeof(ex)

# ╔═╡ 50b46461-3838-4d95-ae64-a63bf2d29b05
:(a + b*c + 1)       ==
	Meta.parse("a + b*c + 1") ==
       Expr(:call, :+, :a, Expr(:call, :*, :b, :c), 1)

# ╔═╡ 141ed7a4-fbac-40b1-9ada-7b74842b5e75
md" ##### `From the manual:` The use of $ for expression interpolation is intentionally reminiscent of string interpolation and command interpolation."

# ╔═╡ ce6ecce6-eafc-4070-b14f-45415452bb84
begin
	a = 1;
	ex1 = :($a + b)
end

# ╔═╡ e0b8881d-9dec-4ea4-9084-b7e045eeb047
ex2 = :(a in $:((1,2,3)) )

# ╔═╡ 3bb91119-11ef-4ec8-9eff-b7cf4d336417
md" ##### Splatting arguments:"

# ╔═╡ 56895695-745d-46ec-9326-3ce444d0597b
args = [:x, :y, :z];

# ╔═╡ f0aa8168-6bc9-4702-b40a-689869258741
:(f(1, $(args...)))

# ╔═╡ 1181e81e-8603-4d80-a752-1d9d1c51640d
begin
	x = :(1 + 2)
	ex3 = quote quote $x end end
end

# ╔═╡ 309baaeb-8a45-4502-9840-9d71a2b1349f
eval(ex3)

# ╔═╡ 06f51cf6-cb6e-4fce-b914-fdbf4a65ef79
eval(eval(ex3))

# ╔═╡ acbd6c5f-1b3a-4a77-a1b8-1ebf47f563ee
md" ##### Output to Terminal:"

# ╔═╡ cde57703-141a-4bd6-b411-d36ddf5eaf48
dump(Meta.parse(":(1+2)"))

# ╔═╡ 771c13c0-07a9-416c-b254-6ed9b6ee37c0
ex4 = :(x1 = 1)

# ╔═╡ e6c624d0-c468-482d-8c42-de8f44b7e7d4
try
	x1
catch exc
	exc
end

# ╔═╡ 8229d3f5-ff3d-482f-8029-a521f62bc19b
eval(ex4);

# ╔═╡ 8dabc67e-72a9-4359-9a7e-9bbaecd9f1a8
x1

# ╔═╡ 43851fcd-bd0b-47aa-8b50-83242670dfba
md" ##### Functions on expressions:"

# ╔═╡ ccbd0884-79ff-49cd-82e5-3247665a2edc
function math_expr(op, op1, op2)
	ex5 = Expr(:call, op, op1, op2)
	return ex5
end

# ╔═╡ 6133a422-d5fa-4ab6-8eb7-18de0f0c904f
ex6 = math_expr(:+, 1, Expr(:call, :*, 4, 5))

# ╔═╡ 727f59e1-89e2-4407-a32a-c2a9640ab031
eval(ex6)

# ╔═╡ 2447682c-407c-44e0-889a-45a0ea3d9843
function make_expr2(op, opr1, opr2)
	opr1f, opr2f = map(x -> isa(x, Number) ? 2*x : x, (opr1, opr2))
	retexpr = Expr(:call, op, opr1f, opr2f)
	return retexpr
end

# ╔═╡ baffafa2-14e4-4461-93c7-beeebd254d34
make_expr2(:+, 1, 2)

# ╔═╡ 76e490a7-26c2-4bab-9d04-83fd3bf9aa6e
ex7 = make_expr2(:+, 1, Expr(:call, :*, 5, 8))

# ╔═╡ 58d9f409-5da7-473d-a933-2221ae6a9da1
eval(ex7)

# ╔═╡ c8ee6c92-f51f-4cfc-b2eb-2a2eadb73be5
ex8 = make_expr2(:(.+), 1, [2, 3])

# ╔═╡ 657560a4-b7ae-4fff-8ba8-c17bfbfe9179
eval(ex8)

# ╔═╡ 2ddc5871-0735-4d52-ae8b-720c606fef3f
function make_expr3(op, opr1, opr2)
	opr1f, opr2f =
		map(x -> isa(x, Number) || isa(x, Vector{Int64}) ? 2 .* x : x, (opr1, opr2))
	retexpr = Expr(:call, op, opr1f, opr2f)
	return retexpr
end

# ╔═╡ c30be5cb-8aba-4ed3-9356-45d64c4dd236
ex9 = make_expr3(:(.+), 1, [2, 3])

# ╔═╡ 6d0fb950-9c30-4d7b-9954-a2877a90ff5e
typeof([2, 3])

# ╔═╡ fcb65821-e585-4af9-860f-6003268fdfe8
eval(ex9)

# ╔═╡ Cell order:
# ╠═dcab9a18-5d58-4632-a325-d16af9c79344
# ╠═c95f3f02-f179-4f81-9c53-6e6b87f25613
# ╟─75361cb8-3c45-4475-94dc-bf8093114613
# ╠═c9036632-adb9-11eb-33d1-c5193729e72a
# ╟─3d35a281-d906-495f-8534-a6379493665a
# ╠═298bbd55-d7b6-4229-8848-f0ea11f6448e
# ╠═822ad40e-c9c1-4de9-bec4-6533f0d7ea8f
# ╠═d2ade179-b33b-4c73-bebe-b362007a0221
# ╠═8dab1a23-9db4-46b9-bbf8-106d76de570a
# ╠═50b46461-3838-4d95-ae64-a63bf2d29b05
# ╟─141ed7a4-fbac-40b1-9ada-7b74842b5e75
# ╠═ce6ecce6-eafc-4070-b14f-45415452bb84
# ╠═e0b8881d-9dec-4ea4-9084-b7e045eeb047
# ╟─3bb91119-11ef-4ec8-9eff-b7cf4d336417
# ╠═56895695-745d-46ec-9326-3ce444d0597b
# ╠═f0aa8168-6bc9-4702-b40a-689869258741
# ╠═1181e81e-8603-4d80-a752-1d9d1c51640d
# ╠═309baaeb-8a45-4502-9840-9d71a2b1349f
# ╠═06f51cf6-cb6e-4fce-b914-fdbf4a65ef79
# ╟─acbd6c5f-1b3a-4a77-a1b8-1ebf47f563ee
# ╠═cde57703-141a-4bd6-b411-d36ddf5eaf48
# ╠═771c13c0-07a9-416c-b254-6ed9b6ee37c0
# ╠═e6c624d0-c468-482d-8c42-de8f44b7e7d4
# ╠═8229d3f5-ff3d-482f-8029-a521f62bc19b
# ╠═8dabc67e-72a9-4359-9a7e-9bbaecd9f1a8
# ╟─43851fcd-bd0b-47aa-8b50-83242670dfba
# ╠═ccbd0884-79ff-49cd-82e5-3247665a2edc
# ╠═6133a422-d5fa-4ab6-8eb7-18de0f0c904f
# ╠═727f59e1-89e2-4407-a32a-c2a9640ab031
# ╠═2447682c-407c-44e0-889a-45a0ea3d9843
# ╠═baffafa2-14e4-4461-93c7-beeebd254d34
# ╠═76e490a7-26c2-4bab-9d04-83fd3bf9aa6e
# ╠═58d9f409-5da7-473d-a933-2221ae6a9da1
# ╠═c8ee6c92-f51f-4cfc-b2eb-2a2eadb73be5
# ╠═657560a4-b7ae-4fff-8ba8-c17bfbfe9179
# ╠═2ddc5871-0735-4d52-ae8b-720c606fef3f
# ╠═c30be5cb-8aba-4ed3-9356-45d64c4dd236
# ╠═6d0fb950-9c30-4d7b-9954-a2877a90ff5e
# ╠═fcb65821-e585-4af9-860f-6003268fdfe8
