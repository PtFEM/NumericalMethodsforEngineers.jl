using NMfE

a = [16. 4. 8.; 4. 5. -4.; 8. -4. 22.]
b = [16., 18., -22.]

upper = chol(a)
upper |> display

lower = upper'

y = lower \ b

c = upper \ y

