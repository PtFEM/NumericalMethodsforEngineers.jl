### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ cea30482-e74a-41b0-bdc5-17c2a1c5cf91
md" ## LagrangeInterpolantGenerator.jl"

# ╔═╡ 97e64f8b-18a2-42dd-8872-2acd7983fe09
md" ##### See `https://discourse.julialang.org/t/lagrange-interpolation-function-generator` and the comments on that post. See also the BaricentricInterpolation.jl README example notebook."

# ╔═╡ 19161060-226e-4469-b13c-ca41a8eace3f
function LagrangeInterpolantGenerator(xvals, yvals)
	function LagrangeInterpolant(x)
		numvalstoevaluate = length(x)
        numvalstoevaluate == 1 ? output = 0 : output = zeros(numvalstoevaluate)
        for k = 1:numvalstoevaluate
            N = length(xvals)
            LagrangePolynomials = ones(N)
            for i in 1:N
				# Surprisingly, this works even in the i=1 and i=N cases.
                for j in [1:i-1;i+1:N]     
                    LagrangePolynomials[i] = LagrangePolynomials[i].*(x[k] -
						xvals[j])./(xvals[i]-xvals[j])
                end
            end
            numvalstoevaluate == 1 ? output = sum(LagrangePolynomials.*yvals) : 
				output[k] = sum(LagrangePolynomials.*yvals)
        end
        return output
    end
    return LagrangeInterpolant
end

# ╔═╡ e4e3e4de-2dbe-4a0d-9589-fb8456781a73
interpolantfunc = LagrangeInterpolantGenerator([1.0,2.0,3.0],[4.0,2.0,8.0]);

# ╔═╡ 748369b7-3df8-4bed-a125-fa812a92ed1c
interpolantfunc(2.0)   #returns 2.0

# ╔═╡ 782ca358-0a1c-4a79-9221-e40155071c82
interpolantfunc(3.0)   #returns 8.0

# ╔═╡ 6f11d927-1924-4a77-8537-050341b76cbe
interpolantfunc(2.5)   #returns 5.375

# ╔═╡ ccf3b050-7cac-41c4-baf4-c6e535590742
md" ## End of LagrageInterpolantGenerator.jl"

# ╔═╡ Cell order:
# ╟─cea30482-e74a-41b0-bdc5-17c2a1c5cf91
# ╠═97e64f8b-18a2-42dd-8872-2acd7983fe09
# ╠═19161060-226e-4469-b13c-ca41a8eace3f
# ╠═e4e3e4de-2dbe-4a0d-9589-fb8456781a73
# ╠═748369b7-3df8-4bed-a125-fa812a92ed1c
# ╠═782ca358-0a1c-4a79-9221-e40155071c82
# ╠═6f11d927-1924-4a77-8537-050341b76cbe
# ╟─ccf3b050-7cac-41c4-baf4-c6e535590742
