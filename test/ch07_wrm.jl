using NMfE
using Base.Test

PkgDir = Pkg.dir("NMfE", "examples", "ch07", "WRM")
ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  tests = [
    "Ex.7.13.jl",   # 1 point lagrangepolynomial
    "Ex.7.14.jl",   # 2 point lagrangepolynomial
    "Ex.7.15.jl",   # 1 point collocation  
    "Ex.7.15b.jl",  # 2 point collocation  
    "Ex.7.16.jl",   # 1 point subdomain
    "Ex.7.16b.jl",  # 2 point subdomain
    "Ex.7.17.jl",   # 1 point least-squares
    "Ex.7.17b.jl",  # 2 point least-squares
    "Ex.7.18.jl",   # 1 point galerkin
    "Ex.7.18b.jl"   # 2 point galerkin
  ]

  for test in tests
      println("\n\t  * $(test) *\n")
      include(joinpath(PkgDir, test))
  end
end