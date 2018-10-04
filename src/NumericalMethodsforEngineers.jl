module NumericalMethodsforEngineers

using Documenter
using IterativeSolvers
using Reexport
@reexport using Symata, SparseArrays, LinearAlgebra, Compat

#using BandedMatrices

# package code goes here
### Imports ###
import Symata: @sym, setsymata, getsymata, symeval

### Includes ###
# Type definitions in nmlib
include("nmlib/SkylineMatrices.jl")
include("nmlib/SymmetricBandedMatrices.jl")
# Direct methods in nmlib
include("nmlib/checkit.jl")
include("nmlib/nmex.jl")
include("nmlib/chobac.jl")
include("nmlib/cholin.jl")
include("nmlib/ldlfor.jl")
include("nmlib/ldlt.jl")
include("nmlib/lufac.jl")
include("nmlib/sparin.jl")
include("nmlib/spabac.jl")
include("nmlib/subbac.jl")
include("nmlib/subfor.jl")
include("nmlib/bicgstab.jl")
# Iterative methods in ch02
#include("ch02", "bicgstabl.jl"))
# Initial Value methods
include("ch05/lagrangianpolynomial.jl")
# Initial Value methods
include("ch07/ivp.jl")
# Boundary Value methods
include("ch07/bvp.jl")
# Symata functions
include("ch07/sym_fcns.jl")

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
  bigcstab,
  
  # Symata
  @sym, 
  setsymata, 
  getsymata, 
  symeval
  

### Deprecated ###
  
  include("deprecated.jl")

end # module
