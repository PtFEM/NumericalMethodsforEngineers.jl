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
	using StaticArrays, DataFrames, Plots
end

# ╔═╡ 75361cb8-3c45-4475-94dc-bf8093114613
md" ##### Building a Lagrangian polynomial in expression form."

# ╔═╡ c1acd2f9-a762-4beb-b44a-feb74fba31fb
@variables x[1:4] y[1:4];

# ╔═╡ 15eaabdd-ed7b-42ec-bd19-96b927cbbdd8
@variables g(x::Vector{Symbolics.Num}, y::Vector{Symbolics.Num});

# ╔═╡ a240a3be-f978-4f27-985c-b997b8cb75e4
begin
	z = Vector{AbstractString}(undef, length(x))
	for i in 1:length(x)
		for j in 1:length(x)
			if j == 1 && i == 1
				z[i] = "$(y[1])"
			elseif j == 1
				z[i] = "((x - $(x[j])) / ($(x[i]) - $(x[j])))"
			elseif i == j
				z[i] = "$(z[i]) * $(y[i])"
			elseif i !== j
				z[i] = "$(z[i]) * ((x - $(x[j])) / ($(x[i]) - $(x[j])))"
			end
		end
	end
	z
end

# ╔═╡ 9a626dae-2a2e-4d17-9813-dcb1564848de
typeof(z)

# ╔═╡ db65cf7d-d33e-49cd-bd03-464b4096c8d6
ze = Meta.parse.(z)

# ╔═╡ fe586e50-f0e4-41e2-b7f0-f408c9038464
begin
	dct = Dict(x[1]=>1, x[2]=>2, x[3]=>3, x[4]=>4,
		y[1]=>1, y[2]=>4, y[3]=>9, y[4]=>16)
	L(dct)
end

# ╔═╡ 53d5c163-2d9a-4de8-9f37-1698aa142b69
substitute(ze[1], Dict(x[1]=>1, x[2]=>2, x[3]=>3, x[4]=>4, y[1]=>1, y[2]=>4, y[3]=>9, y[4]=>16))

# ╔═╡ 7147c00f-c9ea-4493-929b-8bf1f0354f28
substitute(ze[2], dct)

# ╔═╡ b3ee083c-9002-4273-aab1-b898348c2d0a
begin
	@variables u v
	to_compute = [u^2 + v, v^2 + u]
end;

# ╔═╡ 386da460-ee76-4506-8aaf-3d02658720f9
f_expr = build_function(to_compute, [u, v]);

# ╔═╡ 77c31df8-cab7-4bb8-986a-8d67b56b2b2b
begin
	myf = eval(f_expr[1])
	myf(SA[2.0, 3.0])
end

# ╔═╡ 162d30d7-d520-457e-8f1e-91ee85eb5573
ze_expr = build_function(ze, [x, y]);

# ╔═╡ a29d1a22-bdb9-4253-88ac-ed8e4ccb34e7
zef = eval(ze_expr[1])

# ╔═╡ 2fc2edef-203d-4822-b7a8-80a9c410ab01
zef(SA[1,2,3,4], SA[1,4, 9, 16])

# ╔═╡ Cell order:
# ╠═dcab9a18-5d58-4632-a325-d16af9c79344
# ╠═c95f3f02-f179-4f81-9c53-6e6b87f25613
# ╠═75361cb8-3c45-4475-94dc-bf8093114613
# ╠═c1acd2f9-a762-4beb-b44a-feb74fba31fb
# ╠═15eaabdd-ed7b-42ec-bd19-96b927cbbdd8
# ╠═a240a3be-f978-4f27-985c-b997b8cb75e4
# ╠═9a626dae-2a2e-4d17-9813-dcb1564848de
# ╠═db65cf7d-d33e-49cd-bd03-464b4096c8d6
# ╠═fe586e50-f0e4-41e2-b7f0-f408c9038464
# ╠═53d5c163-2d9a-4de8-9f37-1698aa142b69
# ╠═7147c00f-c9ea-4493-929b-8bf1f0354f28
# ╠═b3ee083c-9002-4273-aab1-b898348c2d0a
# ╠═386da460-ee76-4506-8aaf-3d02658720f9
# ╠═77c31df8-cab7-4bb8-986a-8d67b56b2b2b
# ╠═162d30d7-d520-457e-8f1e-91ee85eb5573
# ╠═a29d1a22-bdb9-4253-88ac-ed8e4ccb34e7
# ╠═2fc2edef-203d-4822-b7a8-80a9c410ab01
