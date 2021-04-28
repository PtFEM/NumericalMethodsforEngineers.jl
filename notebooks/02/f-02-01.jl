### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 7a63ed47-abf4-4432-bdce-23b7375dc02c
using Pkg, DrWatson

# ╔═╡ fc142be9-b765-4930-8d70-00a9cfda6110
begin
	@quickactivate "NumericalMethodsforEngineers"
	using NumericalMethodsforEngineers, Test
end

# ╔═╡ 44feedf7-0c4a-4f17-9384-8cdb3d30f743
begin
	a = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
	b = [1., 2., 6.]
end;

# ╔═╡ 7813d567-6e63-4056-95e3-0b0872a0d21a
# Convert to upper triang;e
function to_upper(a::Matrix, b::Vector)
  at = deepcopy(a)
  bt = deepcopy(b)  
  r, c = size(at)

  for k in 1:r-1
    if abs(at[k, k]) > 1.0e-6
    for i in k+1:r
      x = at[i, k] / at[k, k]
      at[i, k] = 0.0
      for j in k+1:r
      at[i, j] -= at[k, j] * x
      end
      bt[i] -= bt[k] * x
    end
    else
    md"Zero pivot found in row $k"
    end
  end
  (a=at, b=bt)
end

# ╔═╡ 67af792e-5577-45ed-a1b5-1e977180de34
# Direct solve upper triangular set of equations
function direct_solve(a::Matrix, b::Vector)
  at = deepcopy(a)
  bt = deepcopy(b)
  r, c = size(at)

  for i in r:-1:1
    x = bt[i]
    if i < r
    for j in i+1:r
      x -= at[i, j] * bt[j]
    end
    end
    bt[i] = x / at[i, i]
  end
  bt
end

# ╔═╡ 08b41bf9-e8d6-4773-a173-605de915441d
md" ##### Modified lhs matrix and rhs"

# ╔═╡ 0d465be8-722f-4f51-ba82-f9a41915dc4e
at, bt = to_upper(a, b)

# ╔═╡ 8ede85a1-1270-423a-86a1-58ef53f33ca6
md" ##### Solution vector:"

# ╔═╡ b817e219-d7f7-4de3-a0d6-691f3f33827b
c_nmfe = direct_solve(at, bt)

# ╔═╡ 6a048f48-eadc-4657-bd01-042f43cac5e3
c = a\b

# ╔═╡ 96afae01-56d3-4b33-8cf6-9cf9ef9490c5
@test round.(c; digits=14) == round.(c_nmfe, digits=14)

# ╔═╡ 2e4ee9a0-85e1-4933-97a5-4e15ffbcafea
@test round.(a * c; digits=14) == b

# ╔═╡ Cell order:
# ╠═7a63ed47-abf4-4432-bdce-23b7375dc02c
# ╠═fc142be9-b765-4930-8d70-00a9cfda6110
# ╠═44feedf7-0c4a-4f17-9384-8cdb3d30f743
# ╠═7813d567-6e63-4056-95e3-0b0872a0d21a
# ╠═67af792e-5577-45ed-a1b5-1e977180de34
# ╟─08b41bf9-e8d6-4773-a173-605de915441d
# ╠═0d465be8-722f-4f51-ba82-f9a41915dc4e
# ╟─8ede85a1-1270-423a-86a1-58ef53f33ca6
# ╠═b817e219-d7f7-4de3-a0d6-691f3f33827b
# ╠═6a048f48-eadc-4657-bd01-042f43cac5e3
# ╠═96afae01-56d3-4b33-8cf6-9cf9ef9490c5
# ╠═2e4ee9a0-85e1-4933-97a5-4e15ffbcafea
