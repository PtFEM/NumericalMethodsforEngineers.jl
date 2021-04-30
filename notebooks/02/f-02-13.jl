### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ d465852e-9faa-4b2a-ae9e-6fc0061b8774
using Pkg, DrWatson

# ╔═╡ 4861f769-38f0-49af-90c3-c38bd5566972
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, IterativeSolvers, Test
end

# ╔═╡ 5548c0a2-2f4b-4e31-9812-e53ef1f45e36
begin
	a = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
	b = [1., 2., 6.]
end

# ╔═╡ d96ba395-b2df-479f-aba6-2a4f5cc0a611
md" ##### Solution Vector:"

# ╔═╡ d72045ef-a128-4855-915b-98bf7a74ad5e
c = a \ b

# ╔═╡ 9a4a197b-c547-4e26-aac0-3e6a78026c55
md" ##### Solution Vector:"

# ╔═╡ Cell order:
# ╠═d465852e-9faa-4b2a-ae9e-6fc0061b8774
# ╠═4861f769-38f0-49af-90c3-c38bd5566972
# ╠═5548c0a2-2f4b-4e31-9812-e53ef1f45e36
# ╟─d96ba395-b2df-479f-aba6-2a4f5cc0a611
# ╠═d72045ef-a128-4855-915b-98bf7a74ad5e
# ╟─9a4a197b-c547-4e26-aac0-3e6a78026c55
