using NMfE
using Base.Test

@sym f([0, 1//2, 1], [0, a, 1]);

res = parse(r)