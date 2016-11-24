using Symata

function symtest1(n, f)
  r = Symata.exfunc(parse("$(f)"))
  Symata.setsymval(:rf, r)
  r
end

r = symtest1(3, "x^n")
println("r = $r") 
    
# Not quite sure how to convert r above into a Julia function.
# If r is a String we can just parse:

function symtest2()
  @sym F(x_) := J(parse("(2x)^n"))
  @sym SetJ(r1, ToString(F(x)))
end

symtest2()
@eval f1(x, n) = $(parse(r1))

f1(5, 3) |> display
println()

# Now I want to pass in the string in J(parse("...")):
#=
function symtest3(n, f)
  Symata.setsymval(:fi, f)
  r = Symata.exfunc(parse("ToString(Unpack(fi))"))    # ?????????
  r
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
=#