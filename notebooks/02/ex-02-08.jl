### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ d1f4afa8-2501-4447-96a6-7fb93f463e2c
using IterativeSolvers, DataFrames

# ╔═╡ 57c64cca-55ee-4c2b-ad27-2942a262df7b
md" ### Ex-02-08.jl"

# ╔═╡ c7b3e4fb-8f17-4e0e-82a5-18d30f8b198a
begin
	A = Float64[
	  16 4 8;
	  4 5 -4;
	  8 -4 22;
	]
	a = Float64[4; 2; 5]
	r = vcat(collect(1:6), collect(10:10:100))
end;

# ╔═╡ 21a0af0a-7873-45f5-bd59-31c43cbb0f0c
md" ##### Jacobi method:"

# ╔═╡ 137e76a3-ea70-49e0-a1f7-a2eadaac9963
x_j = [(i=i, j=jacobi(A, a; maxiter=i)) for i in r]

# ╔═╡ 31d9aa57-e96b-409b-b1ab-9e5966af6bf5
x_j[1]

# ╔═╡ 70d35d30-1798-4982-9b9e-3812a575d179
A * x_j[11].j

# ╔═╡ 954c3dec-86ad-4a29-9528-a790a9ebf2c0
md" ##### Gauss-Seidel method:"

# ╔═╡ 53491c26-f5d1-48d0-a795-7c20a31b00df
x_gs = [(i=i, gs=gauss_seidel(A, a; maxiter=i)) for i in r]

# ╔═╡ b2a3e4de-cd59-466a-9872-f72e78bb91ba
A * x_gs[11].gs

# ╔═╡ df81e70f-ec63-4be6-8517-d962b315dc0f
md" ##### Succesive Over-Relaxation method:"

# ╔═╡ cebd114d-8a7c-44c0-bbca-e39b124a263e
x_sor = [(i=i, sor=sor(A, a, 1.0; maxiter=i)) for i in r]

# ╔═╡ 9b86fca1-6867-4c70-b7a2-6e648bbfc26e
A * x_sor[11].sor

# ╔═╡ c1dd5a8b-5256-410f-9abc-58afd36cb1af
md" ##### Sequential Succesive Over-Relaxation method:"

# ╔═╡ 09fd7541-fe59-435b-8f6d-73b72b0c01f0
x_ssor = [(i=i, ssor=ssor(A, a, 1.0; maxiter=i)) for i in r]

# ╔═╡ 96d4ef12-7a35-47c5-a255-5056e582e618
A * x_ssor[11].ssor

# ╔═╡ Cell order:
# ╟─57c64cca-55ee-4c2b-ad27-2942a262df7b
# ╠═d1f4afa8-2501-4447-96a6-7fb93f463e2c
# ╠═c7b3e4fb-8f17-4e0e-82a5-18d30f8b198a
# ╟─21a0af0a-7873-45f5-bd59-31c43cbb0f0c
# ╠═137e76a3-ea70-49e0-a1f7-a2eadaac9963
# ╠═31d9aa57-e96b-409b-b1ab-9e5966af6bf5
# ╠═70d35d30-1798-4982-9b9e-3812a575d179
# ╟─954c3dec-86ad-4a29-9528-a790a9ebf2c0
# ╠═53491c26-f5d1-48d0-a795-7c20a31b00df
# ╠═b2a3e4de-cd59-466a-9872-f72e78bb91ba
# ╟─df81e70f-ec63-4be6-8517-d962b315dc0f
# ╠═cebd114d-8a7c-44c0-bbca-e39b124a263e
# ╠═9b86fca1-6867-4c70-b7a2-6e648bbfc26e
# ╟─c1dd5a8b-5256-410f-9abc-58afd36cb1af
# ╠═09fd7541-fe59-435b-8f6d-73b72b0c01f0
# ╠═96d4ef12-7a35-47c5-a255-5056e582e618
