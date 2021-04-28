### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ b32bec97-359c-4a83-ba0b-2503e5c50122
using Pkg, DrWatson

# ╔═╡ 3a39a0db-54de-45ed-a8d5-e948e7c14f89
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ a68242b5-0995-428f-9b73-37cf943e9b87
md" ### f-01-02.jl"

# ╔═╡ 895bad2c-0a85-4584-9cb5-d1579385bfe3
begin
	A = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
	b = [1., 2., 6.]
end

# ╔═╡ e15153d7-bdee-459c-b236-6c037e701e29
md" ##### Julia way: select method based on characterictics of A."

# ╔═╡ dc76295f-88ad-4919-b5e7-d428d27288fa
c = A\b

# ╔═╡ e310cdd3-2d8b-4e17-b4ef-ae8a74740eec
A * c

# ╔═╡ 144f98fa-58ce-4518-b7dc-b98459b50832
b

# ╔═╡ 532a43a1-eb7b-4fc6-861d-421a48eeee5b
md" ##### NMFE implementation:"

# ╔═╡ 00dedc2b-42c1-44ed-a998-c7f49a06c11b
# Convert to upper triang;e
function to_upper(A::Matrix, b::Vector)
	At = deepcopy(A)
	bt = deepcopy(b)	
	r, c = size(At)

	for k in 1:r-1
	  if abs(At[k, k]) > 1.0e-6
		for i in k+1:r
		  x = At[i, k] / At[k, k]
		  At[i, k] = 0.0
		  for j in k+1:r
			At[i, j] -= At[k, j] * x
		  end
		  bt[i] -= bt[k] * x
		end
	  else
		md"Zero pivot found in row $k"
	  end
	end
	(A=At, b=bt)
end

# ╔═╡ 420d0142-790d-4565-b22f-accb0c049023
function direct_solve(A::Matrix, b::Vector)
	At = deepcopy(A)
	bt = deepcopy(b)
	r, c = size(At)

	for i in r:-1:1
	  x = bt[i]
	  if i < r
		for j in i+1:r
		  x -= At[i, j] * bt[j]
		end
	  end
	  bt[i] = x / At[i, i]
	end
	bt
end

# ╔═╡ 546655ea-e19b-450e-a298-3a420c8685d8
lu(A)

# ╔═╡ b9d85721-0442-43fe-8936-b3c30246e51b
md" ##### Modified Matrix:"

# ╔═╡ 843e2d08-c226-4d1d-9998-b359a9dffa10
At, bt = to_upper(A, b)

# ╔═╡ 617129ac-1321-476d-93cb-c1696ddbd40c
md" ##### NMFE solution vector:"

# ╔═╡ 119074dc-3372-4cc3-84cd-ab2abdd1a7b2
c_nmfe = direct_solve(At, bt)

# ╔═╡ f6fec610-96aa-40e2-8646-ff8fe3c2e804
A * c_nmfe

# ╔═╡ 585d3b15-949d-4aca-828d-2477a9c88599
md" ### End of f-01-02.jl"

# ╔═╡ Cell order:
# ╟─a68242b5-0995-428f-9b73-37cf943e9b87
# ╠═b32bec97-359c-4a83-ba0b-2503e5c50122
# ╠═3a39a0db-54de-45ed-a8d5-e948e7c14f89
# ╠═895bad2c-0a85-4584-9cb5-d1579385bfe3
# ╟─e15153d7-bdee-459c-b236-6c037e701e29
# ╠═dc76295f-88ad-4919-b5e7-d428d27288fa
# ╠═e310cdd3-2d8b-4e17-b4ef-ae8a74740eec
# ╠═144f98fa-58ce-4518-b7dc-b98459b50832
# ╟─532a43a1-eb7b-4fc6-861d-421a48eeee5b
# ╠═00dedc2b-42c1-44ed-a998-c7f49a06c11b
# ╠═420d0142-790d-4565-b22f-accb0c049023
# ╠═546655ea-e19b-450e-a298-3a420c8685d8
# ╟─b9d85721-0442-43fe-8936-b3c30246e51b
# ╠═843e2d08-c226-4d1d-9998-b359a9dffa10
# ╟─617129ac-1321-476d-93cb-c1696ddbd40c
# ╠═119074dc-3372-4cc3-84cd-ab2abdd1a7b2
# ╠═f6fec610-96aa-40e2-8646-ff8fe3c2e804
# ╟─585d3b15-949d-4aca-828d-2477a9c88599
