using SymbolicUtils: Sym, FnType, Term, Add, Mul, Pow, symtype, operation, arguments
using SymbolicUtils
using IfElse: ifelse
using Test

@syms w::Real z::Real a::Real b::Real x

addr = addr = Add(Real, 10, Dict(w=>1, z=>1))

substitute(addr, Dict(w=>1, z=>3.0)) |> display

fieldnames(typeof(addr)) |> display

addr.coeff |> display
