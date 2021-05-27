### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 0c4edc09-133b-4cb8-a3e1-1e51cf9141f9
using Pkg, DrWatson

# ╔═╡ 8830efde-f966-4c2f-8370-6e6c45d86098
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers
	using DataFrames, Plots, Interpolations
end

# ╔═╡ cae6336b-054b-4c8e-ae88-93628ec5a6ae
md" ## j-05-01.jl"

# ╔═╡ d365b053-99cc-4775-9763-de6d7a8a9b19
begin
	x = [1.0, 3.0, 6.0, 5.0]
	y = [1.0, 5.0, 10.0, 9.0]
	xi = [2.0, 4.5]
	xint = 1:0.1:6
	indxs = sortperm(x)
end

# ╔═╡ deb9dac5-dfda-458d-9bea-a2659bf67555
md" #####

# ╔═╡ 03a53e2f-95f8-416e-888b-a50cca36fa13
begin
	interp_linear = LinearInterpolation(x[indxs], y[indxs])
	interp_linear.(xi)
end

# ╔═╡ 51fcc406-c130-49d3-9ba9-40437db90e05
begin
	x1 = 1:1:6
	y1 = [1.0, 3.0, 5.0, 7.0, 9.0, 10.0]
	interp = CubicSplineInterpolation(x1, y1)
	interp.(xi)
end

# ╔═╡ 5fded190-bcd2-461f-a7b8-72a4cce4751d
(dfin1, dfxi) = lagrangianpolynomial(length(x), x, y, xi)

# ╔═╡ 0b7ce582-0b49-4d27-b129-4e6e24d9eb15
(dfin2, dfxint) = lagrangianpolynomial(length(x), x, y, collect(xint))

# ╔═╡ 8546534a-55be-4447-9e1a-a722d60624fa
begin
	plot(dfxint.xi, dfxint.yi, line=(:path, 1), label="interpolated curve",
		leg=:topleft)
	scatter!(dfin1.x, dfin1.y, marker=(:circle, 4), label="input points",
		color=:blue)
	scatter!(dfxi.xi, dfxi.yi, marker=(:star, 8), color=:red,
		label="interpolated points")
end

# ╔═╡ 8069f1b3-8a61-436e-91a4-c0ecf0db8685
md" ## End of j-05-01.jl"

# ╔═╡ Cell order:
# ╟─cae6336b-054b-4c8e-ae88-93628ec5a6ae
# ╠═0c4edc09-133b-4cb8-a3e1-1e51cf9141f9
# ╠═8830efde-f966-4c2f-8370-6e6c45d86098
# ╠═d365b053-99cc-4775-9763-de6d7a8a9b19
# ╠═deb9dac5-dfda-458d-9bea-a2659bf67555
# ╠═03a53e2f-95f8-416e-888b-a50cca36fa13
# ╠═51fcc406-c130-49d3-9ba9-40437db90e05
# ╠═5fded190-bcd2-461f-a7b8-72a4cce4751d
# ╠═0b7ce582-0b49-4d27-b129-4e6e24d9eb15
# ╠═8546534a-55be-4447-9e1a-a722d60624fa
# ╟─8069f1b3-8a61-436e-91a4-c0ecf0db8685
