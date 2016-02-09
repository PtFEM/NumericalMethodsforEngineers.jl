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
include(Pkg.dir("NMfE", "src", "NMfE", "lufac.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ldlt.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ivp.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bvp.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bicgstab.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bicgstabl.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bicgstab_left_precond.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bicgstab_right_precond.jl"))

### Exports ###

export
  # From NMfE
  fromSkyline,
  skyline2sparse,
  lufac,
  ldlt,
  euler,
  modified_euler,
  mid_point_euler,
  runga_kutta_4,
  shootingmethod,
  bigcstab,
  bicgstabl!,
  bicgstab_left_precond!,
  bicgstab_right_precond!

### Deprecated ###
  
  include("deprecated.jl")

end # module
