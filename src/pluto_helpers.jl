LATEXIFY(x) = md"$(latexify(x))"

LATEXIFY(s::AbstractString, x) = md"$(s) $(latexify(x))"

L = LATEXIFY

export LATEXIFY, L