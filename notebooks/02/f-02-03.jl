### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# ╔═╡ 5c00529c-54cb-4cae-9154-5bad2818314d
using NumericalMethodsforEngineers

# ╔═╡ 2b6b8cd8-f5d1-4ee5-abaa-1eb25369b633
begin
	a = Float64[16 4 8;4 5 -4;8 -4 22]
	b = Float64[4, 2, 5]
end

# ╔═╡ 634ecc96-cf0d-44ce-b1d3-10c99e3684d5
begin
	c = a \ b
end

# ╔═╡ 232d372c-236f-4f72-953b-4f2fe9ee6cf2
function ldlt1(a::Matrix{Float64}; small=1.0e-10)
	at = deepcopy(a)
	d = zeros(size(at, 1))
	n = size(at, 1)
	for k in 1:n-1
		d[1] = at[1, 1]
		if abs(at[k, k]) > small
			for i in k+1:n
				x = at[i, k]/at[k, k]
				for j=k+1:n
					at[i, j] -= at[k, j]*x
				end
				d[i] = at[i, i]
			end
		else
			md"Zero pivot found in row $k"
		end
	end
	lower = zeros(size(a))
	for i in 1:size(a, 1)
	  for j in 1:i
		lower[i, j] = at[i, j] / d[j]
	  end
	end

  (lower, d, Matrix(lower'))
end


# ╔═╡ dbe4cf7c-80f5-441c-8a1a-82fdda1a2a6d
l, d, u = ldlt1(a)

# ╔═╡ 9bbc607c-7c22-4592-a649-68733298ccc5
# Forward-substitution on a Lower Triangle
function ldlfor1(a::Matrix{Float64}, b::Vector{Float64})
	at = deepcopy(a)
	bt = deepcopy(b)
 	n = size(at, 1)
	for i in 1:n
		total = bt[i]
		if i > 1
			for j in 1:i-1
				total -= at[i, j] * bt[j]
			end
		end
		bt[i] = total / at[i, i]
	end
	(at, bt)
end

# ╔═╡ 97a9da24-d317-45ae-ae2f-9d02f197ac45
at1, bt1 = ldlfor1(deepcopy(a), b)

# ╔═╡ 03708be9-cfb9-40c9-928b-1c0c53a57d8e
bt1

# ╔═╡ e36ebc1c-0840-428d-80f0-8b3aed45f4a2
at0 = zeros(size(at1));

# ╔═╡ ab446a07-259d-4f2b-9aa7-0710c1a4e56a
for i in 1:size(a, 1)
	at0[i, :] = at1[i, :] / d[i]
end

# ╔═╡ 7aeb8499-fd8c-4d56-9e30-ec12abb39567
at0

# ╔═╡ 7cb6c06f-4fa2-4cdc-b653-34b79ef3f8d7
bt1

# ╔═╡ cfb54112-57f7-4168-bb2d-e3daacf54719
# Back-substitution on an Upper Triangle

function subbac1(u::Matrix{Float64}, b::Vector{Float64})
	bt = deepcopy(b)
	n = size(u, 1)
	for i in n:-1:1
		total = bt[i]
		if i < n
			for j in i+1:n
				total -= u[i, j] * bt[j]
			end
		end
		bt[i] = total / u[i, i]
	end
	bt
end

# ╔═╡ 6e509f85-69f5-4eb4-9fe5-3d7c6a7de557
subbac1(u, bt1)

# ╔═╡ Cell order:
# ╠═5c00529c-54cb-4cae-9154-5bad2818314d
# ╠═2b6b8cd8-f5d1-4ee5-abaa-1eb25369b633
# ╠═634ecc96-cf0d-44ce-b1d3-10c99e3684d5
# ╠═232d372c-236f-4f72-953b-4f2fe9ee6cf2
# ╠═dbe4cf7c-80f5-441c-8a1a-82fdda1a2a6d
# ╠═9bbc607c-7c22-4592-a649-68733298ccc5
# ╠═97a9da24-d317-45ae-ae2f-9d02f197ac45
# ╠═03708be9-cfb9-40c9-928b-1c0c53a57d8e
# ╠═e36ebc1c-0840-428d-80f0-8b3aed45f4a2
# ╠═ab446a07-259d-4f2b-9aa7-0710c1a4e56a
# ╠═7aeb8499-fd8c-4d56-9e30-ec12abb39567
# ╠═7cb6c06f-4fa2-4cdc-b653-34b79ef3f8d7
# ╠═cfb54112-57f7-4168-bb2d-e3daacf54719
# ╠═6e509f85-69f5-4eb4-9fe5-3d7c6a7de557
