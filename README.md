# NumericalMethodsforEngineers

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip) | [CI-build]: https://github.com/PtFEM/NumericalMethodsforEngineers.jl/workflows/CI/badge.svg?branch=master

## Julia versions of NumericalMethodsforEngineers programs

More or less equivalent Julia versions of the Fortran programs described in "Numerical Methods for Engineers" by I M Smith and D V Griffiths.

Currently being tested on Julia v1+.

No timeline is set to complete this work.

### Vesion 2.0.0

As Symata no longer works for several of the examples, I've decided to switch to Symbolics.jl. At the same time I'll flip the focus by presenting the NMFE functions after showing the same using Julia equivalents. Finally, I'll switch to using Pluto notebooks as the primary REPL/display environment. Use of PyCall (for Symata) will be discontinued in this package.

### Version 1.2

Latest version using Julia versions of nmlib.
