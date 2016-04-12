using NMfE
using Base.Test

# write your own tests here

code_tests = [
  # Ch01 tests
  "test_nmex.jl",
  # Ch02 tests
  "test_lufac.jl",
  "test_ldlt.jl",
  # Ch03 tests
  "test_bicgstab.jl",         # Initial version of bicgstab
  "test_ivp_ex7.3.jl",        # Four direct methods
  "test_bvp_ex7.4a.jl",       # Shooting method example 7.4a
  "test_bvp_ex7.4b.jl"        # Shooting method example 7.4b
]

println("Running tests:")

for my_test in code_tests
    println("\n  * $(my_test) *")
    include(my_test)
end

