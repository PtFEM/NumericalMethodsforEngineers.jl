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
include(Pkg.dir("NMfE", "src", "NMfE", "Ch02", "lufac.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "Ch02", "subbac.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "Ch02", "subfor.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ldlt.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "ivp.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bvp.jl"))
include(Pkg.dir("NMfE", "src", "NMfE", "bicgstab.jl"))

### Exports ###

export
  # From NMfE
  fromSkyline,
  skyline2sparse,
  # Ch02
  lufac,
  subbac!,
  subfor!,
  ldlt,
  euler,
  modified_euler,
  mid_point_euler,
  runga_kutta_4,
  shootingmethod,
  bigcstab

### Deprecated ###
  
  include("deprecated.jl")

end # module
