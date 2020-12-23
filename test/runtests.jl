using NumericalMethodsforEngineers
using Test

# write your own tests here

code_tests = [
  # Ch01 tests
  "ch01_nmex.jl",
  
  # Ch02 tests
  "ch02_lufac.jl",
  "ch02_ldlt.jl",
  #"ch02_SymmetricBandedMatrix.jl",
  #"ch02_SkylineMatrix.jl",
  "ch02_gaussian.jl",
  "ch02_penalized.jl",
  "ch02_jacobi.jl",
  "ch02_bicgstab.jl",                            # Initial version of bicgstab
  
  # Ch03 tests
  # Ch04 tests
  
  #"ch04_symata.jl",
  
  # Ch05 tests
  
  # Ch06 tests
  "ch06_p6.2.jl",
  
  # Ch07 tests
  "ch07_ivp_ex7.3.jl",                            # Four direct methods
  "ch07_bvp_ex7.4a.jl",                           # Shooting method example 7.4a
  "ch07_bvp_ex7.4b.jl",                           # Shooting method example 7.4b
  
  #=
  # Symata Weighted Residual Method tests
  "wrm_with_using_symata.jl",
  "wrm_with_using_nmfe.jl",
  "../examples/ch07/WRM/Ex.7.13.jl",              # 1 point LagrangePolynomial
  "../examples/ch07/WRM/Ex.7.14.jl",              # 2 point LagrangePolynomial
  "../examples/ch07/WRM/Ex.7.15.jl",              # 1 point collocation  
  "../examples/ch07/WRM/Ex.7.15b.jl",             # 2 point collocation  
  "../examples/ch07/WRM/Ex.7.16.jl",              # 1 point subdomain
  "../examples/ch07/WRM/Ex.7.16b.jl",             # 2 point subdomain
  "../examples/ch07/WRM/Ex.7.17.jl",              # 1 point least-squares
  "../examples/ch07/WRM/Ex.7.17b.jl",             # 2 point least-squares
  "../examples/ch07/WRM/Ex.7.18.jl",              # 1 point galerkin
  "../examples/ch07/WRM/Ex.7.18b.jl",             # 2 point galerkin
  =#

  # Ch08 tests
  #"ch08_ex01.jl",
  
  # Extra tests
  #"vianello_symata.jl"                           # Vianello procedure
  
]

println("Running tests:")

@testset "NumericalMethodsforEngineers.jl" begin
  for my_test in code_tests
      println("\n  * $(my_test) *")
      include("$(my_test)")
  end
  println()
end