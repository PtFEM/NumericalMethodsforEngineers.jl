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

# ╔═╡ 298bbd55-d7b6-4229-8848-f0ea11f6448e


# ╔═╡ b8e7c2c7-5a72-4d62-9c2d-0b6cfa3e8fbb
@variables x y;

# ╔═╡ 057c029c-bd62-4ecb-9dc8-ed0f35684fd0
to_compute = [x^2 + y, y^2 + x];

# ╔═╡ d8e6cfe2-4cab-476d-8730-ec23470ac1b7
f_expr = build_function(to_compute, [x, y]);

# ╔═╡ dcb5841b-9ab1-4efe-928a-a69a02dffc95
begin
	myf = eval(f_expr[1])
	myf(SA[2.0, 3.0])
end

# ╔═╡ 2f360a8b-4ab6-4617-9481-1a10eab71579
Base.remove_linenums!(f_expr[2])

# ╔═╡ e5f5c803-d739-460f-bdf2-c9f5b55786a3
begin
	myf! = eval(f_expr[2])
	out = zeros(2)
	myf!(out, [2.0, 3.0])
	out
end

# ╔═╡ add02f10-37f9-49b1-80e4-205758be2605
f1 = build_function(to_compute, [x, y], expression=Val{false});

# ╔═╡ 2c817c8d-d108-432c-98b4-f849ec2c9c71
f1[1]([2.0, 3.0])

# ╔═╡ Cell order:
# ╠═dcab9a18-5d58-4632-a325-d16af9c79344
# ╠═c95f3f02-f179-4f81-9c53-6e6b87f25613
# ╠═c9036632-adb9-11eb-33d1-c5193729e72a
# ╠═298bbd55-d7b6-4229-8848-f0ea11f6448e
# ╠═b8e7c2c7-5a72-4d62-9c2d-0b6cfa3e8fbb
# ╠═057c029c-bd62-4ecb-9dc8-ed0f35684fd0
# ╠═d8e6cfe2-4cab-476d-8730-ec23470ac1b7
# ╠═dcb5841b-9ab1-4efe-928a-a69a02dffc95
# ╠═2f360a8b-4ab6-4617-9481-1a10eab71579
# ╠═e5f5c803-d739-460f-bdf2-c9f5b55786a3
# ╠═add02f10-37f9-49b1-80e4-205758be2605
# ╠═2c817c8d-d108-432c-98b4-f849ec2c9c71
