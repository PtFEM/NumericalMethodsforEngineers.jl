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

# ╔═╡ 04909eeb-00c1-4fe5-a119-ace0ee34ee39
begin
	a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
	b = [4., 2., 5.]
end;

# ╔═╡ 4e1c74a1-d02e-4720-848d-b1ad4f045f34
begin
	upper = cholesky(a).U
	lower = upper'
end

# ╔═╡ 547ab290-807f-40d5-97d7-bb6ce4f67a8f
begin
	y = lower \ b
	c = upper \ y
end

# ╔═╡ de1d3d13-c711-4c80-b4c3-7a39e546a9b7
begin
	tol = 1.0e-10
	maxiters = 5
	x = [(i=i, cg=cg(a, b; maxiter=i)) for i in 1:maxiters]
	x
end

# ╔═╡ 9a4a197b-c547-4e26-aac0-3e6a78026c55
md" ##### Solution Vector:"

# ╔═╡ 98248ee3-00bd-4e76-a921-5bb92c6ed9b2
x[3].cg

# ╔═╡ 50baf6e4-2303-40e2-9e84-cc7448d8c9aa
@test ≈(x[3].cg, c; atol=1.0e-5)

# ╔═╡ Cell order:
# ╠═d465852e-9faa-4b2a-ae9e-6fc0061b8774
# ╠═4861f769-38f0-49af-90c3-c38bd5566972
# ╠═04909eeb-00c1-4fe5-a119-ace0ee34ee39
# ╠═4e1c74a1-d02e-4720-848d-b1ad4f045f34
# ╠═547ab290-807f-40d5-97d7-bb6ce4f67a8f
# ╠═de1d3d13-c711-4c80-b4c3-7a39e546a9b7
# ╟─9a4a197b-c547-4e26-aac0-3e6a78026c55
# ╠═98248ee3-00bd-4e76-a921-5bb92c6ed9b2
# ╠═50baf6e4-2303-40e2-9e84-cc7448d8c9aa
