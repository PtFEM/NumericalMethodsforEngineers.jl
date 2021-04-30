### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ de259063-dff2-4270-86e4-d5d4a488b669
using Pkg, DrWatson

# ╔═╡ 1fc31cb5-0bf2-4909-b059-e1a7a2ba7b81
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Symbolics, SymbolicUtils, ModelingToolkit
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ f71fbec6-f64a-404b-923c-1dbf75563c2d
begin
	@parameters t
	@variables x y z(t)
end;

# ╔═╡ dcb8fd74-2514-41aa-ab11-d7b9b44518e2
begin
	ex = x + y + sin(z)
	L(ex)
end

# ╔═╡ a719fd68-fd4d-44b6-9bf4-f33f2afcc5a2
SymbolicUtils.istree(ex)

# ╔═╡ ce5dd824-9ff1-4fdc-99df-5c4b7bd5792a
L(substitute(ex, Dict([x => z, sin(z) => z^2])))

# ╔═╡ ed897d46-f288-48e5-99f7-d6a0efa1f24c
begin
	ex2 = x + y + sin(pi / 2)
	L(ex2)
end

# ╔═╡ e6c254bc-e6a5-40df-b560-93602cb3817e
begin
	substitute(ex2, Dict([x => 3, y => 1, z => 3]))
	L(ex2)
end

# ╔═╡ a3016072-aca5-45b5-9337-75fb8c09e33b
Symbolics.get_variables(ex)

# ╔═╡ aa6b5fc5-f290-4690-b604-ca96ba3b46ce
Symbolics.get_variables(ex2)

# ╔═╡ 9bbf267f-f712-4e69-8ff8-8cbcbea976d1
begin
	substitute(ex, Dict([x => 3, y => -2, z => pi/4]))
	L(ex)
end

# ╔═╡ Cell order:
# ╠═de259063-dff2-4270-86e4-d5d4a488b669
# ╠═1fc31cb5-0bf2-4909-b059-e1a7a2ba7b81
# ╠═f71fbec6-f64a-404b-923c-1dbf75563c2d
# ╠═dcb8fd74-2514-41aa-ab11-d7b9b44518e2
# ╠═a719fd68-fd4d-44b6-9bf4-f33f2afcc5a2
# ╠═ce5dd824-9ff1-4fdc-99df-5c4b7bd5792a
# ╠═ed897d46-f288-48e5-99f7-d6a0efa1f24c
# ╠═e6c254bc-e6a5-40df-b560-93602cb3817e
# ╠═a3016072-aca5-45b5-9337-75fb8c09e33b
# ╠═aa6b5fc5-f290-4690-b604-ca96ba3b46ce
# ╠═9bbf267f-f712-4e69-8ff8-8cbcbea976d1
