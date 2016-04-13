module NMfE

#using Docile, Lexicon
using IterativeSolvers

if !isdefined(Main, :JULIA_SVG_BROWSER)
  JULIA_SVG_BROWSER = ""
  try
    JULIA_SVG_BROWSER = ENV["JULIA_SVG_BROWSER"]
  catch e
    println("Environment variable JULIA_SVG_BROWSER not found.")
    JULIA_SVG_BROWSER = ""
  end
end

export
  JULIA_SVG_BROWSER
       
# package code goes here
### Imports ###

### Includes ###
include(Pkg.dir("NMfE", "src", "NMfE", "fromSkyline.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "skyline2sparse.jl"))
# Illustration in ch01 (based on ch04)
include(Pkg.dir("NMfE", "src", "NMfE", "ch01", "nmex.jl"))
# Direct methods in ch02
include(Pkg.dir("NMfE", "src", "NMfE", "ch01", "checkit.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "lufac.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "subbac.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "subfor.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "ldlfor.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "ldlt.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "sparin.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "spabac.jl"))
# Iterative methods in ch02
include(Pkg.dir("NMfE", "src", "NMfE", "ch02", "bicgstab.jl"))
# Initial Value methods
include(Pkg.dir("NMfE", "src", "NMfE", "ch07", "ivp.jl"))
# Boundary Value methods
include(Pkg.dir("NMfE", "src", "NMfE", "ch07", "bvp.jl"))

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
