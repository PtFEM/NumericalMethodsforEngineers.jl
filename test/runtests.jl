using NMfE
using Base.Test

# write your own tests here

code_tests = [
  # Ch01 tests
  "ch01_nmex.jl",
  # Ch02 tests
  "ch02_lufac.jl",
  "ch02_ldlt.jl",
  "ch02_gaussian.jl",
  "test_bicgstab.jl",         # Initial version of bicgstab
  # Ch03 tests
  # Ch04 tests
  # Ch05 tests
  # Ch06 tests
  "test_ivp_ex7.3.jl",        # Four direct methods
  "test_bvp_ex7.4a.jl",       # Shooting method example 7.4a
  "test_bvp_ex7.4b.jl"        # Shooting method example 7.4b
  # Ch07 tests
]

println("Running tests:")

for my_test in code_tests
    println("\n  * $(my_test) *")
    include(my_test)
end

