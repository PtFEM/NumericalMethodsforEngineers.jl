using NumericalMethodsforEngineers, Plots

ProjDir = dirname(@(__FILE__))

#
# Compute all ytildes:
#
cd(ProjDir) do
  include(joinpath(Pkg.dir("NumericalMethodsforEngineers"), "test", "ch07_wrm.jl")) 
  
  y_exact(x) = 7/4*(exp(2x)-exp(-2x))/(exp(2)-exp(-2))-3/4*x

  ytildes_1pt = [
    (x) -> ytilde_1pt_collocation(x) - y_exact(x),
    (x) -> ytilde_1pt_subdomain(x) - y_exact(x),
    (x) -> ytilde_1pt_leastsquares(x) - y_exact(x),
    (x) -> ytilde_1pt_galerkin(x) - y_exact(x)
  ]

  ytildes_2pt = [
    (x) -> ytilde_2pt_collocation(x) - y_exact(x),
    (x) -> ytilde_2pt_subdomain(x) - y_exact(x),
    (x) -> ytilde_2pt_leastsquares(x) - y_exact(x),
    (x) -> ytilde_2pt_galerkin(x) - y_exact(x)
  ]

  labels_1pt = ["ytilde_1pt_collocation", "ytilde_1pt_subdomain",
    "ytilde_1pt_leastsquares", "ytilde_1pt_galerkin"];

  p1 = plot()
  for (i, f) in enumerate(ytildes_1pt)
    lab = labels_1pt[i]
    if i == 1
      p1 = plot(f, 0, 1, label=lab, ylabel="ÿ - y")
    else
      plot!(p1, f, 0, 1, label=lab)
    end
  end

  labels_2pt = ["ytilde_2pt_collocation", "ytilde_2pt_subdomain",
    "ytilde_2pt_leastsquares", "ytilde_2pt_galerkin"];

  p2 = plot()
  for (i, f) in enumerate(ytildes_2pt)
    lab = labels_2pt[i]
    if i == 1
      p2 = plot(f, 0, 1, label=lab, xlabel="x", ylabel="ÿ - y")
    else
      plot!(p2, f, 0, 1, label=lab)
    end
  end

  p = plot(
    p1, p2, layout=(2, 1), link=:both, leg=true
  )
  savefig("Fig.7.14.png")

end