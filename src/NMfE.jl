module NMfE

#using Docile, Lexicon
using IterativeSolvers

# package code goes here
### Imports ###

### Includes ###
include(Pkg.dir("NMfE", "src", "fromSkyline.jl"))
include(Pkg.dir("NMfE", "src", "skyline2sparse.jl"))
# Illustration in ch01 (based on ch04)
include(Pkg.dir("NMfE", "src", "ch01", "checkit.jl"))
include(Pkg.dir("NMfE", "src", "ch01", "nmex.jl"))
# Direct methods in ch02
include(Pkg.dir("NMfE", "src", "ch02", "lufac.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "subbac.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "subfor.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "ldlfor.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "ldlt.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "sparin.jl"))
include(Pkg.dir("NMfE", "src", "ch02", "spabac.jl"))
# Iterative methods in ch02
include(Pkg.dir("NMfE", "src", "ch02", "bicgstab.jl"))
# Initial Value methods
include(Pkg.dir("NMfE", "src", "ch07", "ivp.jl"))
# Boundary Value methods
include(Pkg.dir("NMfE", "src", "ch07", "bvp.jl"))

### Exports ###

export
  # From NMfE
  fromSkyline,
  skyline2sparse,
  # ch01
  nmex,
  checkit,
  # ch02
  lufac,
  subbac!,
  subfor!,
  ldlt!,
  ldltfac!,
  ldlfor!,
  sparin!,
  spabac!,
  # ch0?
  euler,
  modified_euler,
  mid_point_euler,
  runga_kutta_4,
  shootingmethod,
  bigcstab

### Deprecated ###
  
  include("deprecated.jl")

end # module
