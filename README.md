# NumericalMethodsforEngineers

| **Project Status**          |  **Build Status** |  **Doce stable** |  **Doce dev** |
|:---------------------------:|:-----------------:|:----------------:|:-------------:|
|![][project-status-img] | ![][CI-build] |

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://stanjulia.github.io/NumericalmethodsForEngineers.jl/latest

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://stanjulia.github.io/StanSample.jl/stable

[CI-build](https://github.com/ptfem/NumericalMethodsForEngineers.jl/workflows/CI/badge.svg?branch=master)

[project-status-img]: https://img.shields.io/badge/lifecycle-wip-orange.svg

## Julia versions of NumericalMethodsforEngineers programs

More or less equivalent Julia versions of the Fortran programs described in "Numerical Methods for Engineers" by I M Smith and D V Griffiths.

Currently being tested on Julia v1+.

No timeline is set to complete this work.

### Vesion 2.0.0

As Symata no longer works for several of the examples, I've decided to switch to Symbolics.jl. At the same time I'll flip the focus by presenting the NMFE functions after showing the same using Julia equivalents. Finally, I'll switch to using Pluto notebooks as the primary REPL/display environment. Use of PyCall (for Symata) will be discontinued in this package.

### Version 1.2

Latest version using Julia versions of nmlib.
