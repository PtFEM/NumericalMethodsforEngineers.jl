using NumericalMethodsforEngineers, IterativeSolvers

a = [10. 1. -5.; -20. 3. 20.; 5. 3. 5.]
b = [1., 2., 6.]

c = a \ b

println("\nSolution Vector: $c")
