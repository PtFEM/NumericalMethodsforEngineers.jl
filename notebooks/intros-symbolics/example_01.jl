### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 56a604d4-ec32-404f-91bc-86fa24b9bb47
using Pkg, DrWatson

# ╔═╡ 286f9602-6773-4fe0-ac75-36b19d8333f0
begin
	@quickactivate "NumericalMethodsforEngineers"
	using Symbolics, SymbolicUtils, Latexify, LaTeXStrings, ModelingToolkit
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ 987efa36-893d-45cc-88b5-234b80071ab2
using NamedTupleTools

# ╔═╡ 278c20ed-066d-436d-836a-10c34661c3eb
md"
!!! tip
	Output from `versioninfo()` is shown in terminal.
"

# ╔═╡ 8e5d2539-81c6-4396-81ff-a6908b582096
versioninfo()

# ╔═╡ f419c6fc-7b77-4ec6-80c0-8672b064c7f4
begin
	@variables t x y
	D = Differential(t)
end;

# ╔═╡ 303f5542-8e24-4994-a701-2bb664560699
md"
!!! note
	Helper functions such as `LATEXIFY()` and `L()` are defined in pluto-helpers.jl
"

# ╔═╡ 0eb5fb16-765e-4bfc-9300-e7a867037eb5
begin
	a = [x^2+y 0 2x;
		 0 0 2y;
		 y^2 + x 0 0]
	LATEXIFY("a", a)
end

# ╔═╡ 62588b63-213e-44b4-b3a0-eec4b1c930c3
L("a", a)

# ╔═╡ 2292c3af-6ca4-415f-b637-610dbbe42cab
begin
	z = t*t^4 + 3t^5
	D(z) # symbolic representation of derivative(t*t^4 + 15t^4, t)
	L(expand_derivatives(D(z))) # 10t^4
end

# ╔═╡ c899af71-1ae1-4b17-ba3a-d3ba989e49b6
L(z)

# ╔═╡ 5e617b9a-eedc-4a0a-82df-57dad2b91b3e
md"b0 = $(latexify(z))"

# ╔═╡ 340e4b31-4de7-40e3-816e-6e705df711de
begin
	b0 = Symbolics.jacobian([x + x*y, x^2 + y],[x, y])
	md"b0 = $(latexify(b0))"
end

# ╔═╡ 0d87482f-7a1a-495f-94fb-a6a625534801
begin
	b = [
		t^2 + t + t^2  2t + 4t
		x + y + y + 2t  x^2 - x^2 + y^2
	]
	b1 = simplify.(b)
	Text(sprint(show, "text/plain", b1))
end

# ╔═╡ ede004a7-e53c-4102-a4dd-6529dcd8f855
md"b1 = $(latexify(b1))"

# ╔═╡ a9376da1-b58a-4134-ab77-3db8ef42695e
begin
	b2 = simplify.(substitute.(b, (Dict(x => y^2),)))
	md"b2 = $(latexify(b2))"
end

# ╔═╡ 65237ef6-7c92-4687-96cb-766016f5ed73
md"
!!! note
	Element b3[2,1] == 16
"

# ╔═╡ c0df2952-f0f0-414a-92a3-3b1c6c622206
begin
	#2×2 Matrix{Num}:
	# 36.0  24.0
	# 16.0   9.0

	b3 = substitute.(b, (Dict(x => 2.0, y => 3.0, t => 4.0),))
	LATEXIFY("b3", b3)
end

# ╔═╡ e4998080-32ef-4095-bad0-92cc27bf5170
LATEXIFY(b3)

# ╔═╡ 9b7a5d1d-1a3e-40bc-86c2-6cf7cedc57a0
begin
	#2×2 Matrix{Num}:
	#   t + 2(t^2)   6t
	# 2t + 2y  y^2

	b4 = simplify.(substitute.(b, (Dict(x => 2y),)))
	Text(sprint(show, "text/plain", b4))
end

# ╔═╡ 412ef249-a7ac-42ef-b30e-4e77cddcd9a6
begin
	b5 = substitute.(b4, (Dict(x => 2.0, y => 3.0, t => 4.0),))
	Text(sprint(show, "text/plain", b5))
end

# ╔═╡ 1e48e58c-509b-42fd-b7e8-a943ff48d7f9
struct MyStruct
           tally::Int
           team::String
       end

# ╔═╡ 170bf340-b629-4cce-831f-570b1f7f4494
mystruct = MyStruct(5, "hometeam")

# ╔═╡ 7f3c0230-0619-498f-85de-9ab5982f72c7
mynamedtuple = ntfromstruct(mystruct)

# ╔═╡ 93ff9a77-8419-465a-8f7b-b565179364bf
ntstruct = structfromnt(MyStruct, mynamedtuple)

# ╔═╡ 2aeebb4c-379e-4876-9d1e-99e7bc8622f2
mystruct == ntstruct

# ╔═╡ Cell order:
# ╠═56a604d4-ec32-404f-91bc-86fa24b9bb47
# ╠═286f9602-6773-4fe0-ac75-36b19d8333f0
# ╟─278c20ed-066d-436d-836a-10c34661c3eb
# ╠═8e5d2539-81c6-4396-81ff-a6908b582096
# ╠═f419c6fc-7b77-4ec6-80c0-8672b064c7f4
# ╟─303f5542-8e24-4994-a701-2bb664560699
# ╠═0eb5fb16-765e-4bfc-9300-e7a867037eb5
# ╠═62588b63-213e-44b4-b3a0-eec4b1c930c3
# ╠═2292c3af-6ca4-415f-b637-610dbbe42cab
# ╠═c899af71-1ae1-4b17-ba3a-d3ba989e49b6
# ╠═5e617b9a-eedc-4a0a-82df-57dad2b91b3e
# ╠═340e4b31-4de7-40e3-816e-6e705df711de
# ╠═0d87482f-7a1a-495f-94fb-a6a625534801
# ╠═ede004a7-e53c-4102-a4dd-6529dcd8f855
# ╠═a9376da1-b58a-4134-ab77-3db8ef42695e
# ╠═e4998080-32ef-4095-bad0-92cc27bf5170
# ╟─65237ef6-7c92-4687-96cb-766016f5ed73
# ╠═c0df2952-f0f0-414a-92a3-3b1c6c622206
# ╠═9b7a5d1d-1a3e-40bc-86c2-6cf7cedc57a0
# ╠═412ef249-a7ac-42ef-b30e-4e77cddcd9a6
# ╠═987efa36-893d-45cc-88b5-234b80071ab2
# ╠═1e48e58c-509b-42fd-b7e8-a943ff48d7f9
# ╠═170bf340-b629-4cce-831f-570b1f7f4494
# ╠═7f3c0230-0619-498f-85de-9ab5982f72c7
# ╠═93ff9a77-8419-465a-8f7b-b565179364bf
# ╠═2aeebb4c-379e-4876-9d1e-99e7bc8622f2
