using NMfE
using Base.Test

# write your own tests here

code_tests = [
  # Ch01 tests
  "ch01_nmex.jl",
  # Ch02 tests
  "ch02_lufac.jl",
  "ch02_ldlt.jl",
  "ch02_SymmetricBandedMatrix.jl",
  "ch02_SkylineMatrix.jl",
  "ch02_gaussian.jl",
  "ch02_penalized.jl",
  "ch02_jacobi.jl",
  "ch02_bicgstab.jl",         # Initial version of bicgstab
  # Ch03 tests
  # Ch04 tests
  # Ch05 tests
  # Ch06 tests
  "ch06_p6.2.jl",
  # Ch07 tests
  "ch07_ivp_ex7.3.jl",        # Four direct methods
  "ch07_bvp_ex7.4a.jl",       # Shooting method example 7.4a
  "ch07_bvp_ex7.4b.jl",       # Shooting method example 7.4b
  "ch07_wrm.jl"              # Symata Weighted Residual Method tests
  # Ch08 tests
  #"ch08_ex01.jl"
]

println("Running tests:")

for my_test in code_tests
    println("\n  * $(my_test) *")
    include(my_test)
end

if VERSION <= v"0.6.0"
  println("\n  * ch07_wrm.jl *")
  include("ch07_wrm.jl")        # Symata Weighted Residual Method tests
end  