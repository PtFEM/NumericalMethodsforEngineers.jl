module NumericalMethodsforEngineers

using Documenter
using IterativeSolvers
import Symata: @sym, setsymata, getsymata, symeval
#using BandedMatrices

# package code goes here
### Imports ###

### Includes ###
# Type definitions in nmlib
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "SkylineMatrices.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "SymmetricBandedMatrices.jl"))
# Direct methods in nmlib
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "checkit.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "nmex.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "chobac.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "cholin.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "ldlfor.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "ldlt.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "lufac.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "sparin.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "spabac.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "subbac.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "subfor.jl"))
include(Pkg.dir("NumericalMethodsforEngineers", "src", "nmlib", "bicgstab.jl"))
# Iterative methods in ch02
#include(Pkg.dir("NumericalMethodsforEngineers", "src", "ch02", "bicgstabl.jl"))
# Initial Value methods
include(Pkg.dir("NumericalMethodsforEngineers", "src", "ch05", "lagrangianpolynomial.jl"))
# Initial Value methods
include(Pkg.dir("NumericalMethodsforEngineers", "src", "ch07", "ivp.jl"))
# Boundary Value methods
include(Pkg.dir("NumericalMethodsforEngineers", "src", "ch07", "bvp.jl"))
# Symata functions
include(Pkg.dir("NumericalMethodsforEngineers", "src", "ch07", "sym_fcns.jl"))

### Exports ###

export
  # nmlib (types)
  SkylineMatrix,
  fromskyline,
  SymmetricBandedMatrix,
  tosymmetricbandedmatrix,
  # nmlib (functions)
  nmex,
  checkit,
  bicgstab,
  chobac!,
  cholin!,
  ldlt!,
  ldltfac!,
  ldlfor!,
  lufac,
  sparin!,
  spabac!,
  subbac!,
  subfor!,
  # ch05
  lagrangianpolynomial,
  # ch07
  euler,
  modified_euler,
  mid_point_euler,
  runga_kutta_4,
  shootingmethod,
  bigcstab

### Deprecated ###
  
  include("deprecated.jl")

end # module
