using NMfE, Plots

ProjDir = dirname(@(__FILE__))

#
# Compute all ytildes:
#
cd(ProjDir) do
  include(joinpath(Pkg.dir("NMfE"), "test", "ch07_wrm.jl")) 
  
  y_exact(x) = 7/4*(exp(2x)-exp(-2x))/(exp(2)-exp(-2))-3/4*x

  ytildes_1pt = [
    (x) -> y_exact(x) - ytilde_1pt_collocation(x),
    (x) -> y_exact(x) - ytilde_1pt_subdomains(x),
    (x) -> y_exact(x) - ytilde_1pt_leastsquares(x),
    (x) -> y_exact(x) - ytilde_1pt_galerkin(x)
  ]

  ytildes_2pt = [
    (x) -> y_exact(x) - ytilde_2pt_collocation(x),
    (x) -> y_exact(x) - ytilde_2pt_subdomains(x),
    (x) -> y_exact(x) - ytilde_2pt_leastsquares(x),
    (x) -> y_exact(x) - ytilde_2pt_galerkin(x)
  ]

  labels_1pt = ["ytilde_1pt_collocation", "ytilde_1pt_subdomains",
    "ytilde_1pt_leastsquares", "ytilde_1pt_galerkin"];

  p1 = plot()
  for (i, f) in enumerate(ytildes_1pt)
    lab = labels_1pt[i]
    if i == 1
      p1 = plot(f, 0, 1, label=lab)
    else
      plot!(p1, f, 0, 1, label=lab)
    end
  end

  labels_2pt = ["ytilde_2pt_collocation", "ytilde_2pt_subdomains",
    "ytilde_2pt_leastsquares", "ytilde_2pt_galerkin"];

  p2 = plot()
  for (i, f) in enumerate(ytildes_2pt)
    lab = labels_2pt[i]
    if i == 1
      p2 = plot(f, 0, 1, label=lab)
    else
      plot!(p2, f, 0, 1, label=lab)
    end
  end

  p = plot(
    p1, p2, layout=(2, 1), link=:both, leg=true
  )
  savefig("Fig.7.14.png")

end