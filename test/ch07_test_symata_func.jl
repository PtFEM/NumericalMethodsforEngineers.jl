using NMfE

function symtest(n)
    r = Symata.exfunc(parse("x^$n"))
    #Symata.symprintln(r)
    r
end

r = symtest(3)
println("r = $r")     

# Not quite sure how to convert r above to a Julia function.
# Works great if I return a String that I can parse() in Julia:

function symtest2(n)
  @sym f(x_) := J(parse("(2x)^n"))
  @sym SetJ(r1, ToString(f(x)))
end

symtest2(4)
println("\nr1 = $r1\n")
@eval f1(x, n) = $(parse(r1))

f1(5, 3) |> display
println()

# Now I want to pass in the string in J(parse("...")):

function symtest3(n, f)
  Symata.setsymval(:fi, f)
  Symata.exfunc(parse("ToString(Unpack(fi))"))    # ?????????
end

r2 = symtest3(4, "(3x)^n")
@eval f2(x, n) = $(parse(r2))

f2(5, 3) |> display
println()

# What I'm really looking for:

fstr = """
  Module([], 
    begin
      (4x)^n
    end
  )
"""
r3 = symtest3(4, fstr)
@eval f3(x, n) = $(parse(r3))

f3(5, 3) |> display
println()

xi = [0, 1/2, 1]
yi = [0, 6, 10]

function lp(xi, yi)
  @sym SetJ(r3, ToString(lagrangepolynomial(xi, yi)))
end

println(r3)