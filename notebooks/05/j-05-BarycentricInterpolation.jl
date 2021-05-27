### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 19cc5ec6-f7cb-4736-98c3-498d91eb2414
using BarycentricInterpolation

# ╔═╡ 53285b2c-3704-4adc-9bdd-9dea619b5140
md" ## BarycentricInterpolation.jl"

# ╔═╡ 7ba7dd56-4ee9-4c5c-97a8-5f99a9ba507e
p = Chebyshev2{20}()           # create a Chebyshev type 2 polynomial of order 20

# ╔═╡ ddacc062-c4cb-40e1-8645-a1f8619eabea
x = nodes(p)                   # get the nodes

# ╔═╡ 7fdcd309-5e3e-4c65-9d8c-96d19fdc923c
y = sinpi.(x)                  # generate y values at the nodes

# ╔═╡ 9c9fdfad-44eb-4f5b-a5e0-82eaade02ed1
x_new = rand()*2 -1            # a random number in [-1, +1]

# ╔═╡ f3f7c1ea-f4aa-4dc2-a630-0fb37e4bdadb
println(interpolate(p, y, x_new) ≈ sinpi(x_new))       # hopefully true!

# ╔═╡ d0ca3867-a266-4299-ac49-9745154b3ad4
D = differentiation_matrix(p)  # get the differentiation matrix

# ╔═╡ 880d1ae8-5a5a-463a-8e35-a73bdc40208a
println(interpolate(p, D*y, x_new) ≈ pi*cospi(x_new))  # hopefully true!

# ╔═╡ c2fcf437-bd86-4b24-8c77-29702cf5373d
md" ## End of BarycentricInterpolation.jl"

# ╔═╡ Cell order:
# ╟─53285b2c-3704-4adc-9bdd-9dea619b5140
# ╠═19cc5ec6-f7cb-4736-98c3-498d91eb2414
# ╠═7ba7dd56-4ee9-4c5c-97a8-5f99a9ba507e
# ╠═ddacc062-c4cb-40e1-8645-a1f8619eabea
# ╠═7fdcd309-5e3e-4c65-9d8c-96d19fdc923c
# ╠═9c9fdfad-44eb-4f5b-a5e0-82eaade02ed1
# ╠═f3f7c1ea-f4aa-4dc2-a630-0fb37e4bdadb
# ╠═d0ca3867-a266-4299-ac49-9745154b3ad4
# ╠═880d1ae8-5a5a-463a-8e35-a73bdc40208a
# ╟─c2fcf437-bd86-4b24-8c77-29702cf5373d
