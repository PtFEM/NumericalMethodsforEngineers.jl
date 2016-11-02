using RadauBVP, Plots
pyplot()

ProjDir = dirname(@__FILE__)
cd(ProjDir) do

  if !isdefined(Main, :bc!)
    function bc!(y0, yn, r)
      r[1] = y0[1] - 0.0
      r[2] = yn[2] - (-1.0)
    end

    function dbc!(y0, yn, jac)
      jac[:,:] = 0.0
      jac[1,1] = 1.0
      jac[2,4] = 1.0
    end

    function odeeq!(t, y, dydt)
      dydt[1] = y[2]
      dydt[2] = -y[1]
    end

    function dodeeq!(t, y, jac)
      jac[1,1] = 0.0
      jac[1,2] = 1.0
      jac[2,1] = -1.0
      jac[2,2] = 0.0
    end
  end

  nt = 5
  const y0 = zeros(Float64, (2, 3*(nt-1)+1))

  for n=1:3*(nt-1)+1
    y0[:, n] = [0.0, 1.0]
  end

  @time (conv, ttot, ytot, result) = 
    RadauBVP.radau3(bc!, odeeq!, dbc!, dodeeq!, y0, 0.0, convert(Float64, π))

  result |> display
  
  yres = ytot[1,:]
  vres = ytot[2,:]

  let t = linspace(0.0, π, 100)
    
    global possol = sin.(t)
    global vsol = cos.(t)
    global ysol = Array(Float64, 2*100)
    
    ysol[1:2:end-1] = possol
    ysol[2:2:end] = vsol
  end

  p1 = plot(
  linspace(0.0, π, 100),
  possol,
  title = "Coordinate (n = $nt)",
  label = "Exact")
  plot!(ttot, yres, label = "Numerical", linetype = :scatter)


  p2 = plot(
  linspace(0.0, π, 100),
  vsol,
  title = "Velocity (n = $nt)",
  label = "Exact")
  plot!(ttot, vres, label = "Numerical", linetype = :scatter)

  plot(p1,p2)
  savefig("radau.png")
  plot(p1,p2)

end