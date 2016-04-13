xs = collect(1:12)
ys = xs + rand(12)

titles = ["Euler", "Modified_Euler", "Mid_Point_Euler", "Runga_Kutta_4"]

plot(
  layer(x=xs, y=ys, Geom.line,
    Theme(default_color=colorant"darkred")),
  layer(x=xs, y=ys+1, Geom.line,
    Theme(default_color=colorant"red")),
  layer(x=xs, y=ys+2, Geom.line,
    Theme(default_color=colorant"darkblue")),
  layer(x=xs, y=ys+3, Geom.line,
    Theme(default_color=colorant"darkgreen")),
  Guide.xlabel("x", orientation=:horizontal),
  Guide.ylabel("y", orientation=:vertical),
  Guide.title("Four ODE one-step methods on y'=(x + y)/x"))

plot(
  layer(x=xs, y=ys-0.5, Geom.line,
    color=repeat([symbol(titles[1])], inner=[1])),
  layer(x=xs, y=ys-1, Geom.line,
    color=repeat([symbol(titles[2])], inner=[2])),
  layer(x=xs, y=ys-2, Geom.line,
    color=repeat([symbol(titles[3])], inner=[3])),
  layer(x=xs, y=ys-3, Geom.line,
    color=repeat([symbol(titles[4])], inner=[4])),
  Scale.color_discrete_manual("darkred", "red","green","blue"),
  Guide.colorkey("Legend"),
  Guide.xlabel("x", orientation=:horizontal),
  Guide.ylabel("y", orientation=:vertical),
  Guide.title("Four ODE one-step methods on y'=(x + y)/x"))

